# Changepoints.jl

A Julia package for the detection of multiple changepoints in time series.

- Detection is based on optimising a cost function over segments of the data.
- Implementations of the most efficient search algorithms (PELT , Binary Segmentation).
- A wide choice of parametric cost functions already implemented such as a change in mean/variance/mean and variance for Normal errors.
- Changepoint algorithms have an interface which allows users to input their own cost functions

For a general overview of the multiple changepoint problem and mathematical details see [PELT](http://arxiv.org/pdf/1101.1438.pdf).

## Installation

Changepoints requires Julia version 0.3. To install Changepoints run the following command inside a Julia session:

```julia
julia> Pkg.add("Changepoints")
```

## Documentation

Most of the functionality of Changepoints has been documented using the [Docile](https://github.com/MichaelHatherly/Docile.jl) package. From Julia version 0.4 this functionality will form part of the Julia base. To view the documentation the user must install the [Lexicon](https://github.com/MichaelHatherly/Lexicon.jl) package and load it.

```julia
julia> Pkg.add("Lexicon")
julia> using Lexicon
```

Documentation is accessible in the Julia REPL in help mode. Help mode can be started by typing '?' at the prompt.

```julia
julia> ?
help?> @PELT
Changepoints.@PELT(data, dist, args...)

  Runs the PELT algorithm using a specified cost function and penalty value to
  find the position and number of changepoints

                                     Usage
                                    -–––––-

  1. @PELT data changepoint_model: Run PELT with default penalty value

  2. @PELT data changepoint_model β: Run PELT at penalty value β

  3. @PELT data changepoint_model β₁ β₂: Run CROPS algorithm for penalties
  between β₁ and β₂

                                    Example
                                   -–––––––-

  n = 1000       
  λ = 100        
  μ, σ = Normal(0.0, 10.0), 1.0
  # Samples changepoints from Normal distribution with changing mean
  sample, cps = @changepoint_sampler n λ Normal(μ, σ)
  # Run PELT on sample
  pelt_cps, pelt_cost = @PELT sample Normal(?, σ)

                                    See also
                                   -––––––––-

  PELT, @segment_cost 

 Details:

	signature: PELT(data,dist,args...)
	source: (133,"/home/lawrence/.julia/v0.3/Changepoints/src/macros.jl")

```

# Usage

As an example first we simulate a time series with multiple changes in mean and then segment it using PELT plotting the time series as we go.

## Simulation

This code simulates a time series of length n with segments that have lengths drawn from a Poisson distribution with mean lambda. The variance
is fixed in this case as one but for each new segment a new mean is drawn from a standard gaussian distribution.

```
n = 1000                   # Sample size
λ = 70                     # freq of changepoints
μ, σ = Normal(0,1), 1.0 
data, cps = @changepoint_sampler n λ Normal(μ, σ)
```

![Winston plot of simulated changepoints](/docs/example.png?raw=true "Simulated Changepoints")

To segment the data assuming it is Normally distributed and has a constant variance of one, using a default penalty (the log of the length of the data) can be done using the @PELT macro. Currently, this package supports the Winston package for convenient plotting of the results. The Winston package must be explicity loaded to make use of this functionality. If the Winston package was loaded after Changepoints, then the user must run the command `Changepoints.Winston_init()` to load this functionality.

```
pelt_cps, cost = @PELT data Normal(?, 1.0)
plot(data, pelt_cps) 
```

![Winston plot of Changepoints detected by PELT](/docs/example_pelt.png?raw=true "Changepoints detected by PELT")

## Penalty selection

The methods implemented view the problem as one of optimising a penalised cost function where the penalty comes in whenever a new changepoint is added. Assuming 
we have specified the correct parametric (non-parametric cost coming soon) model/cost function then the only area of possible misspecification is in the 
value of the penalty. There is no "correct" choice of penalty however it can be very instructive to look at the segmentations and especially the number of changepoints
for a range of penalties. The Changepoints for a Range Of Penalties (CROPS) method allows us to do this efficiently using PELT, by exploiting the relationship 
between the penalised and constrained versions of the same optimisation problem. For more information see [CROPS](http://arxiv.org/abs/1412.3617).

To run the PELT algorithm for a range of penalties say pen1 to pen2 where pen1 < pen2 
then we can use the following code:

```
crops_output = @PELT data Normal(?, 1.0) pen1 pen2
```

Having segmented the dataset for a range of penalties the problem now becomes one of model selection. Again, if Winston has been loaded, we can create a so called "elbow" plot from these results.

```
plot(crops_output)
```
![Winston plot of cost against number of changepoints](/docs/elbowplot.png?raw=true "Elbow plot")
