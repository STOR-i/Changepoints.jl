# load data .txt
setwd("~/changepoints.jl/src")

data = scan("data.txt", double(), sep = "\n") # separate each line

library(changepoint)

x = cpt.mean(data,method="PELT",test.stat="Normal")
cpts(x)

