# example of use
using Distributions, Winston
using Changepoints

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

# 1st plot in readme (with chpt)
plot_cpts(data,x[1])
# savefig("example_pelt.png",width=750)

# elbow plot
elbow_plot(pen_range)
# savefig("elbow_plot.png",width=750)
