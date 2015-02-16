# PELT for a range of penalties 
# see http://arxiv.org/pdf/1412.3617.pdf

function CROPS(segment_cost::Function , n::Int64, pen::Array{Float64} )

    pen_interval = [ minimum(pen) , maximum(pen) ]

    # these are what we output
    out_num_cpts = Array(Int64,0)
    out_max_pen = Array(Float64,0)
    out_constrain = Array(Float64,0)
  
    while true

        stop = 0

        if length(pen_interval) > 0

            # do pelt and record no of chpts and                        
            # calculates the cost of the constrained problem
            for i in 1:length(pen_interval)

                # do PELT for each pen_interval
                cpts , opt = PELT( segment_cost , n , pen_interval[i] )

                # if there are already same no of chpts in out 
                # see if penalty different
                if ( in(  length(cpts) , out_num_cpts ) )
                    
                    # find the index
                    index = findin(out_num_cpts,length(cpts))
                    
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
                    push!( out_max_pen , pen_interval[i) )
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
        # make pen_interval 
        pen_interval = []
        
        for i in 1:length(out_num_cpts)

            # if they differ by 1, then just calc beta_int and extend range of pen for large no of chpts
            if out_num_cpts[i] ==  out_num_cpts[i+1] + 1
                beta_int =  (out_constrain[i+1] - out_constrain[i])
                out_max_pen[i] = beta_int
	    else
                # difference in no of chpts is /= 1 so add to pen_interval to check how many
                beta_int =  ( out_constrain[i+1] - out_constrain[i] )/( out_num_cpts[i] - out_num_cpts[i+1] )
                push!( pen_interval , beta_int )
             end
            
        end

    # end of while loop    
    end

    # organise output into a dictionary
    out = Dict()
    out["number"] = out_num_cpts
    out["penalty"] = out_max_pen
    out["constrained"] = out_constrain
    return out

end


