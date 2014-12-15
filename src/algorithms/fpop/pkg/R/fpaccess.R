retour_op <- function
### This function is use by the fpop function to recover the best segmentation from 1:n from the C output
(path, 
### the path vector of the "colibri_op_R_c C" function
i
### the last position to consider in the path vector
){
   chaine <- integer(1)
   chaine[1] <- length(path)
   j <- 2
   while(chaine[j-1] > 0){
	chaine[j] <- path[chaine[j-1]]
	j=j+1	
	}
   return(rev(chaine)[-1])
### return a vector with the best change-points w.r.t. to L2 to go from point 1 to i
}

Fpop <- function
### Function calling the fpop algorithm, use functional pruning and optimal partionning to recover the best segmentation
### with respect to the L2 loss with a per change-point penalty of lambda.
(x, 
### A vector of double : the signal to be segmented
lambda, 
### Value of the penalty
mini=min(x), 
### Min value for the mean parameter of the segment
maxi=max(x)
### Max value for the mean parameter of the segment
){
  n <- length(x)
  A <- .C("colibri_op_R_c", signal=as.double(x), n=as.integer(n), 
		lambda=as.double(lambda),   min=as.double(mini), 
		max=as.double(maxi), path=integer(n), cost=double(n)
	, PACKAGE="fpop")
    A$t.est <- retour_op(A$path, n)
    A$K <- length(A$t.est)
    A$J.est <- A$cost[n] - (A$K+1)*lambda + sum(x^2)
    return(A);	
### return a list with a vector t.est containing the position of the change-points
} 

fpop_analysis <- function
### A function to count the number of intervals and or candidate segmentation at each step of fpop (under-developpemment)
(x,
### A vector of double : the signal to be segmented
lambda, 
### Value of the penalty
mini=min(x), 
### Min value for the mean parameter of the segment
maxi=max(x)
### Max value for the mean parameter of the segment
){

	n <- length(x)
    A <- .C("colibri_op_R_c_analysis", signal=as.double(x), n=as.integer(n), lambda=as.double(lambda),   min=as.double(mini), max=as.double(maxi), path=integer(n), cost=double(n), nbCandidate=integer(n)
	, PACKAGE="fpop")
    A$t.est <- retour_op(A$path, n)
    return(A);	
### return a list with a vector containing the position of the change-points t.est
} 


Fpsn <- function
### Function to run the pDPA algorithm with the L2 loss (it is a wrapper to cghseg)
(x, 
### A vector of double : the signal to be segmented
Kmax
){
	cghseg:::segmeanCO(x, Kmax)
### return a list with a J.est vector containing the L2 loss and a t.est matrix with the changes of the segmentations in 1 to Kmax
}



