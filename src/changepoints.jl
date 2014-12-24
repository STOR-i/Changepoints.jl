module changepoints

export PELT_general, NormalMeanChange, NormalVarSegment, NormalMeanSegment, ExponentialSegment, ChangepointSampler

include("segment_costs.jl")
include("PELT.jl")
include("sim_type.jl")

end # module
