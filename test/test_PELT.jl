# Checks PELT runs

println("Running PELT tests...")

n = 1000;        # Number of samples
λ = 100;         # Frequencey of changes

########################
# Normal mean segments #
########################
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
seg_costs = NormalMeanSegment(sample);
PELT(seg_costs, n);
@PELT sample Normal(?,σ)

#######################
# Normal var segments #
#######################
μ, σ = 1.0, Uniform(2.0, 15.0)
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
seg_costs = NormalVarSegment(sample, μ)
PELT(seg_costs, n)
@PELT sample Normal(μ, ?)

############################
# Exponential changepoints #
############################
μ = Uniform(0.0, 10.0)
sample, cps = @changepoint_sampler n λ Exponential(μ)
seg_costs = ExponentialSegment(sample)
PELT(seg_costs, n)
@PELT sample Exponential(?)

########################
# Poisson changepoints #
########################
μ = Uniform(0.0, 10.0)
sample, cps = @changepoint_sampler n λ Poisson(μ)
seg_costs = PoissonSegment(sample)
PELT(seg_costs, n)
@PELT sample Poisson(?)
