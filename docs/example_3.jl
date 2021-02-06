# This script provides an example of simulating changepoint data,
# using CROPS to find changepoints for a range of penalties,
# and plotting the results of this.
#
# Requires Plots package

using Random
using Distributions, Plots
using Changepoints

Random.seed!(1) # Fix random seed

#########################
# Simulate changepoints #
#########################

# Simulate time series with changepoints
n = 1000          # Sample size
λ = 25            # Freq of changepoints

# Mu parameter sampled from a N(0, 1) distribution for each changepoint
μ, σ = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n λ Normal(μ, σ)

########################
# Finding changepoints #
########################

# For a range of penalties construct a cost function and use the CROPS function
seg_cost = NormalMeanSegment(data)
crops_output = CROPS(seg_cost , n, (4.0,100.0))
# ...or use the PELT macro
# crops_output = @PELT data Normal(?, 1.0) 4.0 100.0

p1 = plot(data, label="Simulated time series with changepoint")
p2 = plot()
elbow_plot!(p2, crops_output)
p = plot(p1, p2, layout=(2,1))
gui()
