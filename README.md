# Changepoints.jl

A Julia package for the detection of multiple changepoints in time series.

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient DP based search algorithms (PELT , Binary Segmentation and FPOP (coming soon)).
- A wide choice of cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Cost functions seperated in such a way that custom costs are simple to implement.

For a general overview of the multiple changepoint problem and mathematical details see [PELT](http://arxiv.org/pdf/1101.1438.pdf) and [FPOP](http://arxiv.org/abs/1409.1842).

# Usage

As an example first we simulate a time series with multiple changes in mean and then segment it using PELT plotting the time series as we go.

## Simulation

This code simulates a time series of length n with segments that have lengths drawn from a Poisson distribution with mean lambda. The variance
is fixed in this case as 1 but for each new segment a new mean is drawn from a standard gaussian distribution.

```
n = 1000          # Sample size
lambda = 70       # freq of changepoints
mu, sigma = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n lambda Normal(mu, sigma)
```

![screenshot](https://bitbucket.org/bardwell/changepoints.jl/raw/master/example.png)


```
x = @PELT data Normal(?,1)
plot_chpts(data,x[1]) 
```

![screenshot](https://bitbucket.org/bardwell/changepoints.jl/raw/master/example_pelt.png)


## Penalty selection

The methods implemented view the problem as one of optimising a penalised likelihood where the penalty comes in whenever a new changepoint is added. Assuming 
we have specified the correct parametric (non-parametric cost coming soon) model/cost function then the only area of possible misspecification is in the 
value of the penalty. There is no "correct" choice of penalty however it can be very instructive to look at the segmentations and especially the number of changepoints
for a range of penalties. The Changepoints for a Range Of PenaltieS (CROPS) method allows us to do this efficiently using PELT, by exploiting the relationship 
between the penalised and constrained versions of the same optimisation problem. For more information see [CROPS](http://arxiv.org/abs/1412.3617).

