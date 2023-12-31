% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/CompCsvFileEntry.R
\name{CompCsvFileEntry}
\alias{CompCsvFileEntry}
\title{Compound CSV File entry class.}
\description{
Compound CSV File entry class.

Compound CSV File entry class.
}
\details{
This is the entry class for Compound CSV file databases.
}
\examples{
# Create an instance with default settings:
mybiodb <- biodb::newInst()

# Get a connector that inherits from CsvFileConn:
chebi_file <- system.file("extdata", "chebi_extract.tsv", package="biodb")
conn <- mybiodb$getFactory()$createConn('comp.csv.file', url=chebi_file)

# Get an entry
e <- conn$getEntry('')

# Terminate instance.
mybiodb$terminate()

}
\seealso{
Super class \code{\link{BiodbCsvEntry}}.
}
\section{Super classes}{
\code{\link[biodb:BiodbEntry]{biodb::BiodbEntry}} -> \code{\link[biodb:BiodbCsvEntry]{biodb::BiodbCsvEntry}} -> \code{CompCsvFileEntry}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-CompCsvFileEntry-new}{\code{CompCsvFileEntry$new()}}
\item \href{#method-CompCsvFileEntry-clone}{\code{CompCsvFileEntry$clone()}}
}
}
\if{html}{\out{
<details><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="appendFieldValue"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-appendFieldValue'><code>biodb::BiodbEntry$appendFieldValue()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="cloneInstance"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-cloneInstance'><code>biodb::BiodbEntry$cloneInstance()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="computeFields"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-computeFields'><code>biodb::BiodbEntry$computeFields()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="fieldHasBasicClass"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-fieldHasBasicClass'><code>biodb::BiodbEntry$fieldHasBasicClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getBiodb"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getBiodb'><code>biodb::BiodbEntry$getBiodb()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getDbClass"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getDbClass'><code>biodb::BiodbEntry$getDbClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getField"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getField'><code>biodb::BiodbEntry$getField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldCardinality"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldCardinality'><code>biodb::BiodbEntry$getFieldCardinality()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldClass"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldClass'><code>biodb::BiodbEntry$getFieldClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldDef"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldDef'><code>biodb::BiodbEntry$getFieldDef()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldNames"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldNames'><code>biodb::BiodbEntry$getFieldNames()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldValue"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldValue'><code>biodb::BiodbEntry$getFieldValue()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldsAsDataframe"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldsAsDataframe'><code>biodb::BiodbEntry$getFieldsAsDataframe()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldsAsJson"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldsAsJson'><code>biodb::BiodbEntry$getFieldsAsJson()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getFieldsByType"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getFieldsByType'><code>biodb::BiodbEntry$getFieldsByType()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getId"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getId'><code>biodb::BiodbEntry$getId()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getName"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getName'><code>biodb::BiodbEntry$getName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="getParent"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-getParent'><code>biodb::BiodbEntry$getParent()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="hasField"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-hasField'><code>biodb::BiodbEntry$hasField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="isNew"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-isNew'><code>biodb::BiodbEntry$isNew()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="makesRefToEntry"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-makesRefToEntry'><code>biodb::BiodbEntry$makesRefToEntry()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="parentIsAConnector"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-parentIsAConnector'><code>biodb::BiodbEntry$parentIsAConnector()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="parseContent"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-parseContent'><code>biodb::BiodbEntry$parseContent()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="print"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-print'><code>biodb::BiodbEntry$print()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="removeField"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-removeField'><code>biodb::BiodbEntry$removeField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="setField"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-setField'><code>biodb::BiodbEntry$setField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbEntry" data-id="setFieldValue"><a href='../../biodb/html/BiodbEntry.html#method-BiodbEntry-setFieldValue'><code>biodb::BiodbEntry$setFieldValue()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-CompCsvFileEntry-new"></a>}}
\if{latex}{\out{\hypertarget{method-CompCsvFileEntry-new}{}}}
\subsection{Method \code{new()}}{
New instance initializer. Entry objects must not be created directly.
Instead, they are retrieved through the connector instances.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{CompCsvFileEntry$new(...)}\if{html}{\out{</div>}}
}

\subsection{Arguments}{
\if{html}{\out{<div class="arguments">}}
\describe{
\item{\code{...}}{All parameters are passed to the super class initializer.}
}
\if{html}{\out{</div>}}
}
\subsection{Returns}{
Nothing.
}
}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-CompCsvFileEntry-clone"></a>}}
\if{latex}{\out{\hypertarget{method-CompCsvFileEntry-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{CompCsvFileEntry$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
