function NormalVarSegment(data::Array{Float64}, μ::Float64)
    ss = [0,cumsum((data - μ).²)]
    cost(s::Int64, t::Int64) = (t-s+1) * log( (ss[t+1] - ss[s])/(t-s+1) ) 
end
