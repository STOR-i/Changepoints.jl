module Changepoints

using Distributions
using Base.Meta
import Base.rand

VERSION < v"0.4-" && using Docile

@document

export PELT, @PELT, NormalVarSegment, NormalMeanSegment, ExponentialSegment, ChangepointSampler, @changepoint_sampler, CROPS, plot_cpts, elbow_plot

include("segment_costs.jl")
include("CROPS.jl")
include("PELT.jl")
include("sim_type.jl")
include("plotting.jl")

end # module
