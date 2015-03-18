# This documentation should apply to all cost functions...

@doc """
# Description
Creates a cost function for a multiple changepoint model where
mean is changing and the variance is fixed.

The returned functions calculates the minimum negative log likelihood
for the specified segment.

# Arguments
* `data::Array{Float64}`: Time series
# Returns
* `cost::Function`: Function which takes indices (s, t) where
                    0 ≤ s < t < n and n is the length of the time series
                    and returns the cost of the segment [s+1, ..., t]
""" ->
function NormalMeanSegment(data::Array{Float64}, σ::Real = 1.0)
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    cost(s::Int64, t::Int64) = ( cd_2[t+1] - cd_2[s+1] - abs2(cd[t+1] - cd[s+1])/(t-s) )/(σ^2)
    return cost
end

function NormalVarSegment(data::Array{Float64}, μ::Real)
    ss = [0,cumsum((data - μ).^2)]
    cost(s::Int64, t::Int64) = (t-s) * log( (ss[t+1] - ss[s+1])/(t-s) ) 
end

function NormalMeanVarSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    function cost(s::Int64, t::Int64) 
      mu = (cd[t+1] - cd[s+1])/(t-s)
      sig = ( cd_2[t+1] - cd_2[s+1] )/(t-s) - mu^2
      return (t-s)*log(sig) + (cd_2[t+1] - cd_2[s+1])/sig - 2*(cd[t+1] - cd[s+1])*mu/sig + ((t-s)*mu^2)/sig
    end
    return cost
end

function ExponentialSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(t-s) * ( log(t-s) - log(cd[t+1] - cd[s+1]) - 1 )  
    return cost
end

function PoissonSegment(data::Array{Int64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(cd[t+1]-cd[s+1]) * ( log(cd[t+1]-cd[s+1]) - log(t-s) - 1 )
    return cost
end

function GammaShapeSegment(data::Array{Float64}, beta::Float64)
     lcd = [0,cumsum( log(data) )]
    function cost(s::Int64, t::Int64)
        alpha_hat = invdigamma( log(beta) + (lcd[t+1] - lcd[s+1])/(t-s) )
        cost = (t-s)*( alpha_hat*log(beta) - lgamma(alpha_hat) ) + (alpha_hat-1)*(lcd[t+1]-lcd[s+1])
        return cost*-2
    end
end

function GammaRateSegment(data::Array{Float64}, alpha::Float64)
    cd = [0,cumsum( data )]
    function cost(s::Int64, t::Int64)
        beta_hat = ( alpha * (t-s) )/( cd[t+1] - cd[s+1] )
        cost = (t-s)*alpha*log(beta_hat) - beta_hat*( cd[t+1] - cd[s+1] )
        return cost*-2
    end
end

function NonparametricSegment(data::Array{Float64}, K::Int64)
    n = length(data)
    if (K > n) K=n end
    x = sort(data)
    yk = -1 + (2*[1:K]/K - 1/K)
    c = -log(2*n-1)
    pK = (1+exp(c*yk)).^-1.0
    j = convert(Int64,floor((n-1)*pK[1]+1))
    Q = vcat(0,cumsum(data .< x[j]) + 0.5*cumsum(data.==x[j]))
    for (i in 2:K)
        j = convert(Int64,floor((n-1)*pK[i]+1))
        Q =vcat(Q,(vcat(0,cumsum(data .< x[j]) + 0.5*cumsum(data.==x[j]))))
    end

    function cost(s::Int64, t::Int64)
        Fkl = zeros(Float64,K)
        for (i in 1:K)
            Fkl[i] = ((Q[(t+1)+(i-1)*(n+1)]) -  (Q[(s+1)+(i-1)*(n+1)]))/(t-s)
        end
        cost = 0 
        for (i in 1:K)
            if (Fkl[i] > 0 && Fkl[i] < 1)
                cost  = cost + (t-s)*(Fkl[i]*log(Fkl[i]) + (1-Fkl[i])*log(1-Fkl[i]))
            end
        end
        return 2*c*cost/K
    end
end
