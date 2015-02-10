module changepoints

using Distributions
using Base.Meta
import Base.rand

export PELT, NormalVarSegment, NormalMeanSegment, ExponentialSegment, ChangepointSampler, @changepoint_sampler

include("segment_costs.jl")
include("PELT.jl")
include("sim_type.jl")

end # module
