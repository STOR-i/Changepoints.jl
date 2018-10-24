using DelimitedFiles: readdlm

read_data(fn::AbstractString) = vec(readdlm(fn, skipstart=1))
read_cpts(fn::AbstractString) = vec([0; readdlm(fn, Int, skipstart=1)])

dir = "Test_Files"

@testset "Test Normal mean change..." begin
    data = read_data("$(dir)/Normal_change_in_mean_data")

    r_cpts = read_cpts("$(dir)/Normal_change_in_mean_cpts")
    cpts, cost = @PELT data Normal(:?, 1.0) 2*log(length(data))

    @test r_cpts == cpts
end


# Normal var change
@testset "Test Normal variance change..." begin
    data = read_data("$(dir)/Normal_change_in_var_data")

    r_cpts = read_cpts("$(dir)/Normal_change_in_var_cpts")
    cpts, cost = @PELT data Normal(1.0, :?) 2*log(length(data))

    @test r_cpts == cpts
end



# Normal meanvar change
@testset "Test Normal mean and variance chaange..." begin
    data = read_data("$(dir)/Normal_change_in_meanvar_data")

    r_cpts = read_cpts("$(dir)/Normal_change_in_meanvar_cpts")
    cpts, cost = @PELT data Normal(:?, :?) 4*log(length(data))

    @test r_cpts == cpts
end


# Poisson change
@testset "Test Poisson change..." begin
    data = read_data("$(dir)/Poisson_data")

    r_cpts = read_cpts("$(dir)/Poisson_cpts")
    cpts, cost = @PELT data Poisson(:?) 2*log(length(data))

    @test r_cpts == cpts
end


# Exponential change
@testset "Test Exponential  change..." begin
    data = read_data("$(dir)/Exponential_data")

    r_cpts = read_cpts("$(dir)/Exponential_change_in_mean_cpts")
    cpts, cost = @PELT data Exponential(:?) 2*log(length(data))

    @test r_cpts == cpts
end


# Gamma rate changes
@testset "Test Gamma rate change..." begin
    data = read_data("$(dir)/Gamma_data")

    r_cpts = read_cpts("$(dir)/Gamma_cpts")
    cpts, cost = @PELT data Gamma(1.0,:?) 2*log(length(data))

    @test r_cpts == cpts
end


@testset "Test Nonparametric change..." begin
    data = read_data("$(dir)/Nonparametric_data")

    r_cpts = read_cpts("$(dir)/Nonparametric_cpts")
    cpts, cost = @PELT data Nonparametric(10) 4*log(length(data))

    @test r_cpts == cpts
end

