% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/Range.R
\name{Range}
\alias{Range}
\title{Range class.}
\description{
Range class.

Range class.
}
\details{
A class for storing min/max range or value/tolerance.
}
\examples{
# Convert a min/max range into a value/ppm tolerance:
rng <- Range$new(min=0.4, max=0.401)
value <- rng$getValue()
ppm <- rng$getPpm()


## ------------------------------------------------
## Method `Range$new`
## ------------------------------------------------

# Create an instance from min and max:
Range$new(min=1.2, max=1.5)
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-Range-new}{\code{Range$new()}}
\item \href{#method-Range-getValue}{\code{Range$getValue()}}
\item \href{#method-Range-getMin}{\code{Range$getMin()}}
\item \href{#method-Range-getMax}{\code{Range$getMax()}}
\item \href{#method-Range-getMinMax}{\code{Range$getMinMax()}}
\item \href{#method-Range-getDelta}{\code{Range$getDelta()}}
\item \href{#method-Range-getPpm}{\code{Range$getPpm()}}
\item \href{#method-Range-getTolExpr}{\code{Range$getTolExpr()}}
\item \href{#method-Range-clone}{\code{Range$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-new"></a>}}
\if{latex}{\out{\hypertarget{method-Range-new}{}}}
\subsection{Method \code{new()}}{
Initializer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$new(
  min = NULL,
  max = NULL,
  value = NULL,
  delta = NULL,
  ppm = NULL,
  tol = NULL,
  tolType = c("delta", "plain", "ppm")
)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{min}}{The minimum value of the range.}

\item{\code{max}}{The maximum value of the range.}

\item{\code{value}}{The value.}

\item{\code{delta}}{The delta tolerance.}

\item{\code{ppm}}{The PPM tolerance.}

\item{\code{tol}}{The tolerance value, whose type (ppm or delta) is specified by
the "tolType" parameter.}

\item{\code{tolType}}{The type of the tolerance value specified by the "tol"
parameter.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
\subsection{Examples}{
\if{html}{\out{<div class="r example copy">}}
\preformatted{# Create an instance from min and max:
Range$new(min=1.2, max=1.5)
}
\if{html}{\out{</div>}}

}

}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getValue"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getValue}{}}}
\subsection{Method \code{getValue()}}{
Gets the middle value of the range.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getValue()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The middle value.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getMin"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getMin}{}}}
\subsection{Method \code{getMin()}}{
Gets the minimum value of the range.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getMin()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The minimum value.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getMax"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getMax}{}}}
\subsection{Method \code{getMax()}}{
Gets the maximum value of the range.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getMax()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The maximum value.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getMinMax"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getMinMax}{}}}
\subsection{Method \code{getMinMax()}}{
Get the min/max range.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getMinMax()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A list containing two fields: "min" and "max.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getDelta"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getDelta}{}}}
\subsection{Method \code{getDelta()}}{
Gets the delta tolerance of the range.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getDelta()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The delta tolerance.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getPpm"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getPpm}{}}}
\subsection{Method \code{getPpm()}}{
Gets the PPM tolerance of the range.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getPpm()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
The tolerance in PPM.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-getTolExpr"></a>}}
\if{latex}{\out{\hypertarget{method-Range-getTolExpr}{}}}
\subsection{Method \code{getTolExpr()}}{
Gets the tolerance expression as a list.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$getTolExpr()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A list containing the tolerance range expression.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-Range-clone"></a>}}
\if{latex}{\out{\hypertarget{method-Range-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{Range$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
