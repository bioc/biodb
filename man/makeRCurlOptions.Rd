% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fcts_url.R
\name{makeRCurlOptions}
\alias{makeRCurlOptions}
\title{Build an RCurl::CURLOptions object.}
\usage{
makeRCurlOptions(
  useragent = NULL,
  httpheader = NULL,
  postfields = NULL,
  timeout.ms = 60000,
  verbose = FALSE
)
}
\arguments{
\item{useragent}{The user agent identification.}

\item{httpheader}{The HTTP header to send.}

\item{postfields}{POST fields, in case of a POST method.}

\item{timeout.ms}{The timeout in milliseconds.}

\item{verbose}{Set to TRUE to get verbose output in RCurl.}
}
\value{
An RCurl::CURLOptions object.
}
\description{
Build an RCurl::CURLOptions object.
}
