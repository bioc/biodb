% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fcts_url.R
\name{getUrlRequestResult}
\alias{getUrlRequestResult}
\title{Send a request and get results.}
\usage{
getUrlRequestResult(request, useragent = NULL, ssl.verifypeer = TRUE)
}
\arguments{
\item{request}{A BiodbRequest object.}

\item{useragent}{The user agent identification.}

\item{ssl.verifypeer}{Set to TRUE to enable SSL verify peer.}
}
\value{
A RequestResult object.
}
\description{
Send a request and get results.
}
