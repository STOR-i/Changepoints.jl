# see if julia changepoint package is the same as R functions
# use BS and PELT

# if the index thing is wrong maybe sim type is

x=NormalMeanChange()
y= rand(x,1000)
x.changepoints
writedlm("data.txt",y)


# do crops: for loop calc all pens in pen interval and store # of chpts and constrained cost for having that many changes. Then consider the # of chpts vector

# plotting: from chpt type do plots showing data and changepoints

# for crops make a type and do elbow plot #changes v cost

# then do tests against chpt package in R
