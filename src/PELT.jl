# PELT algorithm

@doc """
# Description
Runs the PELT algorithm using a specified cost function for a given penalty value to find the position and number of changepoints

# Arguments
* `segment_cost::Function`: Calculates cost between two specified indices
* `n::Int`: Length of time series
* `pen::Float64`: This is the penalty value used to avoid over/under -fitting the model.

# Usage
PELT(cost_function(data, distribtion), length(data), penalty = log(n))
Can also call the PELT function using the macro @PELT data Segment_cost(?) Penalty where the ? replaces the parameter which changes.  For example to find a change in mean in data distributed from a Normal distribution with penalty equal to log(n) we would use
 @PELT data Normal(?, σ) log(n)

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
pelt_cps, pelt_cost = @PELT sample Normal(?, σ)

#References
Killick, R., Fearnhead, P. and Eckley, I.A. (2012) Optimal detection of changepoints with a linear computational cost, JASA 107(500), 1590-1598
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

    return CP , F[n+1] 

end
