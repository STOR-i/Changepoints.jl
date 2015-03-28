# PELT for a range of penalties 
# see http://arxiv.org/pdf/1412.3617.pdf

function CROPS(segment_cost::Function , n::Int64, pen::(Real,Real) )

    pen_interval = [ minimum(pen) , maximum(pen) ]

    # these are what we output
    out_num_cpts = Array(Int64,0)
    out_max_pen = Array(Float64,0)
    out_constrain = Array(Float64,0)
    out_cpts = Array(Array{Int64},0) #Kaylea added
   
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
                    
                    # find the index #Kaylea added [1] at end of index for it to work 
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
                    push!( out_constrain , opt - length(cpts)*pen_interval[i] )
                    push!( out_max_pen , pen_interval[i])
                    push!( out_cpts, cpts) #Kaylea added
            
                   
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
        out_cpts = out_cpts[ord_ind] #Kaylea added
        
        # make pen_interval 
        pen_interval = Array(Float64,0) #Kaylea changed the type of pen_interval 
        
        for i in 1:(length(out_num_cpts)-1) #Kayea changed to -1

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

        # Kaylea added this part in to stop weird results 
       if length(pen_interval) > 0
           i = 1
           while i <= length(pen_interval)
               for j in 1:length(out_max_pen) 
                   if abs(pen_interval[i] - out_max_pen[j]) < 1e-1
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

    # organise output into a dictionary
    out = Dict{ASCIIString, Array}()
    out["number"] = out_num_cpts
    out["penalty"] = out_max_pen
    out["constrained"] = out_constrain
    out["changepoints"] = out_cpts
    return out

end


