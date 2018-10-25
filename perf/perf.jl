using Changepoints
using BenchmarkLite

mutable struct CP_Benchmark <: Proc
    alg::Function
    name::String
end

Base.string(proc::CP_Benchmark) = proc.name
Base.length(proc::CP_Benchmark, cfg) = 2
Base.isvalid(proc::CP_Benchmark, cfg) = true#isa(cfg, (Int,Int)) && all(cfg .> 0) && length(cfg)==2
function Base.start(proc::CP_Benchmark, cfg)
    n, λ = cfg
    data, cps = @changepoint_sampler n λ Normal(Normal(0.0, 5.0), 1.0)
    return NormalMeanSegment(data, 1.0)
end

function Base.run(proc::CP_Benchmark, cfg, s)
    n, λ = cfg
    proc.alg(s, n)
end

Base.done(proc::CP_Benchmark, cfg, s) = nothing

cp_procs = Proc[CP_Benchmark(BS, "BinSeg"), CP_Benchmark(PELT, "PELT")]
cfgs = [(1000, 200), (1000, 100), (1000, 50)]
results = run(cp_procs, cfgs)
show(results)
