#=

Calculate recursions from paper http://eprints.lancs.ac.uk/745/1/online_chpt4.pdf

We are going to calculate an approximation to the posterior - approximate because particle filtering
is involved to increase the speed of the algorithm but reduce the computtional cost, this is an online
algorithm but it is suited at looking at retrospective

=#

function recursions( data::Array{Real}, LOS::DiscreteUnivariateDistribution,  segment_ML::Function )
	n=length(data)
	# weights and last cpt locations
	weights = Array( Array{Float64} , n)
	cpt_locations =  Array( Array{Int64} , n)
	weights[1] = 
	cpt_locations[1] = [0,1]
	for t in 2:n 

		for j in cpt_locations[t-1]
			logccdf(LOS , t-j) - logccdf(LOS, t-j-1)
		end

		if t > 20 

		else
		# resample

		end
	
	end


end