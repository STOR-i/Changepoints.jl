#

function NormalVarSegment(data::Array{Float64}, μ::Float64)
    ss = cumsum((data - μ).²)
    cost(s::Int64, t::Int64) = ((t - s)/2)*(log(2π) + log((ss[t] - ss[s])/(t-s)) + 1.0)
end