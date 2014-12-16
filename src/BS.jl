# check this is correct!!
# document
# what happens when no change, more efficient

function BS_general( segment_cost::Function , n::Int64, pen::Float64 = 0.0 )
    
    # if we havent specified beta make it BIC penalty 
    if pen == 0.0
        pen = log(n)
    end
    
    tau = [1,n]
    CP = Array(Int64,0)
    
    # keep adding segments until none contain a changepoint
    while length(tau) > 0 
            
        x = Array(Float64,0)
        for j in (tau[1]):(tau[2])
            push!(x , segment_cost(tau[1],j) + segment_cost(j+1,tau[2]) + pen)
        end
        
        minval , ind = findmin(x)
        if minval - segment_cost(tau[1],tau[2]) < 0
            # significant so add seg to tau
            chpt = ind + tau[1] - 1
            push!(CP,chpt)
            if chpt != tau[1]
                append!(tau, [ tau[1] , chpt ] )
            end
            if chpt != tau[2] - 1
                append!(tau, [ chpt+1 , tau[2] ] )
            end
            tau = tau[3:end]
        else
            tau = tau[3:end]
        end
        
    end

    return sort(CP)
    
end