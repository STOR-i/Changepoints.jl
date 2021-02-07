# This script produces all of the plots that appear in the README.md file
#
# Requires Plots package

using Random
using Distributions, Plots
using Changepoints

Random.seed!(1) # Fix random seed

#########################
# Simulate changepoints #
#########################

# Simulate time series with changepoints
n = 1000          # Sample size
λ = 70            # Freq of changepoints

# Mu parameter sampled from a N(0, 1) distribution for each changepoint
μ, σ = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n λ Normal(μ, σ)
changepoint_plot(data, cps)
savefig("Plots_example.png")

# PELT

pelt_cps, cost = @PELT data Normal(:?, 1.0)
changepoint_plot(data, pelt_cps)
savefig("Plots_example_pelt.png")


# CROPS

seg_cost = NormalMeanSegment(data, σ) 
pen1, pen2 = 4.0, 100.0 # Penalty range
crops_output = CROPS(seg_cost, n, pen1, pen2)
elbow_plot(crops_output)
savefig("Plots_elbow_plot.png")

# MOSUM

G = 35
MOSUM_output = @MOSUM data G
mosum_plot(MOSUM_output)
savefig("Plots_mosum_plot.png")

# MOSUM multi-scale

Gset = [20, 30, 50, 80, 130]
MOSUM_multi_scale_output =  @MOSUM_multi_scale data Gset
changepoint_plot(data, MOSUM_multi_scale_output)
savefig("Plots_mosum_multi_scale.png")

# WBS

WBS_return = @WBS data
seg_cost_sSIC = Changepoints.sSIC(data)
WBS_cps = get_WBS_changepoints(seg_cost_sSIC, WBS_return, 5)
changepoint_plot(data, WBS_cps[1])
savefig("Plots_WBS.png")

SeedBS_return = @WBS data do_seeded=true
SeedBS_cps = get_WBS_changepoints(seg_cost_sSIC, SeedBS_return, 5)
changepoint_plot(data, SeedBS_cps[1])
savefig("Plots_SeedBS.png")
