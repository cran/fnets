% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/omega.R
\name{par.lrpc}
\alias{par.lrpc}
\title{Parametric estimation of long-run partial correlations of factor-adjusted VAR processes}
\usage{
par.lrpc(
  object,
  x,
  eta = NULL,
  tuning.args = list(n.folds = 1, path.length = 10, do.plot = FALSE),
  lrpc.adaptive = FALSE,
  eta.adaptive = NULL,
  do.correct = TRUE,
  do.threshold = FALSE,
  n.cores = min(parallel::detectCores() - 1, 3)
)
}
\arguments{
\item{object}{\code{fnets} object}

\item{x}{input time series matrix; with each row representing a variable}

\item{eta}{regularisation parameter; if \code{eta = NULL}, it is selected by cross validation}

\item{tuning.args}{a list specifying arguments for the cross validation procedure
for selecting the tuning parameter involved in long-run partial correlation matrix estimation. It contains:
\itemize{
   \item{\code{n.folds}}{ positive integer number of folds}
   \item{\code{path.length}}{ positive integer number of regularisation parameter values to consider; a sequence is generated automatically based in this value}
   \item{\code{do.plot}}{ whether to plot the output of the cross validation step, and if \code{do.threshold = TRUE}, plot the thresholding output}
}}

\item{lrpc.adaptive}{whether to use the adaptive estimation procedure}

\item{eta.adaptive}{regularisation parameter for Step 1 of the adaptive estimation procedure; if \code{eta.adaptive = NULL}, defaults to \code{2 * sqrt(log(dim(x)[1])/dim(x)[2])}}

\item{do.correct}{whether to correct for any negative entries in the diagonals of the inverse of long-run covariance matrix}

\item{do.threshold}{whether to perform adaptive thresholding of \code{Delta} and \code{Omega} parameter estimators with \link[fnets]{threshold}}

\item{n.cores}{number of cores to use for parallel computing, see \link[parallel]{makePSOCKcluster}}
}
\value{
a list containing
\item{Delta}{ estimated inverse of the innovation covariance matrix}
\item{Omega}{ estimated inverse of the long-run covariance matrix}
\item{pc}{ estimated innovation partial correlation matrix}
\item{lrpc}{ estimated long-run partial correlation matrix}
\item{eta}{ regularisation parameter}
\item{lrpc.adaptive}{ input argument }
}
\description{
Returns a parametric estimate of long-run partial correlations of the VAR process
from the VAR parameter estimates and the inverse of innovation covariance matrix obtained via constrained \code{l1}-minimisation.
}
\details{
See Barigozzi, Cho and Owens (2022) for further details, and Cai, Liu and Zhou (2016) for further details on the adaptive estimation procedure.
}
\examples{
\donttest{
set.seed(123)
n <- 500
p <- 50
common <- sim.unrestricted(n, p)
idio <- sim.var(n, p)
x <- common$data + idio$data
out <- fnets(x, q = NULL, var.method = "lasso", do.lrpc = FALSE, var.args = list(n.cores = 2))
plrpc <- par.lrpc(out, x,
tuning.args = list(n.folds = 1, path.length = 10, do.plot = TRUE),  n.cores = 2)
out$lrpc <- plrpc
out$do.lrpc <- TRUE
plot(out, type = "pc", display = "network", threshold = .05)
plot(out, type = "lrpc", display = "heatmap", threshold = .05)
}
}
\references{
Barigozzi, M., Cho, H. & Owens, D. (2022) FNETS: Factor-adjusted network estimation and forecasting for high-dimensional time series. arXiv preprint arXiv:2201.06110.

Cai, T. T., Liu, W., & Zhou, H. H. (2016) Estimating sparse precision matrix: Optimal rates of convergence and adaptive estimation. The Annals of Statistics, 44(2), 455-488.

Owens, D., Cho, H. & Barigozzi, M. (2022) fnets: An R Package for Network Estimation and Forecasting via Factor-Adjusted VAR Modelling. arXiv preprint arXiv:2301.11675.
}
