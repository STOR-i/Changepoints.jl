read_data(fn::String) = vec(readdlm(fn, skipstart=1))
read_cpts(fn::String) = vec([0, readdlm(fn, Int, skipstart=1)])

dir = "Test_Files"

# Normal mean change
data = read_data("$(dir)/Normal_change_in_mean_data")
r_cpts = read_cpts("$(dir)/Normal_change_in_mean_cpts")
cpts, cost = @PELT data Normal(?, 1.0) 2*log(length(data))
@test r_cpts == cpts

# Normal var change
data = read_data("$(dir)/Normal_change_in_var_data")
r_cpts = read_cpts("$(dir)/Normal_change_in_var_cpts")
cpts, cost = @PELT data Normal(1.0, ?) 2*log(length(data))
@test r_cpts == cpts

# Normal meanvar change
data = read_data("$(dir)/Normal_change_in_meanvar_data")
r_cpts = read_cpts("$(dir)/Normal_change_in_meanvar_cpts")
cpts, cost = @PELT data Normal(?, ?) 4*log(length(data))
@test r_cpts == cpts

# Poisson change
data = read_data("$(dir)/Poisson_data")
r_cpts = read_cpts("$(dir)/Poisson_cpts")
cpts, cost = @PELT data Poisson(?) 2*log(length(data))
@test r_cpts == cpts

# Exponential change
data = read_data("$(dir)/Exponential_data")
r_cpts = read_cpts("$(dir)/Exponential_change_in_mean_cpts")
cpts, cost = @PELT data Exponential(?) 2*log(length(data))
@test r_cpts == cpts
