% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExtEntryClass.R
\name{ExtEntryClass}
\alias{ExtEntryClass}
\title{Extension entry class}
\description{
A class for generating a new entry class.
}
\details{
This class generates a new entry class from given parameters.
The new class can inherit directly from \code{BiodbEntry} or
from one of its sub-classes: \code{BiodbCsvEntry}, \code{BiodbHtmlEntry}, ...
}
\examples{
# Generate a new entry class inside R folder:
pkgFolder <- file.path(tempfile(), 'biodbFoo')
dir.create(pkgFolder, recursive=TRUE)
biodb::ExtEntryClass$new(path=pkgFolder, dbName='foo.db',
                         dbTitle='Foo database',
                         connType='mass', entryType='xml')$generate()

}
\section{Super classes}{
\code{\link[biodb:ExtGenerator]{biodb::ExtGenerator}} -> \code{\link[biodb:ExtFileGenerator]{biodb::ExtFileGenerator}} -> \code{ExtEntryClass}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-ExtEntryClass-new}{\code{ExtEntryClass$new()}}
\item \href{#method-ExtEntryClass-clone}{\code{ExtEntryClass$clone()}}
}
}
\if{html}{\out{
<details open><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="biodb" data-topic="ExtGenerator" data-id="generate"><a href='../../biodb/html/ExtGenerator.html#method-ExtGenerator-generate'><code>biodb::ExtGenerator$generate()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="ExtGenerator" data-id="upgrade"><a href='../../biodb/html/ExtGenerator.html#method-ExtGenerator-upgrade'><code>biodb::ExtGenerator$upgrade()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ExtEntryClass-new"></a>}}
\if{latex}{\out{\hypertarget{method-ExtEntryClass-new}{}}}
\subsection{Method \code{new()}}{
Initializer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ExtEntryClass$new(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{See the constructor of ExtFileGenerator for the parameters.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-ExtEntryClass-clone"></a>}}
\if{latex}{\out{\hypertarget{method-ExtEntryClass-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ExtEntryClass$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
