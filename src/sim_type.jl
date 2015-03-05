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


macro changepoint_sampler(n, λ, dist)
    if !isexpr(dist, :call)
        error("Syntax error: expected distribution construction in second argument")
    end
    n = eval(Main, n)
    λ = eval(Main, λ)
#println(dist.args)
    if length(dist.args) == 1
        return Expr(:call, :rand, dist, n)
    else
        dtype = dist.args[1]
        args = Any[]
        for a in dist.args[2:end]
            val = eval(Main,a)
            if isa(val, Sampleable) push!(args, :(rand($a)))
            else push!(args, :($a)) end
        end
        X = Expr(:call, dtype, args...)
        #lam = Expr(:->, :(()), quote $X end)
        lam = :(()-> $X)

    end
    sampler = eval(Main, Expr(:call, :ChangepointSampler, lam, λ))
    #sampler = eval(:(ChangepointSampler($(lam), λ)))
    return :(rand($(sampler), $n), $(sampler).changepoints)
end
