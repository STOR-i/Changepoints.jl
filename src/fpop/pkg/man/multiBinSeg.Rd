\name{multiBinSeg}
\alias{multiBinSeg}
\title{multiBinSeg}
\description{Binary segmentation of p profiles using the L2 loss}
\usage{multiBinSeg(geno, Kmax)}\arguments{
  \item{geno}{A matrix with p columns and n lines, each column is one of the profile}
  \item{Kmax}{Maximum number of change-points}
}

\value{return an object with the successive change-points found by binseg t.est and the L2 cost J.est}

\author{Guillem Rigaill}





