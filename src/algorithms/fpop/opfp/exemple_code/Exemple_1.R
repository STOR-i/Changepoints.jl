#### Guillem Rigaill Feb 2014
#### Example 1 :run op + fp and compare the result with PELT (changepoint) and check that we get the exact same result in terms of breaks

#### Exemple 1
#### first load the package opfp and changepoint to make the bkp comparaison
#### not the recovered bkp should be exactly the same

require(fpop)
require(changepoint)

checkSameResult <- function(x, lambdas){

  for(lambda in lambdas){
  res1 <- Fpop(x, lambda=lambda)
  res2 <- cpt.mean(x, penalty="Manual", pen=lambda, method="PELT")
  nbError <- sum(res2@cpts != res1$bkp)
  if(nbError > 0) break()
  }
  return(nbError)
}


i = 1
nbEr <- 0
while( (i < 300) & (nbEr == 0)){
  n <- sample.int(n=10^4, size=1)+100
  lambdas <- c(1:5)*log(n)
  print(paste("Simu-", i, ": n = ", n))
  x <- rnorm(n)
  nbEr<- checkSameResult(x, lambdas)
  x <- rt(n, df=3)
  nbEr<- checkSameResult(x, lambdas)
  i = i+1
}
 
