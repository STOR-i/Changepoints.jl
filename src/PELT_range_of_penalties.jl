# PELT for a range of penalties -- TODO recycling comps ask kaylea

function PELT_range_of_penalties(segment_cost::Function , n::Int64, pen::Array(Float64,2))

  beta1 = minimum(pen)
  beta2 = maximum(pen)

  cpts_beta1 , opt_beta1 = PELT_general( segment_cost , n , beta1 )
  cpts_beta2 , opt_beta2 = PELT_general( segment_cost , n , beta2 )
  
  dict = ["no of chpts"=> Array(Int64,0), "penalty"=> Array(Float64,0), "optimum"=> Array(Float64,0)]
  
  # if no of chpts at penalty beta2 is more than 1 more than at beta1
  if length(cpts_beta1) > length(cpts_beta2)+1
  
  elseif length(cpts_beta1) = length(cpts_beta2)+1
  
  else
  # no of chpts same so optimum just linear
  dict["no of chpts"] = [length(cpts_beta1),length(cpts_beta2)]
  dict["penalty"] = [beta1,beta2]
  dict["optimum"] = 
  end

  
end



# returns a plot, or just penalty values and likelihood value for a particular number of chpts