# Checks BS runs

@testset "Running BS tests..." begin

    n = 1000;        # Number of samples
    λ = 100;         # Frequencey of changes

    ########################
    # Normal mean segments #
    ########################
    μ, σ = Normal(0.0, 10.0), 1.0
    @test_nowarn sample, cps = @changepoint_sampler n λ Normal(μ, σ)
    @test_nowarn seg_costs = NormalMeanSegment(sample);
    @test_nowarn BS(seg_costs, n);
    @test_nowarn @BS sample Normal(?,σ)

    #######################
    # Normal var segments #
    #######################
    μ, σ = 1.0, Uniform(2.0, 15.0)
    @test_nowarn sample, cps = @changepoint_sampler n λ Normal(μ, σ)
    @test_nowarn seg_costs = NormalVarSegment(sample, μ)
    @test_nowarn BS(seg_costs, n)
    @test_nowarn @BS sample Normal(μ, ?)

    ############################
    # Exponential changepoints #
    ############################
    μ = Uniform(0.0, 10.0)
    @test_nowarn sample, cps = @changepoint_sampler n λ Exponential(μ)
    @test_nowarn seg_costs = ExponentialSegment(sample)
    @test_nowarn BS(seg_costs, n)
    @test_nowarn @BS sample Exponential(?)

    ########################
    # Poisson changepoints #
    ########################
    μ = Uniform(0.0, 10.0)
    @test_nowarn sample, cps = @changepoint_sampler n λ Poisson(μ)
    @test_nowarn seg_costs = PoissonSegment(sample)
    @test_nowarn BS(seg_costs, n)
    @test_nowarn @BS sample Poisson(?)
end
