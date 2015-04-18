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
        if μ == :? && σ != :?
            println("Changepoint distribution is Normal with changing mean and fixed variance")
            return :(NormalMeanSegment($data , $σ))
        elseif μ != :? && σ == :?
            println("Changepoint distribution is Normal with fixed mean and changing variance")
            #μ = eval(Main, μ)
            return :(NormalVarSegment($data, $μ))
        elseif μ == :? && σ == :?
            println("Changepoint distribution is Normal with changing mean and changing variance")
            return :(NormalMeanVarSegment($data))
        else
            error("Must mark at least one Normal parameter as changing with a ? symbol")
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
        if alpha == :? && beta != :?
            println("Changepoint distribution is Gamma with changing shape and fixed rate")
            return :(GammaShapeSegment($data, $beta))
        elseif alpha != :? && beta == :?
            println("Changepoint distribution is Gamma with fixed shape and changing rate")
            return :(GammaRateSegment($data, $alpha))
        else
            error("Must mark at least one Gamma parameter as changing with a ? symbol")
        end

    elseif dist_type == :Nonparametric
        K = dist_expr.args[2]
        println("Changepoint method is Nonparametric")
        return :(NonparametricSegment($data, $K))

    else
        error("Distribution $(dist_type) has no implemented cost functions")
    end
end

@doc """
Runs the PELT algorithm using a specified cost function and penalty value to find the position and number of changepoints

# Usage

1. `@PELT data changepoint_model`: Run PELT with default penalty value

2. `@PELT data changepoint_model β`: Run PELT at penalty value β

3. `@PELT data changepoint_model β₁ β₂`: Run CROPS algorithm for penalties between β₁ and β₂

# Cost functions

A changepoint model is an expression which describes what segment cost function
should be constructed for use with PELT. For parametric segment cost functions,
this is represented by the name of a distribution (as in the Distributions package)
with some parameters replaced by '?' to indicate that a parameters is changing.
Some examples are as follows:

* `Normal(μ, ?)`: Normal model with fixed mean μ and changing standard deviation
* `Exponential(?)`: Exponential model with changing mean
* `Gamma(?, β)`: Gamma model with fixed rate parameter β and changing shape parameter

A nonparametric cost function is also provided and the model is represented with
the following expression:

* `Nonparametric(k)`: Nonparametric cost function with parameter k

# Example
```
n = 1000       
λ = 100        
μ, σ = Normal(0.0, 10.0), 1.0
# Samples changepoints from Normal distribution with changing mean
sample, cps = @changepoint_sampler n λ Normal(μ, σ)
# Run PELT on sample
pelt_cps, pelt_cost = @PELT sample Normal(?, σ)
```
""" ->
macro PELT(data, dist, args...)
    cost_func = cost_function(data, dist)
    if length(args) == 0
        return esc(:(PELT($(cost_func), length($data))))
    elseif length(args) == 1
        return esc(:(PELT($(cost_func), length($data), pen=$(args[1]))))
    else
        return esc(:(CROPS($(cost_func), length($data), $((args[1], args[2])))))
    end
end

macro BS(data, dist, args...)
    cost_func = cost_function(data, dist)
    if length(args) == 0
        return esc(:(BS($(cost_func), length($data))))
    else
        return esc(:(BS($(cost_func), length($data), pen=$(args[1]))))
    end
end
