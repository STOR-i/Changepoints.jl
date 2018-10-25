"""
    BS(segment_cost, n[, β = log(n)])

Runs the Binary segmentation algorithm for the cost function `segment_cost` for a time series of length `n` and a penalty `β` and returns the position of found changepoints, and
the cost of this segmentation.

See also: [`@BS`](@ref), [`@segment_cost`](@ref)

# Returns
* `CP::Vector{Int}`: Vector of indices of detected changepoints
* `cost::Float64`: Cost of optimal segmentation

# Example
```julia-repl
# Sample Normal time series with changing mean
n = 1000
λ = 100
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
# Run binary segmentation
seg_cost = NormalMeanChange(sample, σ)
BS_cps, BS_cost = BS(seg_cost, n)
```

# References
Scott, A.J. and Knott, M. (1974) A Cluster Analysis Method for Grouping Means in the Analysis of Variance, Biometrics 30(3), 507 - 512
"""
function BS( segment_cost::Function , n::Int64; pen::Float64 = log(n) )
    tau = Tuple{Int, Int}[] # Segmentations to test
    CP = Array{Int64}(undef,0)

    push!(tau, (0, n))
    push!(CP, 0)

    # keep adding segments until none contain a changepoint

    while length(tau) > 0
        a, b = pop!(tau)
        x = Array{Float64}(undef, 0)
        for j in (a+1):(b - 1)
            push!(x , segment_cost(a,j) + segment_cost(j,b) + pen)
        end
        minval , ind = findmin(x)
        if minval - segment_cost(a,b) < 0
            # significant so add seg to tau
            chpt = ind + a
            push!(CP,chpt)
            if chpt != a + 1;
                push!(tau, (a, chpt))
            end
            if chpt != b - 1
                push!(tau, (chpt,b))
            end
        end
    end

    cost = 0.0

    CP = sort(CP)

    for j in 1:(length(CP)-1)
        cost = cost + segment_cost(CP[j]+1,CP[j+1]) + pen
    end

    cost = cost + segment_cost(CP[end]+1,n)

    return CP, cost
end
