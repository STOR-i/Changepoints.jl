module Changepoints

using Distributions
using Winston
using Base.Meta
import Base.rand

VERSION < v"0.4-" && using Docile

@document

export PELT, @PELT, BS, @BS, NormalVarSegment, NormalMeanSegment, NormalMeanVarSegment, PoissonSegment, BetaSegment, ExponentialSegment, ChangepointSampler, @changepoint_sampler, CROPS, plot_cpts, elbow_plot

include("segment_costs.jl")
include("PELT.jl")
include("CROPS.jl")
include("BS.jl")
include("sim_type.jl")
include("macros.jl")
include("plotting.jl")

end # module
