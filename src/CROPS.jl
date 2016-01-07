import Base.length
import Base.append!

# Singly-linked list object taken from http://rosettacode.org
type Node{T}
    data::T
    next::Node{T}
    function Node(data::T)
        n = new()
        n.data = data
        # mark the end of the list. Julia does not have nil or null.
        n.next = n
        n
    end
end
 
# convenience. Let use write Node(10) or Node(10.0) instead of Node{Int64}(10), Node{Float64}(10.0)
function Node(data)
    return Node{typeof(data)}(data)
end

islast(n::Node) = (n == n.next)
 
function append!{T}(n::Node{T}, data::T)
    tmp = Node(data)
    if !islast(n)
        tmp.next = n.next
    end
    n.next = tmp  
end

function length(n::Node)
    l = 1
    while !islast(n)
        l+=1
        n=n.next
    end
    return l
end

function create_output_dictionary(results::Node)
    l = length(results)
    out = Dict{ASCIIString, Array}()
    out["number"] = Array(Int64,l)
    out["penalty"] = Array(Float64,l)
    out["constrained"] = Array(Float64, l)
    out["changepoints"] = Array(Array{Int64},l)

    n = results
    i = 0
    while true
        i+=1
        out["number"][i] = length(n.data["changepoints"])
        out["penalty"][i] = n.data["penalty"]
        out["constrained"][i] = n.data["cost"]
        out["changepoints"][i] = n.data["changepoints"]
        if islast(n) break end
        n=n.next
    end
    return out
end

@doc """
# Description
Runs the CROPS algorithm using a specified cost function for a given minimum and maximum penalty value to find a range of segmentations. Function can also be invoked through @PELT macro.

# Arguments
* `segment_cost::Function`: Calculates cost between two specified indices
* `n::Int`: Length of time series
* `pen::Tuple{Real,Real}`: Tuple containing minimum and maximum penalty values

# Returns
* `out::Dict{ASCIIString,Array{T,N}}`:
  * `out["penalty"]` : vector of penalties between minimum and maximum pen
  * `out["number"]` : vector of number of changepoints for each penalty
  * `out["constrained"]` : vector of optimal segmentation costs for each penalty
  * `out["changepoints"]` : vector of changepoints sets for each penalty

# Example
```
# Sample time series with change points
n = 1000       # Length of time series
λ = 100        # Frequency of change points
μ, σ = Normal(0.0, 10.0), 1.0
sample, cps = @changepoint_sampler n λ Normal(μ, σ)

# Create cost function and run CROPS
seg_cost = NormalMeanSegment(sample)
pen = (4.0,100.0)
crops_output = CROPS(seg_cost, n, pen)
```

# See also
PELT, @PELT

# References
Haynes, K., Eckley. I.A., and Fearnhead, P., (2014) Efficient penalty search for multiple changepoint problems arXiv:1412.3617

""" ->
function CROPS(segment_cost::Function , n::Int64, pen::Tuple{Real,Real} )
    @assert pen[1] < pen[2]
    
    # Run PELT for min and maximum penalty
    min_cps, min_cost = PELT( segment_cost, n, pen=pen[1])
    max_cps, max_cost = PELT( segment_cost, n, pen=pen[2])
    
    results = Node(Dict("changepoints"=>min_cps, "cost"=>min_cost, "penalty"=>pen[1]))

    if length(min_cps) == length(max_cps)
        return create_output_dictionary(results)
    end
    
    append!(results, Dict("changepoints"=>max_cps, "cost"=>max_cost, "penalty"=>pen[2]))

    function run_crops!(node::Node)
        β0, β1 = node.data["penalty"], node.next.data["penalty"]
        m0, m1 = length(node.data["changepoints"]), length(node.next.data["changepoints"])
        # Optimal "constrained" costs
        q0, q1 = node.data["cost"] - m0*β0, node.next.data["cost"] - m1*β1

        βint = (q1 - q0)/(m0 - m1)
        println("β₀ = $(β0), β₁ = $(β1)")
        println("m(β₀) = $(m0), m(β₁) = $(m1)")
        println("βint = $(βint)")
        #sleep(0.3)
        if length(node.data["changepoints"]) == length(node.next.data["changepoints"]) + 1
            # Update penalty and cost of next penalty
            println("Consecutive penalties adjacent (difference one)\n")
            node.next.data["cost"] = q1 +  βint*m1
            node.next.data["penalty"] = βint
            return
        else
            cps, cost = PELT(segment_cost, n, pen=βint)
            println("mβint = $(length(cps))")
            if length(cps) == m1 || length(cps) == m0
                println("Consecutive penalties adjacent (difference greater than one)\n")
                node.next.data["penalty"] = βint
                node.next.data["cost"] = cost
                return
            else
                println("Consecutive penalties not adjacent - splitting on βint\n")
                append!(node, Dict("changepoints"=>cps, "cost"=>cost, "penalty"=>βint))
                run_crops!(node)
                run_crops!(node.next)
            end
        end
    end

    run_crops!(results)
    return create_output_dictionary(results)

end
