module Changepoints

using Distributions
using Distributions: Sampleable
using Base.Meta
import Base.rand

export PELT, @PELT, BS, @BS, CROPS, @segment_cost, NormalVarSegment, NormalMeanSegment, NormalMeanVarSegment, PoissonSegment, BetaSegment, ExponentialSegment, ChangepointSampler, GammaShapeSegment, GammaRateSegment, NonparametricSegment, OLSSegment, @changepoint_sampler, WBS, get_WBS_changepoints, MOSUM, get_cps_mosum

include("segment_costs.jl")
include("PELT.jl")
include("CROPS.jl")
include("BS.jl")
include("sim_type.jl")
include("macros.jl")
include("WBS.jl")
include("MOSUM.jl")

# This approach to loading supported plotting packages is taken directly from the "KernelDensity" package
macro glue(pkg)
    path = joinpath(dirname(@__FILE__),"glue",string(pkg,".jl"))
    init = Symbol(string(pkg,"_init"))
    quote
        $(esc(init))() = Base.include($path)
        isdefined(Main,$(QuoteNode(pkg))) && $(esc(init))()
    end
end

@glue Winston
@glue Gadfly

end # module
