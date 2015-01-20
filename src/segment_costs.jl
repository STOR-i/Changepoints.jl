function NormalMeanSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    cost(s::Int64, t::Int64) = cd_2[t+1] - cd_2[s] - abs2(cd[t+1] - cd[s])/(t-s+1)
    return cost
end

function NormalVarSegment(data::Array{Float64}, μ::Float64)
    ss = [0,cumsum((data - μ).^2)]
    cost(s::Int64, t::Int64) = (t-s+1) * log( (ss[t+1] - ss[s])/(t-s+1) ) 
end

function NormalMeanVarSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    function cost(s::Int64, t::Int64) 
      mu = (cd[t+1] - cd[s])/(t-s+1)
      sig = ( cd_2[t+1] - cd_2[s] )/(t-s+1) - mu^2
      return (t-s+1)*log(sig) + (cd_2[t+1] - cd_2[s])/sig - 2*(cd[t+1] - cd[s])*mu/sig + ((t-s+1)*mu^2)/sig
    end
    return cost
end

function ExponentialSegment(data::Array{Float64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(t-s+1) * ( log(t-s+1) - log(cd[t+1] - cd[s]) - 1 )  
    return cost
end

function PoissonSegment(data::Array{Int64})
    cd = [0,cumsum( data )]
    cost(s::Int64, t::Int64) = -2*(cd[t+1]-cd[s]) * ( log(cd[t+1]-cd[s]) - log(t-s+1) - 1 )
    return cost
end

function BetaSegment(data::Array{Float64})
# Method of moments
    cd = [0,cumsum( data )]
    cd_2 = [0,cumsum( abs2(data) )]
    lcd = [0,cumsum( log(data) )]
    clcd = [0,cumsum( log(1-data) )]
    function cost(s::Int64, t::Int64) 
      mu = (cd[t+1] - cd[s])/(t-s+1)
      sig = ( cd_2[t+1] - cd_2[s] )/(t-s+1) - mu^2
      alpha = mu*( mu*(1-mu)/sig - 1 )
      beta = (1-mu)*( mu*(1-mu)/sig - 1 )
      return (t-s+1)*lbeta(alpha,beta) - (alpha-1)*( lcd[t+1]-lcd[s] ) - (beta-1)*( clcd[t+1]-clcd[s] )
    end
    return cost
end


# code in julia
#################################
# Kayleas code to do non parametric
# think R is a vector of changepoint beginnings
##########################

###### Function to calculate the empirical CDF of nonparametric function #################
 
#Q[i,j+1] is the number of data points y_{1:j} that are less that y_{(i)}
 
nonparametric.sum = function(data){
  n <- length(data) ##this needed before defining Q
  Q <- matrix(0,n,n+1) ##I THINK THIS NEEDS TO BE (n+1) COLUMNS; so SUM
  ##for y_{S:T} IS DIFFERENCE of T+1 and S
  x=sort(data)
  for(i in 1:n){
    Q[i,-1]=cumsum(data<x[i])+0.5*cumsum(data==x[i])
  }
  return(Q)
}
 
########## Function to calculate the cost - nonparametric maximum likelihood #################
 
nonparametric.cost = function(tau,R,sumx = nonparametric.sum(data)){
  m=length(R)
  cost=rep(0,m)
  n=dim(sumx)[1] ##K NEW changed to sumx and not Q
  l=1:(n) ## K NEW changed to 1:(n-1)
  #  w=n/(l*(n-l)) ##weight function 
  w=1/((l-0.5)*(n-l+0.5)) ##weight function -- NEW -- THIS IS DIFFERENT TO THE PAPER.
  for(j in 1:m){
    Fkl=(sumx[l,tau+1]-sumx[l,R[j]+1])/(tau-R[j]) ##K NEW - assuming segment starts at R[j] and stops at tau; CHANGED
    ind=(1:length(l))[Fkl>0 & Fkl<1] ##only those with F>0 and F<1 contribute to log-lik  ## K NEW changed F to Fkl
    Fkl=Fkl[ind]
    cost[j]=-n*sum((tau-(R[j]))*w[ind]*(Fkl*log(Fkl)+(1-Fkl)*log(1-Fkl)))  ### K NEW - rearranged to include (tau-(R[j]+1) in the sum and to multiple by n
  }
  return(cost)
}
