% Generated by roxygen2 (4.0.1): do not edit by hand
\name{qgrowth}
\alias{qgrowth}
\title{Extract CDC pediatric growth charts}
\usage{
qgrowth(sex = c("M", "F", "B"), percentile = c("5", "10", "25", "50", "75",
  "90", "95"), agemos = (seq(0, 18) * 12))
}
\arguments{
\item{sex}{A single quoted character: \dQuote{M} for males, \dQuote{F} for females, or \dQuote{B} for both, in which case an average
of the two sexes will be returned.  Default is \dQuote{M}.}

\item{percentile}{An integer of the percentile for each age/sex to return.  Default is 5.}

\item{agemos}{The ages in months to return.  The default is \code{seq(0,18)*12}, i.e. 1 to 18 years.}
}
\value{
A dataframe with columns
 \item{age }{Age in months}
 \item{wt }{Weight in kilograms}
 \item{ht }{Height or length in centimeters}
 \item{sex }{The selected \code{sex}}
 \item{percentile }{The selected \code{percentile}}
}
\description{
Will extract height and weight for boys, girls or both for a given range of ages in months and percentile. This can be useful for
simulations in Pmetrics.
}
\author{
Michael Neely
}

