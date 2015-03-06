module Changepoints

using Distributions
using Winston
using Base.Meta
import Base.rand

<<<<<<< HEAD
export PELT, BS, CROPS, @PELT, NormalVarSegment, NormalMeanSegment, ExponentialSegment, ChangepointSampler, @changepoint_sampler, elbow_plot, plot_chpts
=======
export PELT, @PELT, NormalVarSegment, NormalMeanSegment, ExponentialSegment, ChangepointSampler, @changepoint_sampler, CROPS, plot_cpts, elbow_plot
>>>>>>> d00dfa9744a17d57ebfcabc77434ebb71fcc9ebc

include("segment_costs.jl")
include("CROPS.jl")
include("PELT.jl")
include("sim_type.jl")
<<<<<<< HEAD
include("CROPS.jl")
include("plotting.jl")

=======
include("plotting.jl")
>>>>>>> d00dfa9744a17d57ebfcabc77434ebb71fcc9ebc

end # module
