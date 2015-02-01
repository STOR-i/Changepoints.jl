type chpt 
   data::Array{Real}
   changepoints::Array{Int64}
end

# example of use
include("sim_type.jl")

y = NormalMeanChange();
sample = rand(y,100);
y.changepoints

x = chpt( sample , y.changepoints )
x.changepoints
x.data


## Plotting functions

using Winston

# normal plot
function plot(x::chpt)

    data = x.data
    n = length(x.data)
    no_chpts = length(x.changepoints)
    
    p = FramedPlot()
    # plot data
    add(p, Curve(1:n, x.data) )
    # then put a vertical line everywhere there is a changept
    for i in 1:no_chpts
        add(p, LineX( x.changepoints[i] ))
    end
    
end

# CROPS elboow plot for model selection


oplot(s)
s = Slope(1, (0,0), kind="dotted")
add(s)
s


p = FramedPlot(
         aspect_ratio=1,
         xrange=(0,100),)
        
add(p,[1,2,3,4])
# where changepoints are
 s = Slope( Inf , (20,0), kind="dotted")
 setattr(s, label="slope")

 l = Legend(.1, .9, {s})

add(p, s)

help(Slope)


# plotting function would take chpt type and plot with vertical lines
http://winston.readthedocs.org/en/latest/examples.html#example-2

