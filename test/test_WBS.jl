@testset "Running WBS tests..." begin

    n = 1000;        # Number of samples
    λ = 100;         # Frequency of changes

    ########################
    # Normal mean segments #
    ########################
    μ, σ = Normal(0.0, 10.0), 1.0
    data, cps = @changepoint_sampler n λ Normal(μ, σ)
    seg_cost_sSIC = Changepoints.sSIC(data);

    @test_nowarn WBS(data);
    @test_nowarn get_WBS_changepoints(seg_cost_sSIC, WBS(data) );
    @test_nowarn WBS(data; do_seeded = true);

end
