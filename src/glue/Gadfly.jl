import Gadfly
using Gadfly

function Gadfly.plot(data::Vector{Float64}, changepoints::Vector{Int})
    p = plot(layer(y=data, Geom.line, Theme(default_color=colorant"black")),
             layer(xintercept=changepoints, Geom.vline, Theme(default_color=colorant"red")))
    return p
end

function Gadfly.plot(crops_object::Dict{ASCIIString, Array})
    x = crops_object["number"]
    y = crops_object["constrained"]
    p = plot(x=x, y=y, Guide.title("Elbow Plot for Range of Penalties"),
             Guide.xlabel("Number of Segments"),
             Guide.ylabel("Cost"),
             Geom.line,
             Geom.point,
             Theme(default_color=colorant"black"))
    return p
end

function Gadfly.plot(mosum_object::Dict{String,Union{Bool, Float64, Int64, Array}})
    y=mosum_object["detector"]
    xintercept=mosum_object["changepoints"]
    yintercept= [mosum_object["threshold"]]
    p = plot(layer(y=y, Geom.line, Theme(default_color=colorant"black")),
             layer(xintercept=xintercept, Geom.vline, Theme(default_color=colorant"red")) ,
             layer(yintercept=yintercept, Geom.hline, Theme(default_color=colorant"blue")) )
    return p
end
