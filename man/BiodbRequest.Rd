% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BiodbRequest.R
\name{BiodbRequest}
\alias{BiodbRequest}
\title{Class Request.}
\description{
Class Request.

Class Request.
}
\details{
This class represents a Request object that can be used with the Request
Scheduler.
}
\examples{
# Create an instance with default settings:
mybiodb <- biodb::newInst()

# Create a request object
u <- 'https://www.ebi.ac.uk/webservices/chebi/2.0/test/getCompleteEntity'
url <- BiodbUrl$new(url=u)
url$setParam('chebiId', 15440)
request <- BiodbRequest$new(method='get', url=url)

# Send request
mybiodb$getRequestScheduler()$sendRequest(request)

# Terminate instance.
mybiodb$terminate()

}
\seealso{
\code{\link{BiodbRequestScheduler}}, \code{\link{BiodbUrl}}.
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-BiodbRequest-new}{\code{BiodbRequest$new()}}
\item \href{#method-BiodbRequest-setConn}{\code{BiodbRequest$setConn()}}
\item \href{#method-BiodbRequest-getConn}{\code{BiodbRequest$getConn()}}
\item \href{#method-BiodbRequest-getUrl}{\code{BiodbRequest$getUrl()}}
\item \href{#method-BiodbRequest-getMethod}{\code{BiodbRequest$getMethod()}}
\item \href{#method-BiodbRequest-getEncoding}{\code{BiodbRequest$getEncoding()}}
\item \href{#method-BiodbRequest-getCurlOptions}{\code{BiodbRequest$getCurlOptions()}}
\item \href{#method-BiodbRequest-getUniqueKey}{\code{BiodbRequest$getUniqueKey()}}
\item \href{#method-BiodbRequest-getHeaderAsSingleString}{\code{BiodbRequest$getHeaderAsSingleString()}}
\item \href{#method-BiodbRequest-getBody}{\code{BiodbRequest$getBody()}}
\item \href{#method-BiodbRequest-print}{\code{BiodbRequest$print()}}
\item \href{#method-BiodbRequest-toString}{\code{BiodbRequest$toString()}}
\item \href{#method-BiodbRequest-clone}{\code{BiodbRequest$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-new"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-new}{}}}
\subsection{Method \code{new()}}{
Initializer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$new(
  url,
  method = c("get", "post"),
  header = character(),
  body = character(),
  encoding = integer(),
  conn = NULL
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{url}}{A \code{BiodbUrl} object.}

\item{\code{method}}{HTTP method. Either "get" or "post".}

\item{\code{header}}{The header.}

\item{\code{body}}{The body.}

\item{\code{encoding}}{The encoding to use.}

\item{\code{conn}}{A valid BiodbConn instance for which this request is built.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-setConn"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-setConn}{}}}
\subsection{Method \code{setConn()}}{
Sets the associated connector (usually the connector that created this
request).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$setConn(conn)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{conn}}{A valid BiodbConn object.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getConn"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getConn}{}}}
\subsection{Method \code{getConn()}}{
gets the associated connector (usually the connector that created this
request).
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getConn()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The associated connector as a BiodbConn object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getUrl"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getUrl}{}}}
\subsection{Method \code{getUrl()}}{
Gets the URL.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getUrl()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The URL as a BiodbUrl object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getMethod"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getMethod}{}}}
\subsection{Method \code{getMethod()}}{
Gets the method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getMethod()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The method as a character value.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getEncoding"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getEncoding}{}}}
\subsection{Method \code{getEncoding()}}{
Gets the encoding.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getEncoding()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The encoding.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getCurlOptions"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getCurlOptions}{}}}
\subsection{Method \code{getCurlOptions()}}{
Gets the options object to pass to cURL library.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getCurlOptions(useragent)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{useragent}}{The user agent as a character value.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
An RCurl options object.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getUniqueKey"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getUniqueKey}{}}}
\subsection{Method \code{getUniqueKey()}}{
Gets a unique key to identify this request. The key is an MD5 sum
computed from the string representation of this request.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getUniqueKey()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A unique key as an MD5 sum.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getHeaderAsSingleString"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getHeaderAsSingleString}{}}}
\subsection{Method \code{getHeaderAsSingleString()}}{
Gets the HTTP header as a string, concatenating all its information
into a single string.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getHeaderAsSingleString()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The header as a single character value.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-getBody"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-getBody}{}}}
\subsection{Method \code{getBody()}}{
Gets the body.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$getBody()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The body as a character value.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-print"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-print}{}}}
\subsection{Method \code{print()}}{
Displays information about this instance.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$print()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
self as invisible.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-toString"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-toString}{}}}
\subsection{Method \code{toString()}}{
Gets a string representation of this instance.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$toString()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A single string giving a representation of this instance.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbRequest-clone"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbRequest-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbRequest$clone(deep = FALSE)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{deep}}{Whether to make a deep clone.}
}
\if{html}{\out{</div>}}
}
}
}
