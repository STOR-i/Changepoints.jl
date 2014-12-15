#R -d "valgrind" -f testBinSeg.R
require(fpop)
x <- rnorm(10^6)
test <- multiBinSeg(x, 100)


