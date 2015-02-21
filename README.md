# Changepoints.jl

A Julia package for the detection of multiple changepoints in time series.

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient DP based search algorithms (PELT , Binary Segmentation and FPOP (coming soon)).
- A wide choice of cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Cost functions seperated in such a way that custom costs are simple to implement.

For a general overview of the multiple changepoint problem and mathematical details see [PELT](http://arxiv.org/pdf/1101.1438.pdf) and [FPOP](http://arxiv.org/abs/1409.1842).

# Usage


## Simulation

For testing or simulation studies it is often useful to be able to simulate time series with changepoints in them, this is more difficult than it sounds often as 
it is bad practice to fix the position and number of changes. The following macro enables us to simulate time series with changepoints seperated by random time intervals drawn from a Poisson(lambda)
distribution and parameters that themselves have distributions. 

```
n = 1000          # Sample size
lambda = 70       # freq of changepoints
mu, sigma = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n lambda Normal(mu, sigma)
```

![Alt text](http://www.addictedtoibiza.com/wp-content/uploads/2012/12/example.png)


`x = @PELT data Normal(?,1)`

## Penalty selection

The methods implemented view the problem as one of optimising a penalised likelihood where the penalty comes in whenever a new changepoint is added. Assuming 
we have specified the correct parametric (non-parametric cost coming soon) model/cost function then the only area of possible misspecification is in the 
value of the penalty. There is no "correct" choice of penalty however it can be very instructive to look at the segmentations and especially the number of changepoints
for a range of penalties. The Changepoints for a Range Of PenaltieS (CROPS) method allows us to do this efficiently using PELT, by exploiting the relationship 
between the penalised and constrained versions of the same optimisation problem. For more information see [CROPS](http://arxiv.org/abs/1412.3617).

