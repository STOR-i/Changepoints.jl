@testset "Running WBS tests..." begin

    n = 1000;        # Number of samples
    λ = 100;         # Frequencey of changes

    ########################
    # Normal mean segments #
    ########################
    μ, σ = Normal(0.0, 10.0), 1.0
    sample, cps = @changepoint_sampler n λ Normal(μ, σ)
    seg_cost_CUSUM = Changepoints.CUSUM(sample);
    seg_cost_sSIC = Changepoints.sSIC(sample);

    @test_nowarn WBS(seg_cost_CUSUM, n);
    @test_nowarn get_WBS_changepoints(seg_cost_sSIC, WBS(seg_cost_CUSUM, n))

end
