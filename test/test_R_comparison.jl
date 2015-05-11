read_data(fn::String) = vec(readdlm(fn, skipstart=1))
read_cpts(fn::String) = vec([0, readdlm(fn, Int, skipstart=1)])

dir = "Test_Files"

comp_handler(r::Test.Success) = true
comp_handler(r::Test.Failure) = false
comp_handler(r::Test.Error) = rethrow(r)

function test_cpts(r_cpts, cpts)
    Test.with_handler(comp_handler) do    
        if @test r_cpts == cpts
            println("\tSuccess!")
        else
            println("Fail:")
            println("\tR Changepoints: $(r_cpts)")
            println("\tJulia Changepoints: $(cpts)")
        end
    end    
end

# Normal mean change

println("Test Normal mean change...")
data = read_data("$(dir)/Normal_change_in_mean_data")
r_cpts = read_cpts("$(dir)/Normal_change_in_mean_cpts")
cpts, cost = @PELT data Normal(?, 1.0) 2*log(length(data))
test_cpts(r_cpts, cpts)
    
# Normal var change
println("Test Normal variance change...")
data = read_data("$(dir)/Normal_change_in_var_data")
r_cpts = read_cpts("$(dir)/Normal_change_in_var_cpts")
cpts, cost = @PELT data Normal(1.0, ?) 2*log(length(data))
test_cpts(r_cpts, cpts)


# Normal meanvar change
println("Test Normal mean and variance chaange...")
data = read_data("$(dir)/Normal_change_in_meanvar_data")
r_cpts = read_cpts("$(dir)/Normal_change_in_meanvar_cpts")
cpts, cost = @PELT data Normal(?, ?) 4*log(length(data))
test_cpts(r_cpts, cpts)

# Poisson change
println("Test Poisson change...")
data = read_data("$(dir)/Poisson_data")
r_cpts = read_cpts("$(dir)/Poisson_cpts")
cpts, cost = @PELT data Poisson(?) 2*log(length(data))
test_cpts(r_cpts, cpts)

# Exponential change
println("Test Exponential  change...")
data = read_data("$(dir)/Exponential_data")
r_cpts = read_cpts("$(dir)/Exponential_change_in_mean_cpts")
cpts, cost = @PELT data Exponential(?) 2*log(length(data))
test_cpts(r_cpts, cpts)

# Gamma rate changes
println("Test Gamma rate change...")
data = read_data("$(dir)/Gamma_data")
r_cpts = read_cpts("$(dir)/Gamma_cpts")
cpts, cost = @PELT data Gamma(1.0,?) 2*log(length(data))
test_cpts(r_cpts, cpts)

println("Test Nonparametric change...")
data = read_data("$(dir)/Nonparametric_data")
r_cpts = read_cpts("$(dir)/Nonparametric_cpts")
cpts, cost = @PELT data Nonparametric(1) 4*log(length(data))
test_cpts(r_cpts, cpts)
