using Changepoints
using Test

# write your own tests here
include("test_misc.jl")
include("test_ChangepointSampler.jl")
include("test_PELT.jl")
include("test_BS.jl")
include("test_R_comparison.jl")
include("test_WBS.jl")
include("test_MOSUM.jl")

# Testing code need to be verified
# include("test_CROPS.jl")
