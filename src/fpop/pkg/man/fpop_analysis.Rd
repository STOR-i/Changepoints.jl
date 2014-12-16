\name{fpop_analysis}
\alias{fpop_analysis}
\title{fpop analysis}
\description{A function to count the number of intervals and or candidate segmentation at each step of fpop (under-developpemment)}
\usage{fpop_analysis(x, lambda, mini = min(x), maxi = max(x))}\arguments{
  \item{x}{A vector of double : the signal to be segmented}
  \item{lambda}{Value of the penalty}
  \item{mini}{Min value for the mean parameter of the segment}
  \item{maxi}{Max value for the mean parameter of the segment}
}

\value{return a list with a vector containing the position of the change-points t.est}

\author{Guillem Rigaill}





