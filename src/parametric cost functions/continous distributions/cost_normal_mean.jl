#

function NormalMeanSegment(data::Array{Float64})
    cd = cumsum( data )
    cd_2 = cumsum( abs2(data) )
    cost(s::Int64, t::Int64) = cd_2[t] - cd_2[s] - abs2(cd[t] - cd[s])/(t-s)
    return cost
end
