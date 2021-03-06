% Generated by roxygen2 (4.0.1): do not edit by hand
\name{plot.PMsim}
\alias{plot.PMsim}
\title{Plot Pmetrics Simulation Objects}
\usage{
\method{plot}{PMsim}(x, mult = 1, log = T, probs = c(0.05, 0.25, 0.5,
  0.75, 0.95), outeq = 1, pch = NA, join = T, x.qlab = 0.4,
  cex.qlab = 0.8, pos.qlab = 1, ci = 0.95, cex.lab = 1.2,
  xlab = "Time (h)", ylab = "Output", xlim, ylim, obs, grid,
  ocol = "blue", add = F, out = NA, ...)
}
\arguments{
\item{x}{The name of an \emph{PMsim} data object generated by \code{\link{SIMparse}}}

\item{mult}{Multiplication factor for y axis, e.g. to convert mg/L to ng/mL}

\item{log}{Boolean operator to plot in log-log space; the default is \code{False}}

\item{probs}{Vector of quantiles to plot; if set to \code{NA}, all simulated profiles will be plotted,
and numerical predictive checking will be suppressed}

\item{outeq}{Which output equation to plot if more than 1}

\item{pch}{Controls the plotting symbol for observations; default is NA which results in no symbol.
Use 0 for open square, 1 for open circle, 2 for open triangle, 3 for cross, 4 for X, or 5 for a diamond.
Other alternatives are \dQuote{*} for asterisks, \dQuote{.} for tiny dots, or \dQuote{+} for a smaller,
bolder cross.  These plotting symbols are standard for R (see \code{\link{par}}).}

\item{join}{Boolean operator to join observations by a straight line; the default is \code{True}.}

\item{x.qlab}{Proportionate value of x-axis at which to draw the quantile labels; 0 is left, 1 is right.
The default is 0.4.}

\item{pos.qlab}{This allows more refined positioning of the quantile labels.  It takes standard R
values: 1, below; 2, left; 3, above; 4, right.}

\item{cex.qlab}{Size of the quantile labels.}

\item{ci}{Width of confidence interval bands around simulated quantiles, from 0 to 1.  If 0, or \emph{nsim}<100, will not plot.
Default is 0.95, i.e. 95th percentile with tails of 2.5 percent above and below excluded.}

\item{cex.lab}{Size of the plot labels.}

\item{xlab}{Label for x-axis; default is \dQuote{Time}}

\item{ylab}{Label for y-axis; default is \dQuote{Output}}

\item{xlim}{Limits of the x-axis as a vector, e.g. \code{c(0,1)}.  It does not need to be specified, but can be.}

\item{ylim}{Analogous to \code{xlim}}

\item{obs}{The name of an \emph{makeOP} data object generated by \code{\link{makeOP}}.  If specified,
the observations will be overlaid upon the simulation plot enabling a visual predicitve check.  In this case,
a list object will be returned with two items: $npc containing the quantiles and probability that the observations
are below each quantile (binomial test); and $simsum, the times of each observation and the
value of the simulated quantile with upper and lower confidence intervals at that time.}

\item{grid}{Either a boolean operator to plot a reference grid, or a list with elements x and y,
each of which is a vector specifying the native coordinates to plot grid lines; the default is \code{False}.
For example, grid=list(x=seq(0,24,2),y=1:10).  Defaults for missing x or y will be calculated by \code{\link{axTicks}}.}

\item{ocol}{Color for observations}

\item{add}{Boolean operator, if \code{True} will add lines to existing plot}

\item{out}{Direct output to a PDF, EPS or image file.  Format is a named list whose first argument,
\code{type} is one of the following character vectors: \dQuote{pdf}, \dQuote{eps} (maps to \code{postscript}),
\dQuote{\code{png}}, \dQuote{\code{tiff}}, \dQuote{\code{jpeg}}, or \dQuote{\code{bmp}}.  Other named items in the list
are the arguments to each graphic device. PDF and EPS are vector images acceptable to most journals
in a very small file size, with scalable (i.e. infinite) resolution.  The others are raster images which may be very
large files at publication quality dots per inch (DPI), e.g. 800 or 1200. Default value is \code{NA} which means the
output will go to the current graphic device (usually the monitor). For example, to output an eps file,
out=list(\dQuote{eps}) will generate a 7x7 inch (default) graphic.}

\item{\dots}{Other parameters as found in \code{\link{plot.default}}.}
}
\value{
Plots the simulation object.  If \code{obs} is included, a list will be returned with
the folowing items:
\item{npc}{A dataframe with three columns: quantile, prop.less, pval.  \emph{quantile} are those specified
by the \code{prob} argument to the plot call; \emph{prop.less} are the proportion of simulated
observations at all times less than the quantile; \emph{pval} is the P-value of the difference in the
prop.less and quantile by the beta-binomial test.}
\item{simsum}{A dataframe with the quantile concentration at each simulated time,
with lower and upper confidence intervals}
\item{obs}{A dataframe similar to an PMop object made by \code{\link{makeOP}}
with the addition of the quantile for each observation}
}
\description{
Plots \emph{PMsim} objects with the option to perform a visual and numerical predictive check
}
\details{
Simulated observations are plotted as quantiles on the y-axis vs. time on the x.axis.  If measured
observations are included, a visual and numerical predictive check will be performed.
}
\author{
Michael Neely
}
\seealso{
\code{\link{SIMparse}}, \code{\link{plot}}, \code{\link{par}}, \code{\link{axis}}
}

