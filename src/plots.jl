@userplot Changepoint_Plot

@recipe function f(h::Changepoint_Plot)
    if length(h.args) != 2 || !(typeof(h.args[1]) <: AbstractVector) ||
        !(typeof(h.args[2]) <: AbstractVector)
        error("Changpoint plots should be given two vectors.  Got: $(typeof(h.args))")
    end
    data, cps = h.args

    @series begin
        seriestype := :line
        data
    end

    @series begin
        seriestype := :vline
        label := ""
        cps
    end
end

"""
    changepoint_plot(data, cps)

Plots time series vector `data` as a line plot with vertical lines added to mark changepoints in vector `cps`. The `Plots` package needs to be loaded in order to use this functionality.
"""
changepoint_plot


@userplot Elbow_Plot

@recipe function f(h::Elbow_Plot)
    if length(h.args) != 1 || !(typeof(h.args[1]) <: AbstractDict) || !haskey(h.args[1], "number") || !haskey(h.args[1], "constrained")
        error("Elbow plot should be given dictionary returned from running CROPS algorithm. See [`CROPS`](@ref)")
    end
    
    x = h.args[1]["number"]
    y = h.args[1]["constrained"]
    title := "Elbow Plot for Range of Penalties"
    ylabel := "Cost"
    xlabel := "Number of Segments"
    @series begin
        seriestype := :line
        markershape := :circle
        x, y
    end
end

"""
    elbow_plot(crops_output)

Plots output of `CROPS` function as a so-called "elbow plot" which is useful for the purposes of selecting
an appropriate changepoint penalty.
"""
elbow_plot
