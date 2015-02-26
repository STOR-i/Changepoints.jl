# PELT algorithm 

function PELT( segment_cost::Function , n::Int64, pen::Float64 = 0.0 )

    # if we havent specified beta make it BIC penalty 
    if pen == 0.0
        pen = log(n)
    end
   
    # F[t] is optimal cost of segmentation upto time t
    F = Array(Float64, n+1)
    F[1] = - pen
    F[2] = 0
    # last chpt prior to time t 
    chpts =  Array(Int64, n)
    chpts[1] = 0
    # vector of candidate chpts at t 
    R = Array(Int64, 1)
    R = [0]

    for t in 2:n
        cpt_cands = R
        seg_costs = Array(Float64, length(cpt_cands))
        for i in 1:length(cpt_cands)
            seg_costs[i] = segment_cost(cpt_cands[i], t)
        end
        
        F[t+1] , tau = findmin( F[cpt_cands+1] + seg_costs + pen )
        chpts[t] = cpt_cands[tau]  
        
        # pruning step 
        ineq_prune = F[cpt_cands+1] + seg_costs .< F[t+1]
        R =  push!( cpt_cands[ineq_prune] , t-1 )
        
    end

    # get changepoints
    CP = Array(Int64,0)
    last = chpts[n]
    push!(CP,last)
    while last > 0
      last = chpts[last]
      push!(CP,last)
    end
    sort!(CP)  

    return CP , F[n] 

end

macro PELT(data, dist)
    if !isexpr(dist,:call)
        error("Syntax error: expected distribution as second argument")
    end
    data=eval(Main,data)
    n=length(data)
    
    dist_type = dist.args[1]
    if dist_type == :Normal
        if length(dist.args) < 3
            error("Normal distribution has two parameters")
        end
        μ, σ = dist.args[2:3]
        println(μ, σ)
        if μ == :? && σ != :?
            σ = eval(Main,σ)
            println("Changepoint distribution is Normal with changing mean and fixed variance")
            return :(PELT(NormalMeanSegment($data), $n))
        elseif μ != :? && σ == :?
            println("Changepoint distribution is Normal with fixed mean and changing variance")
            μ = eval(Main,μ)
            return :(PELT(NormalVarSegment($data, μ), $n))
        elseif μ == :? && σ == :?
            println("Changepoint distribution is Normal with changing mean and changing variance")
            return :(PELT(NormalMeanVarSegment($data), $n))
        else
            error("Must mark at least one Normal parameter as changing with a ? symbol")
        end
    else
        error("Distribution $(dist_type) has no implemented cost functions")
    end
end
