# PELT algorithm

@doc """
# Description
Runs PELT algorithm on specified cost function for a given penalty
# Arguments
* `segment_cost::Function`: Calculates cost between two specified indices
* `n::Int`: Length of time series
* `pen::Float64`: Penalty of changepoints

# Returns
* `(CP::Vector{Int}, cost::Float64)`:
  * `CP::Vector{Int}`: Vector of indices of detected changepoints
  * `cost::Float64`: Cost of optimal segmentation
""" ->
function PELT( segment_cost::Function , n::Int; pen::Float64 = log(n) )
   
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
    if !Meta.isexpr(dist,:call)
        error("Syntax error: expected distribution as second argument")
    end
    dist_type = dist.args[1]
    if dist_type == :Normal
        if length(dist.args) != 3
            error("Normal distribution has two parameters")
        end
        μ, σ = dist.args[2:3]
        println(μ, σ)
        if μ == :? && σ != :?
            println("Changepoint distribution is Normal with changing mean and fixed variance")
            return esc(:(PELT(NormalMeanSegment($data), length($data))))
        elseif μ != :? && σ == :?
            println("Changepoint distribution is Normal with fixed mean and changing variance")
            #μ = eval(Main, μ)
            return esc(:(PELT(NormalVarSegment($data, $μ), length($data))))
        elseif μ == :? && σ == :?
            println("Changepoint distribution is Normal with changing mean and changing variance")
            return esc(:(PELT(NormalMeanVarSegment($(data)), length($data))))
        else
            error("Must mark at least one Normal parameter as changing with a ? symbol")
        end
    elseif dist_type == :Exponential
        println("Changepoint distribution is Exponential with changing mean")
        return esc(:(PELT(ExponentialSegment($data), length($data))))
    else
        error("Distribution $(dist_type) has no implemented cost functions")
    end
end
