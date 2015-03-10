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
function NormalMeanSegment(data::Array{Float64}, var::Real = 1)
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    cost(s::Int64, t::Int64) = ( cd_2[t+1] - cd_2[s+1] - abs2(cd[t+1] - cd[s+1])/(t-s) )/var
    return cost
end

function NormalVarSegment(data::Array{Float64}, μ::Float64)
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

function BetaSegment(data::Array{Float64})
    # Method of moments
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    lcd = [0,cumsum( log(data) )]
    clcd = [0,cumsum( log(1-data) )]
    function cost(s::Int64, t::Int64) 
        mu = (cd[t+1] - cd[s+1])/(t-s)
        sig = ( cd_2[t+1] - cd_2[s+1] )/(t-s) - mu^2
        alpha = mu*( mu*(1-mu)/sig - 1 )
        beta = (1-mu)*( mu*(1-mu)/sig - 1 )
        return (t-s)*lbeta(alpha,beta) - (alpha-1)*( lcd[t+1]-lcd[s+1] ) - (beta-1)*( clcd[t+1]-clcd[s+1] )
    end
    return cost
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
