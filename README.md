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


To segment the data assuming it is Normally distributed and has a constant variance of 1, using a default penalty (the log of the length of the data) and then plotting the data
including the changepoints is done below.

```
x = @PELT data Normal(?,1)
plot_chpts(data,x[1]) 
```

![screenshot](https://bitbucket.org/bardwell/changepoints.jl/raw/master/example_pelt.png)


If the variance is unknown and you wish it to be estimated from the data and if you want to use a non default penalty say pen
which is a single number (we will come back to penalty ranges in the next section) then simply write

```
x = @PELT data Normal(?,estimate) pen
```


## Penalty selection

The methods implemented view the problem as one of optimising a penalised likelihood where the penalty comes in whenever a new changepoint is added. Assuming 
we have specified the correct parametric (non-parametric cost coming soon) model/cost function then the only area of possible misspecification is in the 
value of the penalty. There is no "correct" choice of penalty however it can be very instructive to look at the segmentations and especially the number of changepoints
for a range of penalties. The Changepoints for a Range Of PenaltieS (CROPS) method allows us to do this efficiently using PELT, by exploiting the relationship 
between the penalised and constrained versions of the same optimisation problem. For more information see [CROPS](http://arxiv.org/abs/1412.3617).

To run the PELT algorithm for a range of penalties say pen1 to pen2 where pen1 < pen2 then the PELT macro calls the CRPS algorithm when a range
object is detected in the third parameter. So following the exampl0 from abovee if we wanted to find the segmentations with differeing numbers of changepoints
between penalty values of pen1 and pen2 then either of the following two top lines of code is acceptable.

```
x = @PELT data Normal(?,1) [pen1,pen2]
x = @PELT data Normal(?,1) pen1:pen2
```

Having segmented the dataset for a range of penalties the problem now becomes one of model selection. I.e. finding the correct number of changepoints
to help us do this we can plot a so called "elbow" plot using

```
elbow_plot(x)
```
![screenshot](https://bitbucket.org/bardwell/changepoints.jl/raw/master/elbowplot.png)
