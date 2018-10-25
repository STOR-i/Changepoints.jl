"""
    PELT(segment_cost, n[, β = log(n)])

Runs the PELT algorithm using cost function `segment_cost` for a time series of length `n` and a penalty `β` and returns the position of changepoints and optimal segmentation cost.

See also: [`@PELT`](@ref), [`@segment_cost`](@ref), [`CROPS`](@ref)

# Returns
* `(CP::Vector{Int}, cost::Float64)`:
  * `CP::Vector{Int}`: Vector of indices of detected changepoints
  * `cost::Float64`: Cost of optimal segmentation

# Example
```julia-repl
n, λ = 1000, 100
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)  # Sample changepoints
seg_cost = NormalMeanChange(sample, σ)               # Create segment cost function
pelt_cps, pelt_cost = PELT(seg_cost, n)              # Run PELT
```

# References
Killick, R., Fearnhead, P. and Eckley, I.A. (2012) Optimal detection of changepoints with a linear computational cost, JASA 107(500), 1590-1598
"""
function PELT( segment_cost::Function , n::Int; pen::Float64 = log(n) )

    # F[t] is optimal cost of segmentation upto time t
    F = Array{Float64}(undef, n+1)
    F[1] = -pen
    F[2] = 0

    # last chpt prior to time t
    chpts =  Array{Int64}(undef, n)
    chpts[1] = 0

    # vector of candidate chpts at t
    R = Int64[0]

    for t in 2:n
        cpt_cands = R
        seg_costs = Array{Float64}(undef, length(cpt_cands))
        for i in 1:length(cpt_cands)
            seg_costs[i] = segment_cost(cpt_cands[i], t)
        end

        F[t+1] , tau = findmin( F[cpt_cands .+ 1] .+ seg_costs .+ pen )
        chpts[t] = cpt_cands[tau]

        # pruning step
        ineq_prune = (F[cpt_cands .+ 1] .+ seg_costs) .< F[t+1]
        R = push!(cpt_cands[ineq_prune], t - 1)
    end

    # get changepoints
    CP = Array{Int64}(undef,0)
    last = chpts[n]
    push!(CP,last)
    while last > 0
        last = chpts[last]
        push!(CP,last)
    end
    sort!(CP)

    return CP , F[n+1]

end
