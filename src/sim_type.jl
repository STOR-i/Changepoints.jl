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

type ChangepointSampler <: Sampleable
    rand_dist_gen::Function                  # Function which generates a random distribution
    λ::Int64                                 # Frequency of changepoints
    changepoints::Array{Int64,1}               # Changepoints indices
    segment_params::Array{Any}               # Params of segments
    # Current state of sampler
    _counter::Int64                          # number of changepoints
    _current_dist::Sampleable                # Current distribution
    _next_change::Int64                      # Index of next changepoint
end

function ChangepointSampler(rand_dist_gen, λ::Int64 = 10)
    _current_dist = rand_dist_gen()
    self = ChangepointSampler(rand_dist_gen, λ, [], [], 0, rand_dist_gen(), rand(Poisson(λ)) + 1)
    push!(self.changepoints, 1)
    push!(self.segment_params, params(_current_dist))
    self
end

function rand(dist::ChangepointSampler, n::Int64)
    s = 0
    x = Array(Float64, n)
    while s < n
        t = min(dist._next_change - dist._counter - 1, n)
        x[s+1:t] = rand(dist._current_dist, t - s)
        # print(x[s+1:t])
        if t == dist._next_change - dist._counter - 1
            dist._next_change += 1 + rand(Poisson(dist.λ))
            dist._current_dist = dist.rand_dist_gen()
            # Sample and store new change parameters
            push!(dist.changepoints, dist._counter + t+1)
            push!(dist.segment_params, params(dist._current_dist))
        end
        s = t
    end
    dist._counter += n
    return x
end
