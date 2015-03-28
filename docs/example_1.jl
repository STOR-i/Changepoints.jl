# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Winston plotting package

using Distributions, Winston
using Changepoints
                                                               
n = 1000        # Sample size
λ = 100         # Frequencey of changes

μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)

# Find changepoints via PELT
pelt_cps, pelt_cost = @PELT sample Normal(?, σ)

# Find changepoints via BS
bs_cps = @BS sample Normal(?, σ)

# Plot data with true changepoints
p = plot(sample, cps)
# Add lines for PELT changepoints
for i in pelt_cps
    add(p, LineX(i, color = "green", linewidth=0.5))
end
