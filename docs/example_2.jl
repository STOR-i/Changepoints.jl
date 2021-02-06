# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Plots package

using Changepoints, Distributions
using Plots

#########################
# Simulate changepoints #
#########################

n = 1000           # Sample size
λ = 100            # Frequencey of changes

# Sigma parameter sampled from a Uniform(2,15) distribution for each changepoint
μ, σ = 1.0, Uniform(2.0, 15.0)
# Generate a sample with from Normal distribution with changing variance
y, cps = @changepoint_sampler n λ Normal(μ, σ)

########################
# Finding changepoints #
########################

pelt_cps, cost = @PELT y Normal(μ, :?)

println("True changepoints:", cps)
println("Changepoint found by PELT:", pelt_cps)

changepoint_plot(y, pelt_cps)
gui()
