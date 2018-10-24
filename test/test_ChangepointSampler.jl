# Check ChangepointSampler works for different distributions

using Distributions

@testset "Running ChangepointSampler tests..." begin

    num_samples = 1000
    λ = 50                 # Frequency of changes

    # Normal mean change sampler
    μ = Normal(1.0, 1.0)
    σ = 1.0
    Y = ChangepointSampler(()->Normal(rand(μ), σ), λ)
    @test_nowarn rand(Y, num_samples)
    @test_nowarn @changepoint_sampler num_samples λ Normal(μ, σ)

    # Normal variance change sampler
    μ = 1.0
    σ = Uniform(2.0, 15.0)
    Y = ChangepointSampler(()->Normal(μ, rand(σ)), λ)
    @test_nowarn rand(Y, num_samples)
    @test_nowarn @changepoint_sampler num_samples λ Normal(μ, σ)

    # Exponential change sampler
    μ = Uniform(0.0, 10.0)
    Y = ChangepointSampler(()->Exponential(rand(μ)), λ)
    @test_nowarn rand(Y, num_samples)
    @test_nowarn @changepoint_sampler num_samples λ Exponential(μ)

    # Poisson change sampler
    μ = Uniform(0.0, 10.0)
    Y = ChangepointSampler(()->Poisson(rand(μ)), λ)
    @test_nowarn rand(Y, num_samples)
    @test_nowarn @changepoint_sampler num_samples λ Poisson(μ)
end
