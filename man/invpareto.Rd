% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/invpareto.R
\name{invpareto}
\alias{invpareto}
\alias{dinvpareto}
\alias{pinvpareto}
\alias{qinvpareto}
\alias{minvpareto}
\alias{rinvpareto}
\title{The Inverse Pareto distribution}
\usage{
dinvpareto(x, k = 1.5, xmax = 5, log = FALSE, na.rm = FALSE)

pinvpareto(
  q,
  k = 1.5,
  xmax = 5,
  lower.tail = TRUE,
  log.p = FALSE,
  log = FALSE,
  na.rm = FALSE
)

qinvpareto(p, k = 1.5, xmax = 5, lower.tail = TRUE, log.p = FALSE)

minvpareto(r = 0, truncation = 0, k = 1.5, xmax = 5, lower.tail = TRUE)

rinvpareto(n, k = 1.5, xmax = 5)
}
\arguments{
\item{x, q}{vector of quantiles}

\item{xmax, k}{Scale and shape of the Inverse Pareto distribution, defaults to 5 and 1.5 respectively.}

\item{log, log.p}{logical; if TRUE, probabilities p are given as log(p).}

\item{na.rm}{Removes values that fall outside the support of the distribution}

\item{lower.tail}{logical; if TRUE (default), probabilities (moments) are \eqn{P[X \le x]} \eqn{(E[x^r|X \le y])}, otherwise, \eqn{P[X > x]} \eqn{(E[x^r|X > y])}}

\item{p}{vector of probabilities}

\item{r}{rth raw moment of the Inverse Pareto distribution}

\item{truncation}{lower truncation parameter, defaults to xmin}

\item{n}{number of observations}
}
\value{
dinvpareto returns the density, pinvpareto the distribution function, qinvpareto the quantile function, minvpareto the rth moment of the distribution and rinvpareto generates random deviates.

 The length of the result is determined by n for rinvpareto, and is the maximum of the lengths of the numerical arguments for the other functions.
}
\description{
Density, distribution function, quantile function, raw moments and random generation for the Pareto distribution.
}
\details{
Probability and Cumulative Distribution Function:

 \deqn{f(x) =\frac{k x_{max}^{-k}}{x^{-k+1}}, \qquad F_X(x) = (\frac{x_{max} }{x})^{-k}}

 The y-bounded r-th raw moment of the Inverse Pareto distribution equals:

 \deqn{\mu^r_y =k\omega_{max}^{-k}\frac{\omega_{max}^{r+k}- y^{r+k}}{r+k}  }
}
\examples{

## Inverse invpareto density
plot(x = seq(0, 5, length.out = 100), y = dinvpareto(x = seq(0, 5, length.out = 100)))

## Demonstration of log functionality for probability and quantile function
qinvpareto(pinvpareto(2, log.p = TRUE), log.p = TRUE)

## The zeroth truncated moment is equivalent to the probability function
pinvpareto(2)
minvpareto(truncation = 2)

## The (truncated) first moment is equivalent to the mean of a (truncated) random sample,
#for large enough samples.
x <- rinvpareto(1e5)

mean(x)
minvpareto(r = 1, lower.tail = FALSE)

sum(x[x > quantile(x, 0.1)]) / length(x)
minvpareto(r = 1, truncation = quantile(x, 0.1), lower.tail = FALSE)
}
