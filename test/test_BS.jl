# Checks BS runs

println("Running BS tests...")

n = 1000;        # Number of samples
λ = 100;         # Frequencey of changes

########################
# Normal mean segments #
########################
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
seg_costs = NormalMeanSegment(sample);
BS(seg_costs, n);
@BS sample Normal(?,σ)

#######################
# Normal var segments #
#######################
μ, σ = 1.0, Uniform(2.0, 15.0)
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
seg_costs = NormalVarSegment(sample, μ)
BS(seg_costs, n)
@BS sample Normal(μ, ?)

############################
# Exponential changepoints #
############################
# Generate sample
μ = Uniform(0.0, 10.0)
sample, cps = @changepoint_sampler n λ Exponential(μ)
seg_costs = ExponentialSegment(sample)
BS(seg_costs, n)
@BS sample Exponential(?)

# Integer output not currently compatable with ChangepointSampler

## ###
## # Poisson changepoints
## ###

## # Generate sample
## μ = Uniform(0.0, 10.0)
## Y = ChangepointSampler(()->Poisson(rand(μ)), λ)
## sample = rand(Y, n)

## # Run BS
## seg_costs = PoissonSegment(sample)
## BS(seg_costs, n)

