% Generated by roxygen2 (4.0.1): do not edit by hand
\name{makePost}
\alias{makePost}
\title{Individual Bayesian posterior predictions at short intervals}
\usage{
makePost(run, NPdata)
}
\arguments{
\item{run}{The number of the folder that contains the relevant run.  If missing will be
set to current working directory.}

\item{NPdata}{Optional name of NPdata object if run is missing.}
}
\value{
A dataframe of class \emph{PMpost} with columns:
\item{id}{ Subject id}
\item{time}{ Time of predictions in decimal hours}
\item{icen}{ Prediction based on mean or median of Bayesian posterior parameter distribution}
\item{pred}{ Predicted output for each outeq}
\item{outeq}{ Output equation number}
\item{block}{ Observation blocks within subjects as defined by EVID=4 dosing events}
}
\description{
Returns the Bayesian posterior predictions at short intervals specified during the NPAG run,
up to 12 minutes.  These results are contained separately from the main output of NPAG, in the
PRTBxxxx file.
}
\author{
Michael Neely
}

