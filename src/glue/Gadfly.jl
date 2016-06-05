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
