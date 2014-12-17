# PELT algorithm general

# now have to get chpts at end STILL TO DO

function PELT_general( segment_cost::Function , n::Int64, pen::Float64 = 0.0 )

    # if we havent specified beta make it BIC penalty 
    if pen == 0.0
        pen = log(n)
    end
   
    # F[t] is optimal cost of segmentation upto time t
    F = Array(Float64, n)
    F[1] = - pen
    # last chpt prior to time t 
    chpts =  Array(Int64, n)
    chpts[1] = 0
    # vector of candidate chpts at t 
    R = Array(Int64, 1)
    R = [1]

    for t in 2:n
        cpt_cands = R
        seg_costs = Array(Float64, length(cpt_cands))
        for i in 1:length(cpt_cands)
            seg_costs[i] = segment_cost(cpt_cands[i], t)
        end
        
        F[t] , tau = findmin( F[cpt_cands] + seg_costs + pen )
        chpts[t] = cpt_cands[tau]  
        
        # pruning step 
        ineq_prune = F[cpt_cands] + seg_costs .< F[t]
        R =  push!( cpt_cands[ineq_prune] , t )
        
    end

    # get changepoints
    CP = Array(Int64,0)
    last = chpts[n]
    push!(CP,last)
    while last > 1
      last = chpts[last]
      push!(CP,last)
    end
    sort!(CP)  

    return CP , F[n] 

end
