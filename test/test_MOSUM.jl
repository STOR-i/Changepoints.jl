@testset "Running MOSUM tests..." begin

    n = 1000;        # Number of samples
    λ = 100;         # Frequencey of changes

    ########################
    # Normal mean segments #
    ########################
    μ, σ = Normal(0.0, 10.0), 1.0
    sample, cps = @changepoint_sampler n λ Normal(μ, σ)

    @test_nowarn MOSUM(sample, 100);

end
