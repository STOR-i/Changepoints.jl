# creates type for simulating changepoints and redefines rand()
# - maybe more LOS distributions (geometric, negative binomial, uniform ...)

import Base.rand
using Distributions

type NormalMeanChange <: Sampleable{Univariate, Continuous}
    lambda::Int64               # Frequency of changepoints
    mu::Float64                 # Mean of mean parameter
    sd::Float64                 # Standard deviation of mean parameter
    changepoints::Array{Int64}  # Changepoints indices
    means::Array{Float64}       # Means of segments
    # Current state of sampler
    _counter::Int64             # Number of changepoints
    _current_mean::Float64      # Current mean
    _next_change::Int64         # Index of next changepoint
end

function NormalMeanChange(lambda::Int64 = 10, mu::Float64 = 0.0, sd::Float64 = 1.0)
    dist = NormalMeanChange(lambda, mu, sd, [], [], 0, rand(Normal(mu, sd)), rand(Poisson(lambda)) + 1)
    push!(dist.changepoints, 1)
    push!(dist.means, dist._current_mean)
    dist
end

function rand(dist::NormalMeanChange, n::Int64)
    s = 0
    x = Array(Float64, n)
    while s < n
        t = min(dist._next_change - dist._counter - 1, n)
        x[s+1:t] = rand(Normal(dist._current_mean), t - s)
        if t == dist._next_change - dist._counter - 1
            dist._next_change += 1 + rand(Poisson(dist.lambda))
            dist._current_mean = rand(Normal(dist.mu,dist.sd))
            push!(dist.changepoints, t+1)
            push!(dist.means, dist._current_mean)
        end
        s = t
    end
    dist._counter += n
    return x
end
