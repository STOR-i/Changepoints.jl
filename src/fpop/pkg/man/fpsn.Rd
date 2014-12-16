\name{fpsn}
\alias{fpsn}
\title{fpsn}
\description{## nj function pruning access
Function to run the pDPA algorithm with the L2 loss (it is a wrapper to cghseg for now)
## return 
Function to run the pDPA algorithm with the L2 loss (it is a wrapper to cghseg for now)
## t.est a matrix of size Kmax x Kmax with the position of the best breaks for a segmentation in k from 1 to Kmax
Function to run the pDPA algorithm with the L2 loss (it is a wrapper to cghseg for now)
## J.est the cost of the best segmentation in k from 1 to Kmax
Function to run the pDPA algorithm with the L2 loss (it is a wrapper to cghseg for now)
## it is just a link to cghseg
Function to run the pDPA algorithm with the L2 loss (it is a wrapper to cghseg for now)}
\usage{fpsn(x, Kmax)}
\arguments{
  \item{x}{A vector of double : the signal to be segmented}
  \item{Kmax}{Maximum number of segments. The snfp will recover all the best segmentation w.r.t. to the L2 in 1 to Kmax segments}
}

\value{return a list with a J.est vector containing the L2 loss and a t.est matrix with the changes of the segmentations in 1 to Kmax}

\author{Guillem Rigaill}





