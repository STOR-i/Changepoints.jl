# PELT for a range of penalties -- Make more efficient by recylcling comps , style of output?
# see http://arxiv.org/pdf/1412.3617.pdf

function PELT_range_of_penalties(segment_cost::Function , n::Int64, pen::Array(Float64,2))

    pen_ranges = [ minimum(pen) , maximum(pen) ]

    # output dictionary
    out = ["no of chpts"=> Array(Int64,0), "penalty"=> Array((Float64,Float64),0), "optimum"=>  Array((Float64,Float64),0)]

    while length(pen_ranges) > 0 

        beta0 = pen_ranges[1]
        beta1 = pen_ranges[2]
        cpts_beta0 , opt_beta0 = PELT_general( segment_cost , n , beta0 )
        cpts_beta1 , opt_beta1 = PELT_general( segment_cost , n , beta1 )
        m0 = length(cpts_beta0)
        m1 = length(cpts_beta1)
    
        if m0 == m1
            # same no of chpts
            push!( out["no of chpts"] , m0  )
            push!( out["penalty"] , ( beta0  , beta1 )   )
            push!( out["optimum"] , ( opt_beta0  , opt_beta1 )   )
            # remove first two elements
            pen_ranges = pen_ranges[3:end]
        
        elseif m0 == m1 + 1
            # no of chpts differs by 1
            # find regions of penalty that give you required no of chpts
            # beta_int is intersection of lines
            beta_int = ( opt_beta1 - opt_beta0 + beta0*(m0 + 1) - beta1*(m1 + 1) )/(m0 - m1)
            push!( out["no of chpts"] , m0 , m1 )          
            push!( out["penalty"] , ( beta0  , beta_int ) , ( beta_int , beta1 )  )
            push!( out["optimum"] , ( opt_beta0  , opt_beta0 + (m0 + 1)*(beta_int - beta0) ) , ( opt_beta0 + (m0 + 1)*(beta_int - beta0), opt_beta1 )   )
            # remove first two elements
            pen_ranges = pen_ranges[3:end]
        
        else
            beta_int = ( opt_beta1 - opt_beta0 + beta0*(m0 + 1) - beta1*(m1 + 1) )/(m0 - m1)
            # do PELT at beta_int
            cpts_betaint , opt_betaint = PELT_general( segment_cost , n , beta_int )
            mint = length(cpts_betaint)
            if mint !== m1
                push!( pen_ranges , beta0 , beta_int , beta_int , beta1 )
            end
            # remove first two elements
            pen_ranges = pen_ranges[3:end]
        end

    end

    return out

end

