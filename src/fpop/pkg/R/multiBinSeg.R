multiBinSeg <- function
### Binary segmentation of p profiles using the L2 loss
(geno, 
### A matrix with p columns and n lines, each column is one of the profile
 Kmax
### Maximum number of change-points
 ){
  if(class(geno) == "matrix"){
    nRow <- nrow(geno)
    nCol <- ncol(geno)
  } else {
    nRow <- length(geno)
    nCol <- 1
  }
  
  A <- .C("Call_BinSeg", 
          x_i= as.double((geno)),
          K= as.integer(Kmax),
          n= as.integer(nRow), 
          P= as.integer(nCol), 
          t.est= integer(Kmax),
          J.est = double(Kmax), 
          PACKAGE="fpop")
  ##A$Cost <- sum(geno^2) - sum(apply(geno, 2, sum)^2/nRow) + c(0, cumsum(A$RupturesCost))
  A
### return an object with the successive change-points found by binseg t.est and the L2 cost J.est
}



