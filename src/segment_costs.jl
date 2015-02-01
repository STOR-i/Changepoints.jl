function NormalMeanSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    cost(s::Int64, t::Int64) = cd_2[t+1] - cd_2[s] - abs2(cd[t+1] - cd[s])/(t-s+1)
    return cost
end

function NormalVarSegment(data::Array{Float64}, μ::Float64)
    ss = [0,cumsum((data - μ).^2)]
    cost(s::Int64, t::Int64) = (t-s+1) * log( (ss[t+1] - ss[s])/(t-s+1) ) 
end

function NormalMeanVarSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    function cost(s::Int64, t::Int64) 
      mu = (cd[t+1] - cd[s])/(t-s+1)
      sig = ( cd_2[t+1] - cd_2[s] )/(t-s+1) - mu^2
      return (t-s+1)*log(sig) + (cd_2[t+1] - cd_2[s])/sig - 2*(cd[t+1] - cd[s])*mu/sig + ((t-s+1)*mu^2)/sig
    end
    return cost
end

function ExponentialSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(t-s+1) * ( log(t-s+1) - log(cd[t+1] - cd[s]) - 1 )  
    return cost
end

function PoissonSegment(data::Array{Int64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(cd[t+1]-cd[s]) * ( log(cd[t+1]-cd[s]) - log(t-s+1) - 1 )
    return cost
end

function BetaSegment(data::Array{Float64})
# Method of moments
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    lcd = [0,cumsum( log(data) )]
    clcd = [0,cumsum( log(1-data) )]
    function cost(s::Int64, t::Int64) 
      mu = (cd[t+1] - cd[s])/(t-s+1)
      sig = ( cd_2[t+1] - cd_2[s] )/(t-s+1) - mu^2
      alpha = mu*( mu*(1-mu)/sig - 1 )
      beta = (1-mu)*( mu*(1-mu)/sig - 1 )
      return (t-s+1)*lbeta(alpha,beta) - (alpha-1)*( lcd[t+1]-lcd[s] ) - (beta-1)*( clcd[t+1]-clcd[s] )
    end
    return cost
end

