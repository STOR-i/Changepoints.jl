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

