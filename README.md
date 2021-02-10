# Changepoints.jl

[![Build Status](https://travis-ci.org/STOR-i/Changepoints.jl.png)](https://travis-ci.org/STOR-i/Changepoints.jl)

A Julia package for the detection of multiple changepoints in time series.

This package is still under development. If you have any suggestions to improve the package, or if you've noticed a bug, then please post an [issue](https://github.com/STOR-i/Changepoints.jl/issues/new) for us and we'll get to it as quickly as we can. Pull requests are also welcome.

## Features

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient search algorithms (PELT , Binary Segmentation).
- A wide choice of parametric cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Changepoint algorithms have an interface which allows users to input their own cost functions
- Implementations of testing-based segmentation algorithms (Wild/Seeded Binary Segmentation, MOSUM) for the univariate mean change problem

## Introduction

Change point detection aims to model time series data as piecewise stationary between change points <img src="https://render.githubusercontent.com/render/math?math=k_j">, such that

<img src="https://render.githubusercontent.com/render/math?math=X_t = f_t, \quad f_t \sim \mathbb{P}_j, j=1, \dots, q; k_j < t \leq k_{j+1} ">

for distributions <img src="https://render.githubusercontent.com/render/math?math=\mathbb{P}_j">,
with the convention that <img src="https://render.githubusercontent.com/render/math?math=k_0=1">  and <img src="https://render.githubusercontent.com/render/math?math=k_{q%2B1}=n"> denote the start and end of the data.

The simplest such model is the piecewise-constant mean setting, where <img src="https://render.githubusercontent.com/render/math?math=f_t = \mu_j + \epsilon_t, \mu_j \neq  \mu_{j%2B1}, E(\epsilon_t) = 0, Var(\epsilon_t) = \sigma^2">.

The methods in this package aim to estimate the number and location of changes in a given model. Penalty-based approaches aim to minimise the quantity <img src="https://render.githubusercontent.com/render/math?math=\sum_{j=1}^{q%2B1}[\mathcal{C}(x_{k_{j-1}:k_j)}%20]%20%2B%20\beta%20f(q)">
where <img src="https://render.githubusercontent.com/render/math?math=\mathcal{C}, \beta f(q)"> are the cost function and penalty respectively. Segmentation methods form statistics comparing the sample either side of a candidate change point, and use the maximum statistic to evaluate a hypothesis test.

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

As an example first we simulate a time series with multiple changes in mean and then segment it, using PELT, BS, CROPS, and segmentation methods, plotting the time series as we go.

## Simulation

This code simulates a time series of length `n` with segments that have lengths drawn from a Poisson distribution with mean lambda.
The variance is fixed in this case as one but for each new segment a new mean is drawn from a standard Gaussian distribution.

```
n = 1000                   # Sample size
λ = 70                     # freq of changepoints
μ, σ = Normal(0,1), 1.0
data, cps = @changepoint_sampler n λ Normal(μ, σ)
```

![Plot of simulated changepoints](/docs/Plots_example.png?raw=true "Simulated Changepoints")

## Segmentation with PELT

To segment a time series using PELT we need a cost function for segments of our data, and optionally a penalty for each changepoint.
Twice the negative log-likelihood is a commonly used cost function in changepoint detection, and this package provides a variety of these for different parametric models.

The following code constructs a log-likelihood based cost function for segments of the data generated above which are assumed to follow a Normal distribution with unknown mean and a known fixed variance (1 in this case):

```
σ = 1.0
seg_cost = NormalMeanChange(data, σ)  # Create segment cost function

```

We can now run PELT for this cost function with the `PELT` function which requires a cost function and the length of our sequence of data:

```
pelt_cps, pelt_cost = PELT(seg_cost, length(data))   # Run PELT
```

The `PELT` function returns an integer array containing the indices of the changepoints, and the total cost of the segmentation.
By default, the `PELT` function uses a penalty of `log(n)` where `n` is the length of the sequence of data, but this can also be specified by the user as an optional third argument.

For convenience, we also provide a macro for running PELT, `@PELT`,  which allows one to construct a cost function and run PELT in a single line:

```
pelt_cps, cost = @PELT data Normal(:?, 1.0)
```

This takes as arguments the data to be segmented and a model to construct a cost function, and returns the same output as the `PELT` function.
Again, an optional third argument can be used to specify a changepoint penalty.
The model specified in the second argument is a distribution (using the same distribution names as in the `Distributions` package`) with the symbol `:?` replacing any parameters whose values are assumed to change at changepoints.
Some other examples of expressions which can be used with PELT in this way are:


- `Normal(μ, :?)`: Normally distributed data with known mean (μ) and changing variance
- `Normal(:?, :?)`: Normally distributed data with changing mean and variance
- `Exponential(:?)`: data distributed as Exponential distribution with changing mean
- `Gamma(:?, β)`: data distributed as Gamma distribution with changing shape parameter and known rate parameter `β`

Currently, this package supports the Plots package for the convenient plotting of the results. This package must be explicity loaded to make use of this functionality.

```
using Plots
pelt_cps, cost = @PELT data Normal(:?, 1.0)
changepoint_plot(data, pelt_cps)
```

![Plot of Changepoints detected by PELT](/docs/Plots_example_pelt.png?raw=true "Changepoints detected by PELT")

## Segmentation with BS

Another search method is Binary Segmentation (BS). Using the same cost function as before, with exactly the same arguments as for `@PELT`, we can run this code by:
```
bs_cps = @BS data Normal(:?, 1.0)
changepoint_plot(data, bs_cps[1])
```
![Plot of Changepoints detected by BS](/docs/Plots_example_BS.png?raw=true "Changepoints detected by BS")

This returns the same results and uses the same default penalty as `@PELT`, and can take the same variety of cost functions.

## Penalty selection with CROPS

The methods implemented view the problem as one of optimising a penalised cost function where the penalty comes in whenever a new changepoint is added.
Assuming we have specified the correct model/cost function then the only area of possible misspecification is in the value of the penalty.
There is no "correct" choice of penalty however, but it can be very instructive to look at the segmentations and especially the number of changepoints for a range of penalties.
The Changepoints for a Range Of Penalties (CROPS) method allows us to do this efficiently using PELT, by exploiting the relationship between the penalised and constrained versions of the same optimisation problem.
For more information see [CROPS](http://arxiv.org/abs/1412.3617).

To run the PELT algorithm for a range of penalties say pen1 to pen2 where pen1 < pen2 then we can use the `CROPS` function
which takes as input a segment cost function, the length of the data set and the two penalties:
```
seg_cost = NormalMeanSegment(data, σ)
pen1, pen2 = 4.0, 100.0 # Penalty range
crops_output = CROPS(seg_cost, n, pen1, pen2)
```

The `CROPS` function returns a dictionary containing outputs such as the penalties for which PELT was run, and the corresponding changepoints.
See the function documentation for more details.
For convenience, CROPS can also be run using the `@PELT` macro by simply specifying a second penalty:

```
crops_output = @PELT data Normal(:?, 1.0) pen1 pen2
```

Having segmented the data set for a range of penalties the problem now becomes one of model selection.
Again, if a plotting package has been loaded, we can create a so called "elbow" plot from these results.

```
elbow_plot(crops_output)
```
![Elbow plot of cost against number of changepoints](/docs/Plots_elbow_plot.png?raw=true "Elbow plot")



## Segmentation with MOSUM

By instead using segmentation algorithms, we can avoid specifying a cost function or penalty.
These algorithms use local information to form test statistics, which are compared to a threshold for detection, and maximising locations are used as changepoint estimates. Those implemented in this package are for the change in mean setting.

The MOSUM procedure requires specifying a bandwidth `G`, which should be at most half of the true minimum segment length (see [MOSUM](https://projecteuclid.org/euclid.bj/1501142454)). Optionally, `var_est_method` specifies the variance estimator to normalise by; this can be the average `mosum` (default) or minimum `mosum.min` across windows. `alpha` determines the signicance level (default 0.1). `criterion` determines whether to use the `eta` (default) or `epsilon` location procedure (see references). `eta` and `epsilon` are tuning parameters for the mentioned procedures (default 0.4 and 0.2).
This returns a dictionary with outputs including change point locations and the detector statistic.

To run the procedure we use the following code:
```
G = 35 # pick bandwidth
MOSUM_output = @MOSUM data G # run MOSUM procedure
```

We can plot the detector statistic, located changes, and threshold with
```
mosum_plot(MOSUM_output)
```
![MOSUM plot](/docs/Plots_mosum_plot.png?raw=true "MOSUM plot")

We can perform the MOSUM procedure with a series of increasing bandwiths to detect smaller or awkwardly-arranged signals.
We have implemented the multi-scale merging procedure of [Messer et. al. 2014](https://arxiv.org/pdf/1303.3594.pdf), which runs the procedure for bandwidths in increasing order, adding as a change point only those located which are not too close to any points already located. This returns a vector of estimated change points.
To run this, we enter:
```
Gset = [20, 30, 50, 80, 130] # bandwiths
MOSUM_multi_scale_output = @MOSUM_multi_scale data Gset
changepoint_plot(data, MOSUM_multi_scale_output)
```
![MOSUM multi scale plot](/docs/Plots_mosum_multi_scale.png?raw=true "MOSUM multi-scale plot")

In the future we intend to incorporate the pruning procedure of [Cho and Kirch 2019](https://arxiv.org/abs/1910.12486).

## Segmentation with WBS and SeedBS

The Wild Binary Segmentation (WBS) procedure generalises standard Binary Segmentation, drawing many random intervals instead of using only the entire interval (see [WBS](https://arxiv.org/abs/1411.0858)).
Optionally, we can specify the threshold scaling constant, the standard deviation, the number of intervals to draw, and the minimum segment length. Specifying `M=1` will call the CUSUM-based BS procedure. We are returned an array of tuples containing change point information, in decreasing detection order; see `?WBS` for details.

The following code runs the procedure, estimating the variance with MAD:
```
WBS_return = @WBS data
```

Alternatively, we may use a series of fixed intervals via Seeded Binary Segmentation (SeedBS), which gives reproducible results and is less costly (see [SeedBS](https://arxiv.org/abs/2002.06633)).
We call this with an optional argument:
```
SeedBS_return = @WBS data do_seeded=true
```

We can extract estimated change points from both objects by minimising the penalised strengthened Schwartz Information Criterion (sSIC) (see references). Using `Kmax=14` as an upper bound of the number to be returned, we call this via:
```
seg_cost_sSIC = sSIC(data)
Kmax = 14
WBS_cps = get_WBS_changepoints(seg_cost_sSIC, WBS_return, Kmax)
changepoint_plot(data, WBS_cps[1])
```
![WBS plot](/docs/Plots_WBS.png?raw=true "WBS plot")

```
SeedBS_cps = get_WBS_changepoints(seg_cost_sSIC, SeedBS_return, Kmax)
changepoint_plot(data, SeedBS_cps[1])
```
![SeedBS plot](/docs/Plots_SeedBS.png?raw=true "SeedBS plot")


## Package development

This package was originally developed by Jamie Fairbrother (@fairbrot), Lawrence Bardwell (@bardwell) and Kaylea Haynes (@kayleahaynes) in 2015.
It is currently being maintained and extended by Jamie Fairbrother and Dom Owens (@Dom-Owens-UoB).
