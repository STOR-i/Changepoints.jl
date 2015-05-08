read_data(fn::String) = vec(readdlm(fn, skipstart=1))read_cpts(fn::String) = vec([0, readdlm(fn, Int, skipstart=1)])

dir = "Test_Files"

comp_handler(r::Test.Success) = true
comp_handler(r::Test.Failure) = false
comp_handler(r::Test.Error) = rethrow(r)

function test_cpts(r_cpts, cpts)
    Test.with_handler(comp_handler) do    
        if @test r_cpts == cpts
            println("\tSuccess!")
        else
            println("Fail:")
            println("\tR Changepoints: $(r_cpts)")
            println("\tJulia Changepoints: $(cpts)")
        end
    end    
end

println("Test CROPS for change in mean")
data = read_data("$(dir)/Normal_change_in_mean_data")
segmentations = @PELT data Normal(?,1.0) 2.0

pen = (1.0, 20.0)
segment_cost = NormalMeanSegment(data)


lastchangecpts, cpts, lastchangelike, numchangecpts = @K_PELT data Normal(?,1) 2*log(length(data))

x = 1
y = (2,3)

function K_Test(x,y,args...)
    x + y + args[1]
end


 F = Array(Float64, n+1)
 chpts =  Array(Int64, n+1)
 numchpts = Array(Int64,n+1)
    
