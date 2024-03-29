% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/factor_number.R
\name{hl.factor.number}
\alias{hl.factor.number}
\title{Factor number estimator of Hallin and Liška (2007)}
\usage{
hl.factor.number(x, q.max = NULL, mm = NULL, center = TRUE)
}
\arguments{
\item{x}{input time series matrix, with each row representing a variable}

\item{q.max}{maximum number of factors; if \code{q.max = NULL}, a default value is selected as \code{min(50, floor(sqrt(min(dim(x)[2] - 1, dim(x)[1]))))}}

\item{mm}{a positive integer specifying the kernel bandwidth for dynamic PCA; by default, it is set to \code{floor(4 *(dim(x)[2]/log(dim(x)[2]))^(1/3)))}}

\item{center}{whether to de-mean the input \code{x} row-wise}
}
\value{
a list containing
\item{q.hat}{ a vector containing minimisers of the six information criteria}
}
\description{
Estimates the number of factors by minimising an information criterion over sub-samples of the data.
Currently the three information criteria proposed in Hallin and Liška (2007) (\code{ic.op = 1, 2} or \code{3})
and their variations with logarithm taken on the cost (\code{ic.op = 4, 5} or \code{6}) are implemented,
with \code{ic.op = 5} recommended as a default choice based on numerical experiments.
}
\details{
See Hallin and Liška (2007) for further details.
}
\references{
Hallin, M. & Liška, R. (2007) Determining the number of factors in the general dynamic factor model. Journal of the American Statistical Association, 102(478), 603--617.
}
\keyword{internal}
