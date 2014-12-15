using Winston

include(joinpath("parametric cost functions/continous distributions", "cost_normal_mean.jl"))
include(joinpath("algorithms", "PELT.jl"))
include("sim_type.jl")
                                                               
num_samples = 1000
lambda = 100         # Frequencey of changes
mu = 0.0             # Average mean
sd = 10.0            # Std. dev of mean

Y = NormalMeanChange(lambda, mu, sd)
sample = rand(Y, num_samples)

norm_seg_costs = NormalMeanSegment(sample)
pelt_output = PELT_general(norm_seg_costs, num_samples)


println(new_pelt_output[1])
println(Y.changepoints)

p = plot(sample)
for i in Y.changepoints
    add(p, LineX(i, color = "red", linewidth=0.5))
end


for i in pelt_output[1]
    add(p, LineX(i, color = "green", linewidth=0.5))
end
