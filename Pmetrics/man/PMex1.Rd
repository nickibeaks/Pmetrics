% Generated by roxygen2 (4.0.1): do not edit by hand
\docType{data}
\name{PMex1}
\alias{PMex1}
\title{Example NPAG Output}
\format{An R data file containing the output generated at the end of a successful NPAG run.
\itemize{
\item NPdata.1 made by \code{\link{NPparse}}
\item final.1 made by  \code{\link{makeFinal}}
\item cycle.1 made by \code{\link{makeCycle}}
\item op.1 made by \code{\link{makeOP}}
\item cov.1 made by \code{\link{makeCov}}
\item pop.1 made by \code{\link{makePop}}
\item post.1 made by \code{\link{makePost}}
\item mdata.1 the original data file as read by \code{\link{PMreadMatrix}}
}}
\usage{
PMex1
}
\description{
Example dataset from an NPAG run.
}
\details{
The run consisted of a model with an absorptive compartment and a central compartment.
There were 4 parameters in the model: lag time of absorption (Tlag1),
rate constant of absorption (Ka), volume (V) and rate constatn of elmination (Ke).
Parameters were log transformed.  There were 20 subjects in the dataset.  The run was
100 cycles long and did not converge.

The input files for this run (ex.csv and model.txt) can be downloaded as a zip file from
\url{http://www.lapk.org/Pmetrics_install.php#examples}.
}
\author{
Michael Neely
}
\keyword{datasets}

