mutable struct ChangepointSampler <: Sampleable{Univariate, Continuous}
    rand_dist_gen::Function                  # Function which generates a random distribution
    λ::Int                                   # Frequency of changepoints
    changepoints::Array{Int64,1}               # Changepoints indices
    segment_params::Array{Any}               # Params of segments
    # Current state of sampler
    _counter::Int                            # number of changepoints
    _current_dist::Sampleable                # Current distribution
    _next_change::Int                        # Index of next changepoint
end

function ChangepointSampler(rand_dist_gen, λ::Int = 10)
    _current_dist = rand_dist_gen()
    self = ChangepointSampler(rand_dist_gen, λ, [], [], 0, rand_dist_gen(), rand(Poisson(λ)) + 1)
    push!(self.changepoints, 0)
    push!(self.segment_params, params(_current_dist))
    self
end

function rand(dist::ChangepointSampler, n::Int)
    s = 0
    x = Array{Float64}(undef, n)
    while s < n
        t = min(dist._next_change - dist._counter - 1, n)
        x[s+1:t] = rand(dist._current_dist, t - s)
        # print(x[s+1:t])
        if t == dist._next_change - dist._counter - 1
            dist._next_change += 1 + rand(Poisson(dist.λ))
            dist._current_dist = dist.rand_dist_gen()
            # Sample and store new change parameters
            push!(dist.changepoints, dist._counter + t)
            push!(dist.segment_params, params(dist._current_dist))
        end
        s = t
    end
    dist._counter += n
    return x
end

cp_rand(dist::ChangepointSampler, n::Int) = rand(dist, n), dist.changepoints

function ran_dist(dist_type::Type, args...)
    newargs = Any[]
    for a in args[2:end]
        if isa(a, Sampleable)
            push!(newargs, rand(a))
        else push!(newargs, a) end
    end
        return dist_type(newargs...)
end

"""
    @changepoint_sampler(n, λ, Distribution(param1, param2, ...))

Generates sample of size `n` from `Distribution` with changes in
parameters generated at random intervals. `param1, param2, ...` are parameters of the sampleable
`Distribution` type, and may be fixed values, or themselves sampleable distributions. Changepoints
occur at random times whose separation follows a Poisson distribution with rate `λ`.
At each changepoint, new values for all parameters in `param1, param2, ...`, which
are distributions are sampled.

# Returns
* (data::Array, cps::Array{Int}) :
  * data : generated time series
  * cps : array of indices of changepoints

# Example
```julia-repl
n, λ = 1000, 100
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)  # Sample changepoints
"""
macro changepoint_sampler(n, λ, dist)
    if !isexpr(dist, :call)
        error("Syntax error: expected distribution construction in second argument")
    end

    if length(dist.args) == 1
        return Expr(:call, :rand, dist, n)
    else
        nargs = length(dist.args)
        args = Array{Any}(undef, nargs)
        return esc(:(Changepoints.cp_rand(ChangepointSampler(()->Changepoints.ran_dist($(dist.args...)), $(λ)), $(n))))
    end
end
