function NormalMeanSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    cost(s::Int64, t::Int64) = cd_2[t+1] - cd_2[s] - abs2(cd[t+1] - cd[s])/(t-s+1)
    return cost
end