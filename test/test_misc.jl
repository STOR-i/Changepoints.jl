@testset "other functions" begin
    x = rand(100)
    @test Changepoints.zero_cumsum(x) ≈ [eltype(x)(0); cumsum(x)]
    @test Changepoints.zero_cumsum(x -> x ^ 2, x) ≈ [eltype(x)(0); cumsum(x .^ 2)]
end

