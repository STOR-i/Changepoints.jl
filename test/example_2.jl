# This script provides an example of simulating changepoint data,
# using PELT to find these changepoints, and plotting the results
#
# Requires Winston plotting package

using changepoints
using Winston

num_samples = 1000
λ = 100            # Frequencey of changes

# Create a
μ = 1.0
σ = Uniform(2.0, 15.0)
Y = ChangepointSampler(()->Normal(μ, rand(σ)), λ)
sample = rand(Y, num_samples)

norm_seg_costs = NormalVarSegment(sample, μ)
pelt_output = PELT_general(norm_seg_costs, num_samples)

println(pelt_output[1])
println(Y.changepoints)

p = plot(sample)
for i in Y.changepoints
    add(p, LineX(i, color = "red", linewidth=0.5))
end

for i in pelt_output[1]
    add(p, LineX(i, color = "green", linewidth=0.5))
end
