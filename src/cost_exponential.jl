function ExponentialSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(t-s+1) * ( log(t-s+1) - log(cd[t+1] - cd[s]) - 1 )  
    return cost
end