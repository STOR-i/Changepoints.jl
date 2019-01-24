@testset "Running CROPS tests..." begin

    n = 1000;        # Number of samples
    λ = 100;         # Frequencey of changes
    β₁, β₂ = (1.1, 6.1)

    function test_CROPS(segment_cost::Function , n::Int64, β₁::Real, β₂::Real)
        out = CROPS(segment_cost, n, β₁, β₂)
        for (i, β) in enumerate(out["penalty"])
            #println("i=$i, β=$β")
            cps, cost = PELT(segment_cost, n; pen=β)
            @test out["constrained"][i] ≈ (cost-(length(cps)-1)*β) atol=1e-3
        end
    end

    ########################
    # Normal mean segments #
    ########################

    μ, σ = Normal(0.0, 10.0), 1.0
    sample, cps = @changepoint_sampler n λ Normal(μ, σ)
    segment_cost = NormalMeanSegment(sample);
    #test_CROPS(segment_cost, n, β₁, β₂)
    out = @PELT sample Normal(:?,σ) β₁ β₂

    # num,cons = Int[], Float64[]
    # for (i, β) in enumerate(out["penalty"])
    #     #println("i=$i, β=$β")
    #     cps, cost = PELT(segment_cost, n; pen=β)
    #     push!(num, length(cps))
    #     push!(cons, cost-(length(cps)-1)*β)
    # end

    # cons'
    # out["constrained"]'


    #######################
    # Normal var segments #
    #######################
    μ, σ = 1.0, Uniform(2.0, 15.0)
    sample, cps = @changepoint_sampler n λ Normal(μ, σ)
    seg_costs = NormalVarSegment(sample, μ)
    test_CROPS(seg_costs, n, β₁, β₂)
    @PELT sample Normal(μ, :?) β₁ β₂

    ############################
    # Exponential changepoints #
    ############################
    μ = Uniform(0.0, 10.0)
    sample, cps = @changepoint_sampler n λ Exponential(μ)
    seg_costs = ExponentialSegment(sample)
    CROPS(seg_costs, n, β₁, β₂)
    @PELT sample Exponential(:?) β₁ β₂

    ########################
    # Poisson changepoints #
    ########################
    μ = Uniform(0.0, 10.0)
    sample, cps = @changepoint_sampler n λ Poisson(μ)
    seg_costs = PoissonSegment(sample)
    CROPS(seg_costs, n, β₁, β₂)
    @PELT sample Poisson(:?) β₁ β₂
end
