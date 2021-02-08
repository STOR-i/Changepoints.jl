@userplot Changepoint_Plot

@recipe function f(h::Changepoint_Plot)
    if length(h.args) != 2 || !(typeof(h.args[1]) <: AbstractVector) ||
        !(typeof(h.args[2]) <: AbstractVector)
        error("Changpoint plots should be given two vectors.  Got: $(typeof(h.args))")
    end
    data, cps = h.args

    @series begin
        seriestype := :line
        linecolor   --> :black
        data
    end

    @series begin
        seriestype := :vline
        linecolor   --> :red
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
    yguide := "Cost"
    xguide := "Number of Segments"
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


@userplot MOSUM_Plot

@recipe function f(h::MOSUM_Plot)
    if length(h.args) != 1 || !(typeof(h.args[1]) <: AbstractDict) || !haskey(h.args[1], "detector") || !haskey(h.args[1], "changepoints") || !haskey(h.args[1], "threshold")
        error("MOSUM plot should be given dictionary returned from running MOSUM algorithm. See [`MOSUM`](@ref)")
    end

    detector = get(h.args[1], "detector", 6) #h.args[1]["detector"]
    changepoints = get(h.args[1], "changepoints", 5) #h.args[1]["changepoints"]
    threshold = get(h.args[1], "threshold", 4)#h.args[1]["threshold"]

    @series begin
        seriestype := :line
        linecolor   --> :black
        label := "detector"
        detector
    end

    @series begin
        seriestype := :vline
        linecolor   --> :red
        label := ""
        changepoints
    end

    @series begin
        seriestype := :hline
        linecolor   --> :blue
        label := "threshold"
        [threshold]
    end
end

"""
    mosum_plot(mosum_output)

Plots output of MOSUM procedure. Detector statistic is overlaid with vertical lines marking detected changepoints
threshold is marked horizontally. The `Plots` package needs to be loaded in order to use this functionality.
"""
mosum_plot
