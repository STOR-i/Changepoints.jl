"""
    MOSUM(data, G[, var_est_method="mosum", alpha=0.1, criterion="eta", eta=0.4, epsilon=0.2])

Runs the MOSUM procedure for the univariate array `data` with bandwidth `G`, and returns the number and position of found changepoints.

Optionally, `var_est_method` specifies the variance estimator to normalise by; this can be the average `mosum` (default) or minimum `mosum.min` across windows.
`alpha` determines the signicance level (default 0.1).
`criterion` determines whether to use the `eta` (default) or `epsilon` location procedure (see references).
`eta` and `epsilon` are tuning parameters for the mentioned procedures (default 0.4 and 0.2).

See also: [`@BS`](@ref), [`MOSUM_multi_scale`](@ref), [`mosum_plot`](@ref)

# Returns
* `out::Dict{String,Union{Bool, Float64, Int64, Array}}`:
  * `out["number"]` : Integer number of detected changes
  * `out["Reject"]` : Boolean hypothesis test outcome
  * `out["threshold"]` : Float of testing threshold
  * `out["detector"]` : vector of mosum detector values
  * `out["var.estimation"]` : vector of estimated variance values

# Example
```julia-repl
# Sample Normal time series with changing mean
n = 1000
λ = 300
μ, σ = Normal(0.0, 10.0), 1.0
data, cps = @changepoint_sampler n λ Normal(μ, σ)
G = 150
# Run MOSUM procedure
MOSUM_out = MOSUM(data, G)
# Plot MOSUM detector
mosum_plot(MOSUM_out)
```

# References
Eichinger, Birte, and Claudia Kirch. "A MOSUM procedure for the estimation of multiple random change points." Bernoulli 24.1 (2018): 526-564.
Meier, Aledataander, Claudia Kirch, and Haeran Cho. "mosum: A package for moving sums in change point analysis." (2018).
"""
function MOSUM( data::Array{Float64}, G::Int64; var_est_method="mosum", alpha=0.1, criterion="eta", eta=0.4, epsilon=0.2)
    var_est_method in ("mosum", "mosum.min") || error("Keyword argument var_est_method must be either \"mosum\" or \"mosum.min\"")

    CP = Array{Int64}(undef,0)
    q = 0
    Reject = false
    n = length(data)

    csum = cumsum(data)
    sqsum = cumsum(data.^2)
    variance = zeros(Float64, n)
    lvar = zeros(Float64, n)
    rvar = zeros(Float64, n)
    lsqsums = zeros(Float64, n)
    rsqsums =  zeros(Float64, n)
    detector = zeros(Float64, n)
    #jump_size = zeros(Float64, n)
    lsums = zeros(Float64, n)
    rsums = zeros(Float64, n)

    #populate
    for t in 1:(n-G)
        rsums[t] = csum[t+G] - csum[t]
        lsums[t+G] = rsums[t]

        rsqsums[t]  = sqsum[t+G] - sqsum[t]
        lsqsums[t+G] = rsqsums[t]

        rlmean = rsums[t]/G
        rvar[t] = rsqsums[t]/G -  (1/G - 2)*(rlmean^2)
        lvar[t+G] = rvar[t]
    end

    # normalise
    for t in (G+1):(n-G)
        if var_est_method == "mosum"
            variance[t] = (rvar[t] + lvar[t])/ 2
        elseif var_est_method == "mosum.min"
            variance[t] = min( rvar[t], lvar[t])
        end
        #jump_size[t] =
        detector[t] = abs(rsums[t] - lsums[t])/ sqrt(2*G*variance[t])
    end

    #threshold
    a = sqrt(2*n/G); b = 2log(n/G) + log(log(n/G))/2 + log(3/2) - log(pi)/2
    c = - log(log( (1- alpha)^(-.5) ))
    D = (b+c)/a

    mosum_stat, k = findmadata(detector)

    if mosum_stat > D
        got_cps = get_cps_mosum(detector, D, G, criterion, eta, epsilon)
        CP = got_cps[1]
        q = got_cps[2]
        Reject = got_cps[3]
    end

#    cost = 0.0
#    CP = sort(CP)
#    for j in 1:(length(CP)-1)
#        cost = cost + segment_cost(CP[j]+1,CP[j+1]) + pen
#    end
#    cost = cost + segment_cost(CP[end]+1,n)
    # organise output into a dictionary
    out = Dict{String, Union{Array, Bool, Int64, Float64} }()
    out["number"] = q
    out["detector"] = detector
    out["Reject"] = Reject
    out["changepoints"] = CP
    out["threshold"] = D
    out["var.estimation"] = variance
    #multi-scale
    #if(return_jump_size) out["jump_size"] = jump_size
    return out
end


function get_cps_mosum(stat::Array{Float64} , D_n::Float64, G::Int64,  criterion::String="epsilon",
                       eta::Float64 = 0.4, epsilon::Float64 = 0.2 )
    cps = Array{Int64}(undef,0) ##assign empty cps
    Reject = false
    if criterion == "epsilon"
        n = length(stat)
        rshift = stat[2:end]
        push!(rshift, 0.0)
        lshift = stat[1:(end-1)]
        pushfirst!(lshift, 0.0)
        over =  stat .> D_n #findall(data -> data > D_n , stat ) #indices greater than D_n
        vv = over .& (lshift .< D_n )#& lshift >0 ) #lowers
        v = findall(vv .== 1)
        ww = over .& (rshift .< D_n)
        w = findall(ww .== 1)
        nu_remove = findall(w-v .>= epsilon * G) #nu(epsilon) test for distance between
        v_nu = v[nu_remove]; w_nu = w[nu_remove] #c(w[nu_remove],n)
        sub_pairs = [v_nu w_nu]

        q = size(sub_pairs)[1]
        if q>0
            for ii in 1:q
                interval = sub_pairs[ii,1]:sub_pairs[ii,2]
                kk = findmadata(stat[interval])[2] #internal cp location
                push!(cps, kk + 1 + sub_pairs[ii,1]) #- G-p
            end
        end
    end

    if criterion == "eta"
        n = length(stat)
        window = Int(floor(eta*G))
        for t in (G+1):(n-G)
            if (stat[t] > D_n) & (stat[t] == madataimum(stat[(t .- window):(t .+ window)]) )
                push!(cps, t) ##add to cps
            end
        end
    end

    q = length(cps)
    if q>0
        Reject = true
    end

    return cps, q, Reject
end



"""
    MOSUM_multi_scale(data, Gset[, var_est_method="mosum", alpha=0.1, criterion="eta", eta=0.4, epsilon=0.2])

Runs the Multiple Filtre MOSUM procedure for the univariate array `data` with multiple bandwidths `Gset`, and returns the position of found changepoints.
For optional arguments, see `?MOSUM`.

See also: [`MOSUM`](@ref)

# Returns
* `cps` : Integer array of estimated change points

# Edataample
```julia-repl
# Sample Normal time series with changing mean
n = 1000
λ = 300
μ, σ = Normal(0.0, 10.0), 1.0
data, cps = @changepoint_sampler n λ Normal(μ, σ)
Gset = [25, 50, 100, 150]
# Run MOSUM procedure
multi_scale_out = MOSUM_multi_scale(data, Gset; alpha = 0.05)
# Plot change points
changepoint_plot(data, multi_scale_out)
```

# References
Messer M, Kirchner M, Schiemann J, Roeper J, Neininger R, Schneider G (2014). “A Multiple Filter Test for the Detection of Rate Changes in Renewal Processes with Varying Variance.” The Annals of Applied Statistics, 8(4), 2027–2067.
"""
function MOSUM_multi_scale(data::Array{Float64}, Gset::Array{Int64}; kwargs...)

    sort!(Gset)
    cps = Array{Int64}[]
    for G in Gset
        mosum_G = MOSUM(data, G; kwargs...)
        cps_G = mosum_G["changepoints"]
        if G == Gset[1]
            cps = cps_G
        else
            for k in cps_G
                min_dist = minimum(abs.(cps .- k))
                if min_dist >= G
                    push!(cps, k)
                end
            end # for
        end
    end


#    #step 1
#    PairSet = Array{Union{Float64, Int64}}[]
#    for G in Gset
#        mosum_G = MOSUM(data, G; default_args)
#        cps = mosum_G["changepoints"]
#        for k in cps
#            h = mosum_G["detector"][k]
#            push!(PairSet, [h, k, G])
#        end # for
#    end
#    sort!(Pairset)
#    #step 2
#    D = Array{Union{Float64, Int64}}[] #conflicting
#    Cset = PairSet
#    while length(PairSet) > 0
#        candidate = pop!(Pairset) #current max jump
#        for i in 1:length(PairSet)
#            if  abs(PairSet[i,2] -. candidate[2]) < min(candidate[3], PairSet[i,3])
#                take = popat(PairSet, i)
#                push!(D, take)
#            end
#        end
#    end
    return(cps)
    #2
end
