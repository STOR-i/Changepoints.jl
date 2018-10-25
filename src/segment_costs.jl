
"""
equivalent to [0; cumsum(x)]
"""
function zero_cumsum(x::Array{T, 1}) where T
    res = Array{T, 1}(undef, length(x) + 1)

    res[1] = zero(T)
    for i in 1:length(x)
        res[i + 1] = res[i] + x[i]
    end

    return res
end

function zero_cumsum(f::Function, x::Array{T, 1}) where T
    res = Array{T, 1}(undef, length(x) + 1)

    res[1] = zero(T)
    for i in 1:length(x)
        res[i + 1] = res[i] + f(x[i])
    end

    return res
end

"""
# Description
Creates a segment cost function assuming times series data has Normal distribution with changing mean
and variance. The returned function takes two indices and calculates twice the negative log-likelihood
this model between these indices.

# Arguments
* `data::Array{Float64}`: Time series


# Returns
* `cost::Function`: Function which takes indices (s, t) where
                    0 ≤ s < t < n and n is the length of the time series
                    and returns the cost of the segment [s+1, ..., t]

# Example
```julia
n = 1000
λ = 100
μ, σ = Normal(0.0, 10.0), 1.0
data, cps = @changepoint_sampler n λ Normal(μ, σ)
cost = NormalMeanSegment(data, σ = 1.0)
cps, cost = BS(cost, n)
```

# See also
NormalVarSegment, NormalMeanVarSegment, ExponentialSegment, PoissonSegment, GammaRateSegment, GammaShapeSegment, Nonparametric, PELT, BS
"""
function NormalMeanSegment(data::Array{Float64}, σ::Real = 1.0)
    cd = zero_cumsum(data)
    cd_2 = zero_cumsum(x -> x^2, data)
    cost(s::Int64, t::Int64) =
        ( cd_2[t+1] - cd_2[s+1] - abs2(cd[t+1] - cd[s+1]) / (t-s) ) / (σ^2)
    return cost
end


"""
# Description
Creates a segment cost function assuming times series data has Normal distribution with changing variance
and fixed mean.

# See also
NormalMeanSegment
"""
function NormalVarSegment(data::Array{Float64}, μ::Real)
    ss = zero_cumsum(x -> (x - μ)^2, data)
    cost(s::Int64, t::Int64) = (t-s) * log( (ss[t+1] - ss[s+1])/(t-s) )
end

"""
# Description
Creates a segment cost function assuming times series data has Normal distribution with changing mean and variance.

# See also
NormalMeanSegment
"""
function NormalMeanVarSegment(data::Array{Float64})
    cd = zero_cumsum(data)
    cd_2 = zero_cumsum(x -> x^2, data)
    function cost(s::Int64, t::Int64)
      mu = (cd[t + 1] - cd[s + 1]) / (t - s)
      sig = ( cd_2[t+1] - cd_2[s+1] ) / (t-s) - mu^2
      return (t-s)*log(sig) + (cd_2[t+1] - cd_2[s+1])/sig - 2*(cd[t+1] - cd[s+1])*mu/sig + ((t-s)*mu^2)/sig
    end
    return cost
end

"""
# Description
Creates a segment cost function assuming times series data has Exponential distribution with changing mean

# See also
NormalMeanSegment
"""
function ExponentialSegment(data::Array{Float64})
    cd = zero_cumsum(data)
    cost(s::Int64, t::Int64) = -*(t-s) * ( log(t-s) - log(cd[t+1] - cd[s+1]))
    return cost
end

"""
# Description
Creates a segment cost function assuming times series data has Poisson distribution with changing mean

# See also
NormalMeanSegment
"""
function PoissonSegment(data::Array{Float64})
    cd = zero_cumsum(data)
    cost(s::Int64, t::Int64) = -2*(cd[t+1]-cd[s+1]) * ( log(cd[t+1]-cd[s+1]) - log(t-s) - 1 )
    return cost
end

"""
# Description
Creates a segment cost function assuming times series data has Gamma distribution with changing shape parameter

# See also
NormalMeanSegment
"""
function GammaShapeSegment(data::Array{Float64}, beta::Float64)
    lcd = zero_cumsum(log, data)
    function cost(s::Int64, t::Int64)
        alpha_hat = invdigamma( log(beta) + (lcd[t+1] - lcd[s+1])/(t-s) )
        cost = (t-s)*( alpha_hat*log(beta) - lgamma(alpha_hat) ) + (alpha_hat-1)*(lcd[t+1]-lcd[s+1])
        return cost*-2
    end
end

"""
# Description
Creates a segment cost function assuming times series data has Gamma distribution with changing rate parameter

# See also
NormalMeanSegment
"""
function GammaRateSegment(data::Array{Float64}, alpha::Float64)
    cd = zero_cumsum(data)
    function cost(s::Int64, t::Int64)
        beta_hat = ( alpha * (t-s) )/( cd[t+1] - cd[s+1] )
        cost = (t-s)*alpha*log(beta_hat) - beta_hat*( cd[t+1] - cd[s+1] )
        return cost*-2
    end
end

"""
# Description
Creates a segment cost function based on the Nonparametric model

# Arguments
`data::Array{Float64}`: time series
`K::Int`: nonparametric model parameter

# See also
NormalMeanSegment
"""
function NonparametricSegment(data::Array{Float64}, K::Int64)
    n = length(data)
    if (K > n)
        K = n
    end
    x = sort(data)
    yk = -1 .+ (2 .* collect(1:K) ./ K .- 1/K)
    c = -log(2*n-1)
    pK = (1 .+ exp.(c .* yk)) .^ -1.0
    j = floor(Int64, (n-1)*pK[1]+1)
    Q = vcat(0,cumsum(data .< x[j]) .+ 0.5 .* cumsum(data.==x[j]))
    for i in 2:K
        j = convert(Int64,floor((n-1)*pK[i]+1))
        Q =vcat(Q,(vcat(0,cumsum(data .< x[j]) + 0.5*cumsum(data.==x[j]))))
    end

    function cost(s::Int64, t::Int64)
        Fkl = zeros(Float64, K)
        for i in 1:K
            Fkl[i] = ((Q[(t+1)+(i-1)*(n+1)]) -  (Q[(s+1)+(i-1)*(n+1)]))/(t-s)
        end
        cost = 0
        for i in 1:K
            if (Fkl[i] > 0 && Fkl[i] < 1)
                cost  = cost + (t-s)*(Fkl[i]*log(Fkl[i]) + (1-Fkl[i])*log(1-Fkl[i]))
            end
        end
        return 2*c*cost/K
    end
end


"""
# Description
Create a segment cost function for piecewise linear regressions, fitted using OLS (assuming Normally distributed errors).

# Arguments
`data::Array{Float64}`: time series

# See also
NormalMeanSegment
"""
function OLSSegment(data::Array{Float64})
    function cost(s::Int64, t::Int64)
	      if t-s > 1
            y = data[s:t]
	          m = length(y)
	          x = 1:m
	          a = ( 2*(2*m+1)*sum(y) - 6*sum(x.*y) )/( m*(m-1) )
	          b = ( 12*sum(x.*y) - 6*(m+1)*sum(y) )/( m*(m-1)*(m+1) )
	          sig = sum( (y-a-b*x).^2 )/m
	          return m/2 * ( log(sig) + 1 )
	      else
	          return Inf
	      end
    end
end
