% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/idio.R
\name{idio.predict}
\alias{idio.predict}
\title{Forecasting idiosyncratic VAR process}
\usage{
idio.predict(object, x, cpre, h = 1)
}
\arguments{
\item{object}{\code{fnets} object}

\item{x}{input time series matrix, with each row representing a variable}

\item{cpre}{output of \link[fnets]{common.predict}}

\item{h}{forecast horizon}
}
\value{
a list containing
\item{is}{ in-sample estimator of the idiosyncratic component}
\item{fc}{ forecasts of the idiosyncratic component for a given forecasting horizon \code{h}}
\item{h}{ forecast horizon}
}
\description{
Produces forecasts of the idiosyncratic VAR process
for a given forecasting horizon by estimating the best linear predictors
}
\examples{
set.seed(123)
n <- 500
p <- 50
common <- sim.unrestricted(n, p)
idio <- sim.var(n, p)
x <- common$data + idio$data
out <- fnets(x, q = NULL, var.order = 1, var.method = "lasso",
do.lrpc = FALSE, var.args = list(n.cores = 2))
cpre <- common.predict(out, x, h = 1, r = NULL)
ipre <- idio.predict(out, x, cpre, h = 1)
}
\references{
Barigozzi, M., Cho, H. & Owens, D. (2022) FNETS: Factor-adjusted network estimation and forecasting for high-dimensional time series. arXiv preprint arXiv:2201.06110.

Owens, D., Cho, H. & Barigozzi, M. (2022) fnets: An R Package for Network Estimation and Forecasting via Factor-Adjusted VAR Modelling. arXiv preprint arXiv:2301.11675.
}
