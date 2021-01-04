"""
    WBS(segment_cost, n[, β = log(n)^1.01, M = 5000])

Runs the Wild Binary segmentation algorithm for the cost function `segment_cost` for a time series of length `n`, with penalty `β` and drawing `M` random intervals, and returns the position of found changepoints, and
the cost of this segmentation.

See also: [`@BS`](@ref), [`@segment_cost`](@ref)

# Returns
* `CP::Vector{Int}`: Vector of indices of detected changepoints
* `cost::Float64`: Cost of optimal segmentation

# Example
```julia-repl
# Sample Normal time series with changing mean
n = 1000
λ = 100
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
# Run wild binary segmentation
seg_cost = NormalMeanChange(sample, σ)
WBS_cps, WBS_cost = WBS(seg_cost, n)
```

# References
Fryzlewicz, P. (2014) Wild binary segmentation for multiple change-point detection, Annals of Statistics 42(6), 2243-2281
"""
#import StatsBase
#using StatsBase
# sigma = StatsBase.mad(x)
result_type = @NamedTuple{s::Int64, e::Int64, cpt::Int64, CUSUM::Float64, min_th::Float64, scale::Int64}


function WBS( segment_cost::Function , n::Int64, th_const::Float64 = 1.3, sigma::Float64 = 1.0, M::Int64 = 5000)
    result = Array{result_type}(undef,0)

    # thresulthold
    th = sigma * th_const * sqrt(2 * log(n))
    scale = 0
    # call WBS
    result = WBS_RECUR(segment_cost, 1, n, th, result, scale, M)


    return result
end


function WBS_RECUR(segment_cost::Function, s::Int64, e::Int64, th::Float64,
    result::Array{result_type}, scale::Int64, M::Int64 = 5000)
    #k = length(CP) - 2 #current number of change points
    minlength = 30 #minimum interval length
    tau = Tuple{Int, Int}[] # Segmentations to test
    push!(tau, (s, e))
    scale += 1 #update scale

    # draw intervals
    for m in 2:M
        s_m = rand(s:(e-minlength))
        e_m = rand( (s_m+minlength):e)
        push!(tau, (s_m, e_m))
    end

    # compute CUSUMs find candidate change point
    x = fill(0.0,M, e-s+1)#zeros(Float64, M, e-s+1)#Array{Float64}(NaN, M, e-s+1 ) #CUSUM array
    for m in 1:M
        a, b = pop!(tau)
        for j in (a + 1):(b - 1)
            x[m,j-s+1] = segment_cost(s,e,j)
        end
    end
    #x = replace(x, 0.0 => maximum(x))
    maxval , ind = findmax(x)

    # segment here
    if maxval > th
        cpt = ind[2] + s -1
        newresult = (s=s,e=e, cpt=cpt, CUSUM = maxval, min_th=th, scale=scale )
        push!(result, newresult)
        #push!(CP,cpt )
        #push!(CUSUM, minval)
        if cpt - s > minlength
            result = WBS_RECUR(segment_cost, s, cpt, th, result, scale, M)
        end
        if e - cpt > minlength
            result = WBS_RECUR(segment_cost, cpt+1, e, th, result,  scale, M)
        end
    end
    #CP = sort(CP)

    return result #CUSUM, CP
end

function get_WBS_changepoints(segment_cost::Function, object::Array{NamedTuple{(:s, :e, :cpt, :CUSUM, :min_th, :scale),Tuple{Int64,Int64,Int64,Float64,Float64,Int64}},1}, Kmax::Int64 = 1,  alpha::Float64 = 1.01)
    #result = Array{result_type}(undef,0)
    if length(object) > 0
        cost = zeros(Kmax+1)
        sorted = sort(object, lt = (a, b) -> ( a[4] < b[4]) ) #a[6] < b[6] &&
        cps_from_sorted = Vector{Int64}()
        for i in 1:Kmax
            push!(cps_from_sorted, sorted[i][3])
        end

        cost[1] = segment_cost(1, segment_cost.n)
        for i in 1:Kmax
            current_cps = sort(union([0, segment_cost.n], cps_from_sorted[1:i])) #select cps at current threshold
            for j in 1:(i+1)
                cost[i+1] = cost[i+1] + segment_cost(current_cps[j]+1, current_cps[j+1])
            end
        end

        pen = log(segment_cost.n)^alpha
        penvec = collect(0:Kmax) * pen
        cost += penvec

        optimal = findmin(cost)[2] -1 #optimal number
        #out_cps = sort(object[1:(optimal+2)], lt = (a, b) -> (a[1][2] < b[1][2]) )

        return  optimal , cost
    else
         println("no changepoints detected")
    end

end
