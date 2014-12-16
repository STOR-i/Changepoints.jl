binseg.mean.cusum=function(data,Q=5,pen=0){
  n=length(data)
  if(n<2){stop('Data must have atleast 2 observations to fit a changepoint model.')}
  if(Q>((n/2)+1)){stop(paste('Q is larger than the maximum number of segments',(n/2)+1))}
  
  y=c(0,cumsum(data))
  tau=c(0,n)
  cpt=matrix(0,nrow=2,ncol=Q)
  oldmax=Inf
  
  for(q in 1:Q){
    lambda=rep(0,n-1)
    i=1
    st=tau[1]+1;end=tau[2]
    for(j in 1:(n-1)){
      if(j==end){
        st=end+1;i=i+1;end=tau[i+1]
      }else{
        lambda[j]=((y[j+1]-y[st])-((j-st+1)/(end-st+1))*(y[end+1]-y[st]))/(end-st+1)
      }
    }
    k=which.max(abs(lambda))
    cpt[1,q]=k;cpt[2,q]=min(oldmax,max(abs(lambda)))
    oldmax=min(oldmax,max(abs(lambda)))
    tau=sort(c(tau,k))
  }
  op.cps=NULL
  p=1:(Q-1)
  for(i in 1:length(pen)){
    criterion=(cpt[2,])>=pen[i]
    if(sum(criterion)==0){
      op.cps=0
    }
    else{
      op.cps=c(op.cps,max(which((criterion)==TRUE)))
    }
  }
  if(op.cps==Q){warning('The number of changepoints identified is Q, it is advised to increase Q to make sure changepoints have not been missed.')}
  return(list(cps=cpt,op.cpts=op.cps,pen=pen))
}