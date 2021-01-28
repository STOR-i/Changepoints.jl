# Changepoints.jl

[![Build Status](https://travis-ci.org/STOR-i/Changepoints.jl.png)](https://travis-ci.org/STOR-i/Changepoints.jl)

A Julia package for the detection of multiple changepoints in time series.

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient search algorithms (PELT , Binary Segmentation).
- A wide choice of parametric cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Changepoint algorithms have an interface which allows users to input their own cost functions
- Implementations of testing-based segmentation algorithms (Wild/Seeded Binary Segmentation, MOSUM) for the univariate mean change problem

For a general overview of the multiple changepoint problem and mathematical details see [PELT](http://arxiv.org/pdf/1101.1438.pdf). For an overview of segmentation algorithms, see [Data segmentation algorithms: Univariate mean change and beyond](https://arxiv.org/pdf/2012.12814).

## Installation

Changepoints requires Julia version 1.5 or above. To install Changepoints simply run the following command inside Julia package mode (started by typing`]` in the Julia REPL):

```julia-repl
(v1.5) pkg>  add Changepoints
```

## Documentation

Most of the functionality of Changepoints has been documented. This is accessible in the Julia REPL in help mode. (started by typing '?' in the Julia REPL):

```julia-repl
help?> @PELT
  @PELT data changepoint_model [β₁ [β₂] ]

  Runs the PELT algorithm on time series data using a specified changepoint_model and penalties.
  If no penalty β₁ provided, a default of value log(length(data)) is used. If two penalties β₁ and β₂ are provided
  then the CROPS algorithm is run which finds all optimal segmentations for all penalties between β₁ and β₂.

  See also: PELT, CROPS

  Example
  ≡≡≡≡≡≡≡≡≡

  n = 1000
  λ = 100
  μ, σ = Normal(0.0, 10.0), 1.0
  # Samples changepoints from Normal distribution with changing mean
  sample, cps = @changepoint_sampler n λ Normal(μ, σ)
  # Run PELT on sample
  pelt_cps, pelt_cost = @PELT sample Normal(:?, σ)
```

# Usage

As an example first we simulate a time series with multiple changes in mean and then segment it, using PELT and segmentation methods, plotting the time series as we go.

## Simulation

This code simulates a time series of length n with segments that have lengths drawn from a Poisson distribution with mean lambda. The variance
is fixed in this case as one but for each new segment a new mean is drawn from a standard gaussian distribution.

```
n = 1000                   # Sample size
λ = 70                     # freq of changepoints
μ, σ = Normal(0,1), 1.0
data, cps = @changepoint_sampler n λ Normal(μ, σ)
```

![Plot of simulated changepoints](/docs/Plots_example.png?raw=true "Simulated Changepoints")

## Segmentation with PELT

To segment the data assuming it is Normally distributed and has a constant variance of one, using a default penalty (the log of the length of the data) can be done using the @PELT macro. Currently, this package supports the Plots package for the convenient plotting of the results. This package must be explicity loaded to make use of this functionality.

```
Using Plots
pelt_cps, cost = @PELT data Normal(:?, 1.0)
changepoint_plot(data, pelt_cps)
```

![Plot of Changepoints detected by PELT](/docs/Plots_example_pelt.png?raw=true "Changepoints detected by PELT")

## Penalty selection with CROPS

The methods implemented view the problem as one of optimising a penalised cost function where the penalty comes in whenever a new changepoint is added. Assuming
we have specified the correct parametric (non-parametric cost coming soon) model/cost function then the only area of possible misspecification is in the
value of the penalty. There is no "correct" choice of penalty however it can be very instructive to look at the segmentations and especially the number of changepoints
for a range of penalties. The Changepoints for a Range Of Penalties (CROPS) method allows us to do this efficiently using PELT, by exploiting the relationship
between the penalised and constrained versions of the same optimisation problem. For more information see [CROPS](http://arxiv.org/abs/1412.3617).

To run the PELT algorithm for a range of penalties say pen1 to pen2 where pen1 < pen2
then we can use the following code:

```
crops_output = @PELT data Normal(:?, 1.0) pen1 pen2
```

Having segmented the dataset for a range of penalties the problem now becomes one of model selection. Again, if a plotting package has been loaded, we can create a so called "elbow" plot from these results.

```
elbow_plot(crops_output)
```
![Elbow plot of cost against number of changepoints](/docs/Plots_elbow_plot.png?raw=true "Elbow plot")

## Segmentation with MOSUM

By instead using segmentation algorithms, we can avoid specifying a cost function or penalty. These algorithms use local information to form test statistics, which are compared to a threshold for detection, and maximising locations are used as change point estimates.

The MOSUM procedure requires specifying a bandwidth `G`, which should be at most half of the true minimum segment length (see [MOSUM](https://projecteuclid.org/euclid.bj/1501142454)). To run the procedure we use the following code:
```
G = 35
MOSUM_output = @MOSUM data G
mosum_plot(MOSUM_output)
```
![MOSUM plot](/docs/Plots_mosum_plot.png?raw=true "MOSUM plot")

We intend to incorporate the multi-scale merging procedure of [Cho and Kirch 2019](https://arxiv.org/abs/1910.12486) to allow detection at a range of bandwidths.

## Segmentation with WBS and SeedBS

The Wild Binary Segmentation (WBS) procedure behaves like standard Binary Segmentation, but draws many random intervals instead of using only the entire interval (see [WBS](https://arxiv.org/abs/1411.0858)). The following code runs the procedure, estimating the variance with MAD:
```
WBS_return = @WBS data
```

Alternatively, we may use a series of fixed intervals via Seeded Binary Segmentation (SeedBS), which gives reproducible results and is less costly (see [SeedBS](https://arxiv.org/abs/2002.06633)).
```
SeedBS_return = @WBS data do_seeded=true
```


We can extract estimated changepoints from both objects based on the strengthened Schwartz Information Criterion (sSIC), using `Kmax` as an upper bound of the number to be returned
```
seg_cost_sSIC = sSIC(data)
WBS_cps = get_WBS_changepoints(seg_cost_sSIC, WBS_return, 5)
changepoint_plot(data, WBS_cps[1])
```
![WBS plot](/docs/Plots_WBS.png?raw=true "WBS plot")

```
SeedBS_cps = get_WBS_changepoints(seg_cost_sSIC, SeedBS_return, 5)
changepoint_plot(data, SeedBS_cps[1])
```
![SeedBS plot](/docs/Plots_SeedBS.png?raw=true "SeedBS plot")
