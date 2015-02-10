# Check ChangepointSampler works for different distributions

using Distributions

num_samples = 1000
λ = 50                 # Frequency of changes

println("Running ChangepointSampler tests...")

# Normal mean change sampler
mu = Normal(1.0, 1.0)
σ = 1.0
Y = ChangepointSampler(()->Normal(rand(mu), σ), λ)
rand(Y, num_samples)
@changepoint_sampler num_samples λ Normal(mu, σ)

# Normal variance change sampler
μ = 1.0
σ = Uniform(2.0, 15.0)
Y = ChangepointSampler(()->Normal(μ, rand(σ)), λ)
rand(Y, num_samples)
@changepoint_sampler num_samples λ Normal(μ, σ)

# Exponential change sampler
μ = Uniform(0.0, 10.0)
Y = ChangepointSampler(()->Exponential(rand(μ)), λ)
rand(Y, num_samples)
@changepoint_sampler num_samples λ Exponential(μ)

# Poisson change sampler
μ = Uniform(0.0, 10.0)
Y = ChangepointSampler(()->Poisson(rand(μ)), λ)
rand(Y, num_samples)
@changepoint_sampler num_samples λ Poisson(μ)


