# example of use
using Winston, Distributions
using Changepoints

# Simulate time series with changepoints
n = 1000          # Sample size
λ = 25            # Freq of changepoints
μ, σ = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n λ Normal(μ, σ)

# Find the Changepoints for a specific penalty
pelt_cps, pelt_cost = @PELT data Normal(?, 1.0) 10.0

# For a range of penalties construct a cost function and use the CROPS function
seg_cost = NormalMeanSegment(data)
crops_output = CROPS(seg_cost , n, (4.0,100.0))
# ...or use the PELT macro
@PELT data Normal(?, 1.0) 4.0 100.0

# 1st plot in readme (with chpt)
plot(data, pelt_cps)
# savefig("example_pelt.png",width=750)

# elbow plot
plot(crops_output)
# savefig("elbow_plot.png",width=750)
