@doc """
# Description
Runs the CROPS algorithm using a specified cost function for a given minimum and maximum penalty value to find a range of segmentations

# Arguments
* `segment_cost::Function`: Calculates cost between two specified indices
* `n::Int`: Length of time series
* `pen::(Real,Real)`: This is the minimum and maximum penalty values 

# Usage
CROPS(cost_function(data, distribtion), length(data), penalty = (pen1, pen2))
Can also call using the macro @PELT data Segment_cost(?) pen1 pen2 Penalty where the ? replaces the parameter which changes.  For example to find a change in mean in data distributed from a Normal distribution with minimum penalty equal to log(n) and maximum penalty equal to 4log(n) we would use
 @PELT data Normal(?, σ) log(n) 4log(n)

Choices of distribution are Normal(?, σ), Normal(μ, ?), Normal(?, ?), Exponential, Poisson, Gamma(?, beta), Gamma(alpha, ?) and Nonparametric

# Returns
* `(CP::Vector{Int}, cost::Float64)`:
  * `CP::Vector{Int}`: Vector of indices of detected changepoints
  * `cost::Float64`: Cost of optimal segmentation

# Example
Below is an example of a change in mean in normal data 
n = 1000       
λ = 100        
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
pelt_cps, pelt_cost = @PELT sample Normal(?, σ) log(n) 4*log(n)

# See also
@PELT

#References

Haynes, K., Eckley. I.A., and Fearnhead, P., (2014) Efficient penalty search for multiple changepoint problems arXiv:1412.3617

""" ->
function CROPS(segment_cost::Function , n::Int64, pen::Tuple{Real,Real} )

    pen_interval = [ minimum(pen) , maximum(pen) ]

    # these are what we output
    out_num_cpts = Array(Int64,0)
    out_max_pen = Array(Float64,0)
    out_constrain = Array(Float64,0)
    out_cpts = Array(Array{Int64},0) 
   
    while true

        stop = 0

        if length(pen_interval) > 0

            # do PELT and record no of chpts and                        
            # calculates the cost of the constrained problem
            for i in 1:length(pen_interval)

                # do PELT for each pen_interval
                cpts , opt = PELT( segment_cost , n , pen=pen_interval[i] )
               
                # if there are already same no of chpts in out 
                # see if penalty differentx
                if ( in(  length(cpts) , out_num_cpts ) )
                    index = findin(out_num_cpts,length(cpts))[1]
                 
                    # check for penalty is it bigger than max penalty
                    if pen_interval[i] > out_max_pen[index]
                        out_max_pen[index] = pen_interval[i]
                    else
                        # no change
                        stop+=1
                    end
                    
                else
                    # number of chpts not seen before add to output and constrained likelihood

                    push!( out_num_cpts , length(cpts) )
                    push!( out_constrain , opt - (length(cpts)-1)*pen_interval[i] )
                    push!( out_max_pen , pen_interval[i])
                    push!( out_cpts, cpts) 
            
                   
                end         
                
            end
	# end of if length(pen_interval) > 0
        end
        
      
        # leave loop and finish subject to output if no changes
        if stop == length(pen_interval)
            break
        end

        # look through out_num_cpts and calc beta_int and put these in pen_interval
        ord_ind = sortperm(out_num_cpts)
        out_num_cpts = out_num_cpts[ord_ind]
        out_constrain = out_constrain[ord_ind]
        out_max_pen = out_max_pen[ord_ind]
        out_cpts = out_cpts[ord_ind]
        
        # make pen_interval 
        pen_interval = Array(Float64,0)
        
        for i in 1:(length(out_num_cpts)-1) 

            # if they differ by 1, then just calc beta_int and extend range of pen for large no of chpts
            if out_num_cpts[i] ==  out_num_cpts[i+1] + 1
                beta_int =  (out_constrain[i+1] - out_constrain[i])
                out_max_pen[i] = beta_int
	    else
                # difference in no of chpts is >= 1 so add to pen_interval to check how many
                beta_int =  ( out_constrain[i+1] - out_constrain[i] )/( out_num_cpts[i] - out_num_cpts[i+1] )
                push!( pen_interval , beta_int )
             end
            
        end

       if length(pen_interval) > 0
           i = 1
           while i <= length(pen_interval)
               for j in 1:length(out_max_pen) 
                   if abs(pen_interval[i] - out_max_pen[j]) < 1e-2
                       splice!(pen_interval,i)
                       i = i - 1
                       break
                   end
               end
               i = i + 1
           end
           
       end
              

    # end of while loop    
    end

    # Calculate beta intervals
    nb = length(out_max_pen)
    beta_e= Array(Float64,0)
    beta_int = Array(Float64,0)
    sort_out_max_pen = sort(out_max_pen);
    sort_out_constrain = sort(out_constrain);
    sort_out_num_cpts = sort(out_num_cpts, rev = true);
    
    for k in 1:nb
        if k == 1
            beta_int = push!(beta_int, sort_out_max_pen[1])
        
        else 
            beta_int = push!(beta_int, beta_e[k-1])
        end
        
   
        if k == nb
            beta_e = push!(sort_out_max_pen[k])
   
        else
            beta_e = push!(beta_e,(sort_out_constrain[k] - sort_out_constrain[k+1])/(sort_out_num_cpts[k+1] - sort_out_num_cpts[k]))
        end
    end
        
    # organise output into a dictionary
    out = Dict{ASCIIString, Array}()
    out["number"] = out_num_cpts
    out["penalty"] = sort(beta_int, rev = true)
    out["constrained"] = out_constrain
    out["changepoints"] = out_cpts
    return out

end
