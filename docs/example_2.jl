# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Gadfly plotting package

using Changepoints, Distributions
using Gadfly

n = 1000           # Sample size
λ = 100            # Frequencey of changes

# Generate a sample with changing 
μ, σ = 1.0, Uniform(2.0, 15.0)
y, cps = @changepoint_sampler n λ Normal(μ, σ)
pelt_cps, cost = @PELT y Normal(μ, ?)

println(pelt_cps)
println(cps)

p = plot(y, pelt_cps)
