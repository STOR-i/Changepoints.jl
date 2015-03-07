#=
These are functions which calculate the marginal likelihood of a segment of a time series
(upto a constant of proprtionality)

P(s,t) = \int \Pr(y_{s+1:t} | \theta) \pi(\theta) d\theta
where theta is the parameter that changes and \pi(\theta) is its prior
=#

# the first function assumes a constant variance and chnging mean where the mean has a normal prior 
# centered on 0 and has standard deviation s
function NormalMeanSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    cost(s::Int64, t::Int64) = cd_2[t+1] - cd_2[s+1] - abs2(cd[t+1] - cd[s+1])/(t-s)
    return cost
end