# example of use
using Distributions
using Base.Meta
import Base.rand
include("sim_type.jl")
include("PELT.jl")
include("segment_costs.jl")
include("CROPS.jl")
include("plotting.jl")

# simulate chpts
n = 1000          # Sample size
lambda = 25      # freq of changepoints
mu, sigma = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n lambda Normal(mu, sigma)

# find them
x = @PELT data Normal(?,1)

seg_cost = NormalMeanSegment(data)

pen_range = CROPS(seg_cost , n, [4.0,100.0] ) 
x = pen_range["number"]
y = pen_range["constrained"]

#using Winston

 p = FramedPlot(
         title="Elbow plot for range of penalties",
         ylabel="Cost",
         xlabel="Number of segments")
a = Points(x, y, kind="circle")
add(p, a, Curve(x, y))


methods(CROPS)

# 1st plot in readme (with chpt)
plot_chpts(data,x[1]) 
savefig("example_pelt.png",width=750)

# elbow plot
elbow_plot(pen_range)
savefig("elbow_plot.png",width=750)
# this works
file(p,"elbowplot.png",width=750)
