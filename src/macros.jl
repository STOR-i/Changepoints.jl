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
        println("Changepoint method is Nonparametric")
        return :(NonparametricSegment($data, $K))

    else
        error("Distribution $(dist_type) has no implemented cost functions")
    end
end
                            
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
