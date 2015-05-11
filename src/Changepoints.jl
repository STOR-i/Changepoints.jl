using Distributions

module Changepoints

using Distributions
using Base.Meta
import Base.rand

VERSION < v"0.4-" && using Docile

@document

export PELT, @PELT, BS, @BS, CROPS, @segment_cost, NormalVarSegment, NormalMeanSegment, NormalMeanVarSegment, PoissonSegment, BetaSegment, ExponentialSegment, ChangepointSampler, GammaShapeSegment, GammaRateSegment, NonparametricSegment, @changepoint_sampler

include("segment_costs.jl")
include("PELT.jl")
include("CROPS.jl")
include("BS.jl")
include("sim_type.jl")
include("macros.jl")

# This approach to loading supported plotting packages is taken directly from the "KernelDensity" package
macro glue(pkg)
    path = joinpath(dirname(@__FILE__),"glue",string(pkg,".jl"))
    init = symbol(string(pkg,"_init"))
    quote
        $(esc(init))() = Base.include($path)
        isdefined(Main,$(QuoteNode(pkg))) && $(esc(init))()
    end
end

@glue Winston

end # module
