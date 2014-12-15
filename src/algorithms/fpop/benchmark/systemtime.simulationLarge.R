### Run several algorithms to perform a speed comparison:
### using a constant signal size and varying true number of changes
### PrunedDP-cghseg/PrunedDP-segmentor/fpop/pelt/dnacopy/binary segmentation.
require(changepoint)
require(cghseg)
require(fpop)
##########################################
seg.funs <-
  list(fpop=function(one.chrom, Kmax=NA){
		system.time( Fpop(one.chrom, log(length(one.chrom))) )[["user.self"]]
  },
	binseg=function(one.chrom, Kmax){
    		system.time( multiBinSeg(one.chrom, Kmax) )[["user.self"]]
	}
)

###########################################
n <- 10^7
repet <- 4
K <- c(seq(1, 50, by =4), seq(75, 2000, by =50), seq(2*10^3, 2*10^4, by =1000))
set.seed(100)
signal.list <- list()
iS <- 1

systemtime.simulation <- NULL
for(iR in 1:repet){
	for(iK in K){
		cat(iR, iK, "\n")
		### simu
		if(iK > 1){
			bkp <- sort(sample(1:(n-1), iK-1))
			lg <- diff(c(0, bkp, n)) ### rep(n/K, K)
			signal <- rep(rep(c(0, 1), length(lg))[1:length(lg)], lg)  [1:n]
		} else {
			signal <- rep(0, n)		
		}
		signalToAnalyze <- signal+ rnorm(n,sd=0.5)
		iS <- iS+1

			
		# runtimes

		for(algorithm in names(seg.funs)){
    		cat(algorithm,  "%\n")
    		fun <- seg.funs[[algorithm]]
    	 	seconds <- fun(one.chrom=signalToAnalyze, Kmax= iK+1)
    
    		systemtime.simulation <- rbind(systemtime.simulation, data.frame(algorithm, iS, iK, seconds))
  		}
		
		
	}
}
#################
colnames(systemtime.simulation)[2:4] <- c("id", "Ktrue", "seconds")

save(systemtime.simulation, file="systemtime.simulationLarge.RData")

