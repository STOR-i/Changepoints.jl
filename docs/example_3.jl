using Gadfly, Distributions
using Changepoints

srand(1)

# Simulate time series with changepoints
n = 1000          # Sample size
λ = 25            # Freq of changepoints
μ, σ = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n λ Normal(μ, σ)

# Find the Changepoints for a specific penalty
pelt_cps, pelt_cost = @PELT data Normal(?, 1.0) 6.0

# For a range of penalties construct a cost function and use the CROPS function
seg_cost = NormalMeanSegment(data)
crops_output = CROPS(seg_cost , n, (4.0,100.0))
# ...or use the PELT macro
@PELT data Normal(?, 1.0) 4.0 100.0

# 1st plot: time series
p1 = plot(y=data, Geom.line, Theme(default_color=colorant"black"))
draw(PNG("example.png", 5inch, 5inch), p1)

# 2nd plot: time series with chpts
p2 = plot(data, pelt_cps)
draw(PNG("example_pelt.png", 5inch, 5inch), p2)

# 3rd: elbow plot
p3 = plot(crops_output)
draw(PNG("elbowplot.png", 5inch, 5inch), p3)
