@doc """
# Description
Runs the Binary Segmentation algorithm using a specified cost function for a given penalty to find the position and number of changepoints

# Usage
BS(cost_function(data, distribtion), length(data), penalty = log(n))

# Arguments
* `segment_cost::Function`: Calculates cost between two specified indices
* `n::Int`: Length of time series
* `pen::Float64`: Penalty of changepoints

# Returns
* `CP::Vector{Int}`: Vector of indices of detected changepoints

# Example
```
# Sample Normal time series with changing mean
n = 1000       
λ = 100        
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
# Run binary segmentation
pelt_cps, pelt_cost = @BS sample Normal(?, σ)
```

# See also
@segment_cost

#References
Scott, A.J. and Knott, M. (1974) A Cluster Analysis Method for Grouping Means in the Analysis of Variance, Biometrics 30(3), 507 - 512
""" ->
function BS( segment_cost::Function , n::Int64; pen::Float64 = log(n) )
    tau = (Int, Int)[] # Segmentations to test
    CP = Array(Int64,0)

    push!(tau, (0, n))
    push!(CP, 0)
    
    # keep adding segments until none contain a changepoint

    while length(tau) > 0
        a, b = pop!(tau)
        x = Array(Float64, 0)
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
    return sort(CP)
end
