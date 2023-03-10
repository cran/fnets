% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/factor.R
\name{fnets.factor.model}
\alias{fnets.factor.model}
\title{Factor model estimation}
\usage{
fnets.factor.model(
  x,
  center = TRUE,
  fm.restricted = FALSE,
  q = c("ic", "er"),
  ic.op = NULL,
  kern.bw = NULL,
  common.args = list(factor.var.order = NULL, max.var.order = NULL, trunc.lags = 20,
    n.perm = 10)
)
}
\arguments{
\item{x}{input time series matrix, with each row representing a variable}

\item{center}{whether to de-mean the input \code{x} row-wise}

\item{fm.restricted}{whether to estimate a restricted factor model using static PCA}

\item{q}{Either a string specifying the factor number selection method when \code{fm.restricted = TRUE}; possible values are:
\itemize{
   \item{\code{"ic"}}{ information criteria of Hallin and Liška (2007) or Bai and Ng (2002), see \link[fnets]{factor.number}}
   \item{\code{"er"}}{ eigenvalue ratio}
}
or the number of unrestricted factors.}

\item{ic.op}{choice of the information criterion penalty, see \link[fnets]{hl.factor.number} or \link[fnets]{abc.factor.number} for further details}

\item{kern.bw}{kernel bandwidth for dynamic PCA; by default, it is set to
\code{4 * floor((dim(x)[2]/log(dim(x)[2]))^(1/3)))}. When \code{fm.restricted = TRUE}, it is used to compute the number of lags for which autocovariance matrices are estimated}

\item{common.args}{a list specifying the tuning parameters required for estimating the impulse response functions and common shocks. It contains:
\itemize{
   \item{\code{factor.var.order}}{ order of the blockwise VAR representation of the common component. If \code{factor.var.order = NULL}, it is selected blockwise by Schwarz criterion}
   \item{\code{max.var.order}}{ maximum blockwise VAR order for the Schwarz criterion}
   \item{\code{trunc.lags}}{ truncation lag for impulse response function estimation}
   \item{\code{n.perm}}{ number of cross-sectional permutations involved in impulse response function estimation}
}}
}
\value{
an S3 object of class \code{fm}, which contains the following fields:
\item{q}{ number of factors}
\item{spec}{ if \code{fm.restricted = FALSE} a list containing estimates of the spectral density matrices for \code{x}, common and idiosyncratic components}
\item{acv}{ a list containing estimates of the autocovariance matrices for \code{x}, common and idiosyncratic components}
\item{loadings}{ if \code{fm.restricted = TRUE}, factor loadings; if \code{fm.restricted = FALSE} and \code{q >= 1},
a list containing estimators of the impulse response functions (as an array of dimension \code{(p, q, trunc.lags + 2)})}
\item{factors}{ if \code{fm.restricted = TRUE}, factor series; else, common shocks (an array of dimension \code{(q, n)})}
\item{mean.x}{ if \code{center = TRUE}, returns a vector containing row-wise sample means of \code{x}; if \code{center = FALSE}, returns a vector of zeros}
}
\description{
Performs factor modelling under either restricted (static) or unrestricted (dynamic) factor models
}
\details{
See Barigozzi, Cho and Owens (2022) for further details.
}
\examples{
\donttest{
set.seed(123)
n <- 500
p <- 50
common <- sim.restricted(n, p)
x <- common$data + rnorm(n*p)
out <- fnets.factor.model(x, fm.restricted = TRUE)
}
}
\references{
Alessi, L., Barigozzi, M.,  & Capasso, M. (2010) Improved penalization for determining the number of factors in approximate factor models. Statistics & Probability Letters, 80(23-24):1806–1813.

Bai, J. & Ng, S. (2002) Determining the number of factors in approximate factor models. Econometrica. 70: 191-221.

Barigozzi, M., Cho, H. & Owens, D. (2022) Factor-adjusted network estimation and forecasting for high-dimensional time series. arXiv preprint arXiv:2201.06110.

Hallin, M. & Liška, R. (2007) Determining the number of factors in the general dynamic factor model. Journal of the American Statistical Association, 102(478), 603--617.

Owens, D., Cho, H. & Barigozzi, M. (2022) fnets: An R Package for Network Estimation and Forecasting via Factor-Adjusted VAR Modelling. arXiv preprint arXiv:2301.11675.
}
