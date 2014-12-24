function PoissonSegment(data::Array{Int64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(cd[t+1]-cd[s]) * ( log(cd[t+1]-cd[s]) - log(t-s+1) - 1 )
    return cost
end
