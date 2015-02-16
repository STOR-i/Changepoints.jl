# Changepoints.jl

A Julia package for the detection of multiple changepoints in time series.

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient DP based search algorithms (PELT , Binary Segmentation and FPOP (coming soon)).
- A wide choice of cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Cost functions seperated in such a way that custom costs are simple to implement.

For a general overview of the multiple changepoint problem and mathematical details see [PELT](http://arxiv.org/pdf/1101.1438.pdf) and [FPOP](http://arxiv.org/abs/1409.1842).

## Usage

`@PELT(data,dist,penalty) `


## Penalty selection

The methods implemented view the problem as one of optimising a penalised likelihood where the penalty comes in whenever a new changepoint is added. Assuming 
we have specified the correct parametric (non-parametric cost coming soon) model/cost function then the only area of possible misspecification is in the 
value of the penalty. 
[CROPS](http://arxiv.org/abs/1412.3617)


## Simulation


```
n = 100          # Sample size
lambda = 4    # freq of changepoints
mu, sigma = Normal(0,1), 1.0 
sample, cps = @changepoint_sampler n lambda Normal(mu, sigma)
```