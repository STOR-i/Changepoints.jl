\name{retour_op}
\alias{retour_op}
\title{retour op}
\description{This function is use by the fpop function to recover the best segmentation from 1:n from the C output}
\usage{retour_op(path, i)}\arguments{
  \item{path}{the path vector of the "colibri_op_R_c C" function}
  \item{i}{the last position to consider in the path vector}
}

\value{return a vector with the best change-points w.r.t. to L2 to go from point 1 to i}

\author{Guillem Rigaill}





