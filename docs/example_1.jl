# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Plots package

using Distributions, Plots
using Changepoints

#########################
# Simulate changepoints #
#########################

n = 1000        # Length of sample
λ = 100         # Frequencey of changes

# Mu parameter sampled from a N(0,10) distribution for each changepoint
μ = Normal(0,5) 
σ = 1.0 # Sigma parameter fixed

# Construct sample with changepoints where
# at each changepoint a new value is sample for μ
sample, cps = @changepoint_sampler n λ Normal(μ, σ)

########################
# Finding changepoints #
########################

# Find changepoints via PELT
# assuming Normal likelihood with changing mean
# parameter and fixed standard deviation of σ
pelt_cps, pelt_cost = @PELT sample Normal(:?, σ)

# Find changepoints via Binary Segmentation
bs_cps, bs_cost = @BS sample Normal(:?, σ)

# If plotting multiple sets of changepoints which need to labelled
# separately, it is best not to use `changepoint_plot` function
# but to instead first plot data
# and then add changepoints with `vline!` function
p = plot(sample, label="Simulated data")
vline!(p, cps, label="True changepoints")
vline!(p, pelt_cps, label="PELT changepoints")
vline!(p, bs_cps, label="BS changepoints")
display(p)
