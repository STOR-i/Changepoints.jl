# Resampling function -- takes a vector of weights that are < alpha 
# to resample and does SRC resampling, then returns a vector with resampled 
# weights 

function resample(to.resample,alpha){ 
  
  log.alpha <- log(alpha)
  log.u <- log.alpha + log( runif(1) )
  k <- 1

  while (k <= length(to.resample) ){
    
    # want to find u <- u - w then if u <= 0 
    # u <- u + alpha
    # IN OUR CASE IF u <= w
    # find u <- u + alpha - w
    # as working with logs
    # SO first check whether log(u) < log(w) 
  
    if ( log.u < to.resample[k] ){
      # u <- u + alpha - w
      # first find log(alpha-w) label as log.alpha.weight
      temp = c( log.alpha ,  to.resample[k] )
      c = max(temp)
      log.alpha.weight <- c + log( exp( temp[1] - c ) - exp( temp[2] - c )  )
      temp = c( log.u , log.alpha.weight )
      c = max(temp)
      log.u <- c + log( sum( exp( temp - c ) ) )
      to.resample[k] <- log.alpha
    }
  
    else{
      # u <- u - w
      # and w is not resampled, given weight 0 (-Inf for log(w))
      temp <- c( log.u , to.resample[k] )
      c = max(temp)
      log.u <- c + log( exp( temp[1] - c ) - exp( temp[2] - c )  )
      to.resample[k] <- - Inf
    
    }
  
    k <- k+1
    
  }

  return(to.resample)
  
}