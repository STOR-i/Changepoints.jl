# Parses distribution expression and returns expression for a segment cost function
# Required for PELT and BS macros
function cost_function(data::Any, dist_expr::Expr)
    if !Meta.isexpr(dist_expr,:call)
        error("Syntax error: expected distribution as argument")
    end

    dist_type = dist_expr.args[1]

    if dist_type == :Normal
        if length(dist_expr.args) != 3
            error("Normal distribution has two parameters")
        end
        μ, σ = dist_expr.args[2:3]
        if μ == :(:?) && σ != :(:?)
            println("Changepoint distribution is Normal with changing mean and fixed variance")
            return :(NormalMeanSegment($data , $σ))
        elseif μ != :(:?) && σ == :(:?)
            println("Changepoint distribution is Normal with fixed mean and changing variance")
            #μ = eval(Main, μ)
            return :(NormalVarSegment($data, $μ))
        elseif μ == :(:?) && σ == :(:?)
            println("Changepoint distribution is Normal with changing mean and changing variance")
            return :(NormalMeanVarSegment($data))
        else
            error("Must mark at least one Normal parameter as changing with a :? symbol")
        end

    elseif dist_type == :Exponential
        println("Changepoint distribution is Exponential with changing mean")
        return :(ExponentialSegment($data))

    elseif dist_type == :Poisson
        println("Changepoint distribution is Poisson with changing mean")
        return :(PoissonSegment($data))

    elseif dist_type == :Gamma
        if length(dist_expr.args) != 3
            error("Gamma distribution has two parameters")
        end
        alpha , beta = dist_expr.args[2:3]
        if alpha == :(:?) && beta != :(:?)
            println("Changepoint distribution is Gamma with changing shape and fixed rate")
            return :(GammaShapeSegment($data, $beta))
        elseif alpha != :(:?) && beta == :(:?)
            println("Changepoint distribution is Gamma with fixed shape and changing rate")
            return :(GammaRateSegment($data, $alpha))
        else
            error("Must mark at least one Gamma parameter as changing with a :? symbol")
        end

    elseif dist_type == :Nonparametric
        K = dist_expr.args[2]
        println("Changepoint method is Nonparametric")
        return :(NonparametricSegment($data, $K))

    elseif dist_type == :OLS
        println("Changepoints in peicewise linear regressions")
        return :(OLSSegment($data))

    else
        error("Distribution $(dist_type) has no implemented cost functions")
    end
end

"""
    @segement_cost data changepoint_model

Creates a segment cost function given data and changepoint model expression.

# Cost functions

`changepoint_model` is an expression which describes what segment cost function
should be constructed for use with PELT. For parametric segment cost functions,
this is represented by the name of a distribution (as in the Distributions package)
with some parameters replaced by ':?' to indicate that the parameters change.
The full list of available cost functions based on parametric distributions is
as follows:

* `Normal(:?, σ)`: Normal model with changing mean and fixed standard deviation `σ` (see also [`NormalMeanSegment`](@ref))
* `Normal(μ, :?)`: Normal model with fixed mean `μ` and changing standard deviation (see also [`NormalVarSegment`](@ref))
* `Normal(:?, :?)`: Normal model with changing mean and standard deviation (see also [`NormalMeanVarSegment`](@ref))
* `Exponential(:?)`: Exponential model with changing mean (see also [`ExponentialSegment`](@ref))
* `Poisson(:?)`: Poisson model with changing mean (see also [`PoissonSegment`](@ref))
* `Gamma(:?, β)`: Gamma model with fixed rate parameter `β` and changing shape parameter (see also [`GammaShapeSegment`](@ref))
* `Gamma(α, :?)`: Gamma model with fixed shape parameter `α` and changing rate parameter (see also [`GammaRateSegment`](@ref))

The following others models are also available:

* `Nonparametric(k)`: Nonparametric cost function with parameter `k` (see also [`NonparametricSegment`](@ref))
* `OLS` : Cost function for piecewise linear regressions (see also [`OLSSegment`](@ref))


# Example
```julia-repl
n = 1000
λ = 100
μ, σ = Normal(0.0, 10.0), 1.0
# Samples changepoints from Normal distribution with changing mean
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
# Create cost function
seg_cost = @segment_cost sample Normal(:?, σ)
# Calculate changepoints using PELT and BS
pelt_cps, cost = PELT(seg_cost, n)
bs_cps = BS(seg_cost, n)
```
"""
macro segment_cost(data, dist)
    esc(cost_function(data, dist))
end


"""
    @PELT data changepoint_model [β₁ [β₂] ]
    
Runs the PELT algorithm on time series `data` using a specified `changepoint_model` and penalties.
If no penalty `β₁` provided, a default of value `log(length(data))` is used.
If two penalties `β₁` and `β₂` are provided then the CROPS algorithm is run which finds
all optimal segmentations for all penalties between `β₁` and `β₂`.

See also: [`PELT`](@ref), [`CROPS`](@ref)

# Example
```
n = 1000
λ = 100
μ, σ = Normal(0.0, 10.0), 1.0
# Samples changepoints from Normal distribution with changing mean
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
# Run PELT on sample
pelt_cps, pelt_cost = @PELT sample Normal(:?, σ)
```
"""
macro PELT(data, dist, args...)
    cost_func = cost_function(data, dist)
    if length(args) == 0
        return esc(:(PELT($(cost_func), length($data))))
    elseif length(args) == 1
        return esc(:(PELT($(cost_func), length($data), pen=$(args[1]))))
    else
        return esc(:(CROPS($(cost_func), length($data), $(args[1]), $(args[2]))))
    end
end

"""
    @BS data changepoint_model [β₁]

Runs the Binary Segmentation algorithm using a specified `changepoint_model` for a given penalty `β₁`.
If no penalty specified, use penalty `log(length(data))` by default.

See also: [`BS`](@ref), [`@segment_cost`](@ref)

# Example
```
n = 1000   # Length of time series
λ = 100    # Frequency of changepoints
α, β = Uniform(0.0, 10.0), 1.0
# Samples changepoints from Gamma distribution with changing shape
sample, cps = @changepoint_sampler n λ Gamma(α, β)
# Run binary segmentation on sample
bs_cps = @BS sample Gamma(:?, β)
```
"""
macro BS(data, dist, args...)
    cost_func = cost_function(data, dist)
    if length(args) == 0
        return esc(:(BS($(cost_func), length($data))))
    else
        return esc(:(BS($(cost_func), length($data), pen=$(args[1]))))
    end
end
