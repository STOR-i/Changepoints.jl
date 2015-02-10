# Checks PELT runs

println("Running PELT tests...")

num_samples = 1000;
lambda = 100;         # Frequencey of changes

###
# Normal mean segments

mu = 0.0;             # Average mean
sd = 10.0;            # Std. dev of mean

Y = NormalMeanChange(lambda, mu, sd);
sample = rand(Y, num_samples);
seg_costs = NormalMeanSegment(sample);
PELT(seg_costs, num_samples);

###
# Normal var segments
###

# Generate sample
μ = 1.0
σ = Uniform(2.0, 15.0)
Y = ChangepointSampler(()->Normal(μ, rand(σ)), λ)
sample = rand(Y, num_samples)

# Run PELT
seg_costs = NormalVarSegment(sample, μ)
PELT(seg_costs, num_samples)

###
# Exponential changepoints
###

# Generate sample
μ = Uniform(0.0, 10.0)
Y = ChangepointSampler(()->Exponential(rand(μ)), λ)
sample = rand(Y, num_samples)

# Run PELT
seg_costs = ExponentialSegment(sample)
PELT(seg_costs, num_samples)

# Integer output not currently compatable with ChangepointSampler

## ###
## # Poisson changepoints
## ###

## # Generate sample
## μ = Uniform(0.0, 10.0)
## Y = ChangepointSampler(()->Poisson(rand(μ)), λ)
## sample = rand(Y, num_samples)

## # Run PELT
## seg_costs = PoissonSegment(sample)
## PELT(seg_costs, num_samples)

