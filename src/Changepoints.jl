module Changepoints

using Distributions
using Distributions: Sampleable
using Base.Meta
using RecipesBase
using Statistics
using Statistics: median
import Base.rand

export PELT, @PELT, BS, @BS, CROPS, @segment_cost, NormalVarSegment, NormalMeanSegment, NormalMeanVarSegment, PoissonSegment, BetaSegment, ExponentialSegment, ChangepointSampler, GammaShapeSegment, GammaRateSegment, NonparametricSegment, OLSSegment, @changepoint_sampler, WBS, @WBS, get_WBS_changepoints, MOSUM, @MOSUM, get_cps_mosum, @MOSUM_multi_scale, sSIC

include("segment_costs.jl")
include("PELT.jl")
include("CROPS.jl")
include("BS.jl")
include("sim_type.jl")
include("macros.jl")
include("WBS.jl")
include("MOSUM.jl")
include("plots.jl")

end # module
