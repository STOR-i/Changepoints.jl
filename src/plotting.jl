<<<<<<< HEAD
function plot_chpts(data , changepoints)
=======
using Winston

function plot_cpts(data , changepoints)
>>>>>>> d00dfa9744a17d57ebfcabc77434ebb71fcc9ebc
    p = plot(data)
    # then put a vertical line everywhere where there is a changept
    for i in changepoints
        add(p,LineX(i, color = "red"))
    end
    return(p) 
end


function elbow_plot( crops_object::Dict )
	# on x axis plot no of chpts
	# on y axis constrained likelihood
	x = crops_object["number"]
	y = crops_object["constrained"]
	p = FramedPlot(
         title="Elbow plot for range of penalties",
         ylabel="Cost",
         xlabel="Number of segments")
	a = Points(x, y, kind="circle")
	add(p, a, Curve(x, y))
	return(p)

end

