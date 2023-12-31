% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ExtGitignore.R
\name{ExtGitignore}
\alias{ExtGitignore}
\title{Extension Gitignore file class}
\description{
A class for generating the .gitignore file of an extension package.
}
\details{
This class can be used to generate a new .gitignore file or to keep one
up to date.
}
\examples{
# Generate a new package:
pkgFolder <- file.path(tempfile(), 'biodbFoo')
dir.create(pkgFolder, recursive=TRUE)
biodb::ExtGitignore$new(path=pkgFolder)$generate()

}
\section{Super classes}{
\code{\link[biodb:ExtGenerator]{biodb::ExtGenerator}} -> \code{\link[biodb:ExtFileGenerator]{biodb::ExtFileGenerator}} -> \code{ExtGitignore}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-ExtGitignore-new}{\code{ExtGitignore$new()}}
\item \href{#method-ExtGitignore-clone}{\code{ExtGitignore$clone()}}
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
\if{html}{\out{<a id="method-ExtGitignore-new"></a>}}
\if{latex}{\out{\hypertarget{method-ExtGitignore-new}{}}}
\subsection{Method \code{new()}}{
Initializer.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ExtGitignore$new(...)}\if{html}{\out{</div>}}
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
\if{html}{\out{<a id="method-ExtGitignore-clone"></a>}}
\if{latex}{\out{\hypertarget{method-ExtGitignore-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{ExtGitignore$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
