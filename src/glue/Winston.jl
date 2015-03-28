import Winston

function Winston.plot(data::Vector{Float64} , changepoints::Vector{Int})
    p = Winston.plot(data)
    # then put a vertical line everywhere where there is a changept
    for i in changepoints
        Winston.add(p,Winston.LineX(i, color = "red"))
    end
    return(p) 
end


function Winston.plot( crops_object::Dict{ASCIIString, Array} )
	# on x axis plot no of chpts
	# on y axis constrained likelihood
	x = crops_object["number"]
	y = crops_object["constrained"]
	p = Winston.FramedPlot(title="Elbow plot for range of penalties",
                               ylabel="Cost",
                               xlabel="Number of segments")
	a = Winston.Points(x, y, kind="circle")
	Winston.add(p, a, Winston.Curve(x, y))
	return(p)
end

