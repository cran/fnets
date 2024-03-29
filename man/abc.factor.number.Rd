% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/factor_number.R
\name{abc.factor.number}
\alias{abc.factor.number}
\title{Factor number estimator of Alessi, Barigozzi and Capasso (2010)}
\usage{
abc.factor.number(x, covx = NULL, q.max = NULL, center = TRUE)
}
\arguments{
\item{x}{input time series matrix, with each row representing a variable}

\item{covx}{covariance of \code{x}}

\item{q.max}{maximum number of factors; if \code{q.max = NULL}, a default value is selected as \code{min(50, floor(sqrt(min(dim(x)[2] - 1, dim(x)[1]))))}}

\item{center}{whether to de-mean the input \code{x} row-wise}
}
\value{
a list containing
\item{q.hat}{ the mimimiser of the chosen information criteria}
}
\description{
Estimates the number of factors by minimising an information criterion over sub-samples of the data.
Currently the three information criteria proposed in Alessi, Barigozzi and Capasso (2010) (\code{ic.op = 1, 2, 3})
and their variations with logarithm taken on the cost (\code{ic.op = 4, 5, 6}) are implemented,
with \code{ic.op = 5} recommended as a default choice based on numerical experiments.
}
\details{
See Alessi, Barigozzi and Capasso (2010) for further details.
}
\references{
Alessi, L., Barigozzi, M.,  & Capasso, M. (2010) Improved penalization for determining the number of factors in approximate factor models. Statistics & Probability Letters, 80(23-24):1806–1813.
}
\keyword{internal}
