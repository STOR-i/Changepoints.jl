# PELT algorithm general

# TO DO: MAKE MORE EFFICEINT - CHANGE R
#							 - CHANGE chpts vector RETURN different way look at killicks


function PELT_general( segment_cost::Function , n::Int64, pen::Float64 = 0.0 )
    # if we havent specified beta make it BIC penalty 
    if pen == 0.0
        pen = log(n)
    end
    
    # F[t] is optimal cost of segmentation upto time t
    F = Array(Float64, n)
    F[1] = - pen
    # last chpt prior to time t 
    chpts =  Array(Vector{Int64}, n)
    chpts[1] = []
    # vector of candidate chpts at t : see what gets pruned
    R = Array(Vector{Int64}, n)
    R[1] = [1]

    for t in 2:n
        cpt_cands = R[t-1]
        seg_costs = Array(Float64, length(cpt_cands))
        for i in 1:length(cpt_cands)
            seg_costs[i] = segment_cost(cpt_cands[i], t)
        end
        
        F[t] , tau = findmin( F[cpt_cands] + seg_costs + pen )
        
        # think this could be sped up
        chpts[t] = [ chpts[cpt_cands[tau]], cpt_cands[tau] ]  
        
        # pruning step -- maybe could be sped up (devectorise)
        ineq_prune = F[cpt_cands] + seg_costs .< F[t]
        R[t] =  push!( cpt_cands[ineq_prune] , t )
        # slows it down if [cpt_cands[ineq_prune] , t]
        
    end

  return chpts[n] , F[n] , R 

end
