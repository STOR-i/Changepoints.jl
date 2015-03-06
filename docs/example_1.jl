# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Winston plotting package

using Distributions, Winston
using changepoints


                                                               
n = 1000        # Sample size
λ = 100         # Frequencey of changes

μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
pelt_output = @PELT sample Normal(?, σ)

println(pelt_output[1])
println(cps)

p = plot(sample)
for i in cps
    add(p, LineX(i, color = "red", linewidth=0.5))
end


for i in pelt_output[1]
    add(p, LineX(i, color = "green", linewidth=0.5))
end
