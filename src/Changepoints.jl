module Changepoints

using Distributions
using Winston
using Base.Meta
import Base.rand

export PELT, BS, CROPS, @PELT, NormalVarSegment, NormalMeanSegment, ExponentialSegment, ChangepointSampler, @changepoint_sampler, elbow_plot, plot_chpts

include("segment_costs.jl")
include("PELT.jl")
include("sim_type.jl")
include("CROPS.jl")
include("plotting.jl")


end # module
