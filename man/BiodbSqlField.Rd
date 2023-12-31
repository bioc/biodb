% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BiodbSqlField.R
\name{BiodbSqlField}
\alias{BiodbSqlField}
\title{This class represents an SQL field.}
\description{
This class represents an SQL field.

This class represents an SQL field.
}
\section{Super class}{
\code{\link[biodb:BiodbSqlExpr]{biodb::BiodbSqlExpr}} -> \code{BiodbSqlField}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-BiodbSqlField-new}{\code{BiodbSqlField$new()}}
\item \href{#method-BiodbSqlField-toString}{\code{BiodbSqlField$toString()}}
\item \href{#method-BiodbSqlField-clone}{\code{BiodbSqlField$clone()}}
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbSqlField-new"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbSqlField-new}{}}}
\subsection{Method \code{new()}}{
Initializer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbSqlField$new(table = NA_character_, field)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{table}}{The table name.}

\item{\code{field}}{The field name.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbSqlField-toString"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbSqlField-toString}{}}}
\subsection{Method \code{toString()}}{
Converts into a string.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbSqlField$toString()}\if{html}{\out{</div>}}
}

\subsection{Returns}{
A string containing the SQL expression.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbSqlField-clone"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbSqlField-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbSqlField$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
