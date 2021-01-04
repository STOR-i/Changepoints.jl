"""
    MOSUM(x, G, var_est_method, alpha, criterion, eta, epsilon)

Runs the MOSUM procedure for the univariate data x with bandwidth G, and returns the number and position of found changepoints.

See also: [`@BS`](@ref), [`@WBS`](@ref)

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
x, cps = @changepoint_sampler n λ Normal(μ, σ)
G = 150
# Run MOSUM procedure
MOSUM_out = MOSUM(x, G)
# Plot MOSUM detector
using Gadfly
Gadfly.plot(MOSUM_out)
```

# References
Eichinger, Birte, and Claudia Kirch. "A MOSUM procedure for the estimation of multiple random change points." Bernoulli 24.1 (2018): 526-564.
Meier, Alexander, Claudia Kirch, and Haeran Cho. "mosum: A package for moving sums in change point analysis." (2018).
"""
function MOSUM( x::Array{Float64} , G::Int64; var_est_method::String = "mosum",
     alpha::Float64 = 0.1, criterion::String = "eta", eta::Float64 = 0.4, epsilon::Float64 = 0.2)

    CP = Array{Int64}(undef,0)
    q = 0
    Reject = false
    n = length(x)

    csum = cumsum(x)
    sqsum = cumsum(x.^2)
    variance = zeros(Float64, n)
    lvar = zeros(Float64, n)
    rvar = zeros(Float64, n)
    lsqsums = zeros(Float64, n)
    rsqsums =  zeros(Float64, n)
    detector = zeros(Float64, n)
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
        end
        if var_est_method == "mosum.min"
            variance[t] = min( rvar[t], lvar[t])
        end
        detector[t] = abs(rsums[t] - lsums[t])/ sqrt(2*G*variance[t])
    end

    #threshold
    a = sqrt(2*n/G); b = 2log(n/G) + log(log(n/G))/2 + log(3/2) - log(pi)/2
    c = - log(log( (1-alpha)^(-.5) ))
    D = (b+c)/a

    mosum_stat, k = findmax(detector)

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
    return out

end


function get_cps_mosum(stat::Array{Float64} , D_n::Float64, G::Int64,  criterion::String = ["epsilon","eta"][1],
     eta::Float64 = 0.4, epsilon::Float64 = 0.2 )
  cps = Array{Int64}(undef,0) ##assign empty cps
  Reject = false
  if criterion == "epsilon"
      n = length(stat)
      rshift = stat[2:end]
      push!(rshift, 0.0)
      lshift = stat[1:(end-1)]
      pushfirst!(lshift, 0.0)
      over =  stat .> D_n #findall(x -> x > D_n , stat ) #indices greater than D_n
      vv = over .& (lshift .< D_n )#& lshift >0 ) #lowers
      v = findall(vv .== 1)
      ww = over .& (rshift .< D_n)
      w = findall(ww .== 1)
      nu_remove = findall(w-v .>= epsilon * G) #nu(epsilon) test for distance between
      v_nu = v[nu_remove]; w_nu = w[nu_remove] #c(w[nu_remove],n)
      sub_pairs = [v_nu w_nu]


   q = size(sub_pairs)[1]
   if  q>0
       for ii in 1:q
           interval = sub_pairs[ii,1]:sub_pairs[ii,2]
           kk = findmax(stat[interval])[2] #internal cp location
           push!(cps, kk + 1 + sub_pairs[ii,1]) #- G-p
       end
   end
 end
   if criterion == "eta"
       n = length(stat)
       window = Int(floor(eta*G))
       for t in (G+1):(n-G)
           if (stat[t] > D_n) & (stat[t] == maximum(stat[(t .- window):(t .+ window)]) )
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
