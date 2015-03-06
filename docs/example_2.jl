# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Winston plotting package

using changepoints, Distributions
using Winston

n = 1000           # Sample size
λ = 100            # Frequencey of changes

# Generate a sample with changing 
μ, σ = 1.0, Uniform(2.0, 15.0)
y, cps = @changepoint_sampler n λ Normal(μ, σ)
pelt_output = @PELT y Normal(μ, ?)

println(pelt_output[1])
println(cps)

p = plot(y)
for i in cps
    add(p, LineX(i, color = "red", linewidth=0.5))
end

for i in pelt_output[1]
    add(p, LineX(i, color = "green", linewidth=0.5))
end
