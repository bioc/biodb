% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/BiodbDbInfo.R
\name{BiodbDbInfo}
\alias{BiodbDbInfo}
\title{A class for describing the characteristics of a database.}
\description{
This class is used by \code{\link{BiodbDbsInfo}} for storing database
characteristics, and returning them through the \code{get()} method.
This class inherits from \code{\link{BiodbConnBase}}.
}
\examples{
# Create an instance with default settings:
mybiodb <- biodb::newInst()

# Get a BiodbDbInfo object for a database:
mybiodb$getDbsInfo()$get('comp.csv.file')

# Terminate instance.
mybiodb$terminate()

}
\seealso{
Parent class \code{\link{BiodbDbsInfo}} and super class
\code{\link{BiodbConnBase}}.
}
\section{Super class}{
\code{\link[biodb:BiodbConnBase]{biodb::BiodbConnBase}} -> \code{BiodbDbInfo}
}
\section{Methods}{
\subsection{Public methods}{
\itemize{
\item \href{#method-BiodbDbInfo-clone}{\code{BiodbDbInfo$clone()}}
}
}
\if{html}{\out{
<details><summary>Inherited methods</summary>
<ul>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getBaseUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getBaseUrl'><code>biodb::BiodbConnBase$getBaseUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getConnClass"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getConnClass'><code>biodb::BiodbConnBase$getConnClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getConnClassName"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getConnClassName'><code>biodb::BiodbConnBase$getConnClassName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getDbClass"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getDbClass'><code>biodb::BiodbConnBase$getDbClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryClass"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryClass'><code>biodb::BiodbConnBase$getEntryClass()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryClassName"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryClassName'><code>biodb::BiodbConnBase$getEntryClassName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryContentType"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryContentType'><code>biodb::BiodbConnBase$getEntryContentType()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryFileExt"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryFileExt'><code>biodb::BiodbConnBase$getEntryFileExt()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getEntryIdField"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getEntryIdField'><code>biodb::BiodbConnBase$getEntryIdField()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getName"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getName'><code>biodb::BiodbConnBase$getName()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getPropSlots"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getPropSlots'><code>biodb::BiodbConnBase$getPropSlots()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getPropValSlot"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getPropValSlot'><code>biodb::BiodbConnBase$getPropValSlot()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getPropertyValue"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getPropertyValue'><code>biodb::BiodbConnBase$getPropertyValue()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getSchedulerNParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getSchedulerNParam'><code>biodb::BiodbConnBase$getSchedulerNParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getSchedulerTParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getSchedulerTParam'><code>biodb::BiodbConnBase$getSchedulerTParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getToken"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getToken'><code>biodb::BiodbConnBase$getToken()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getUrl'><code>biodb::BiodbConnBase$getUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getUrls"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getUrls'><code>biodb::BiodbConnBase$getUrls()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getWsUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getWsUrl'><code>biodb::BiodbConnBase$getWsUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="getXmlNs"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-getXmlNs'><code>biodb::BiodbConnBase$getXmlNs()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="hasProp"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-hasProp'><code>biodb::BiodbConnBase$hasProp()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="hasPropSlot"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-hasPropSlot'><code>biodb::BiodbConnBase$hasPropSlot()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="initialize"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-initialize'><code>biodb::BiodbConnBase$initialize()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="isSlotProp"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-isSlotProp'><code>biodb::BiodbConnBase$isSlotProp()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="print"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-print'><code>biodb::BiodbConnBase$print()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="propExists"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-propExists'><code>biodb::BiodbConnBase$propExists()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setBaseUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setBaseUrl'><code>biodb::BiodbConnBase$setBaseUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setPropValSlot"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setPropValSlot'><code>biodb::BiodbConnBase$setPropValSlot()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setPropertyValue"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setPropertyValue'><code>biodb::BiodbConnBase$setPropertyValue()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setSchedulerNParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setSchedulerNParam'><code>biodb::BiodbConnBase$setSchedulerNParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setSchedulerTParam"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setSchedulerTParam'><code>biodb::BiodbConnBase$setSchedulerTParam()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setToken"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setToken'><code>biodb::BiodbConnBase$setToken()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setUrl'><code>biodb::BiodbConnBase$setUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="setWsUrl"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-setWsUrl'><code>biodb::BiodbConnBase$setWsUrl()</code></a></span></li>
<li><span class="pkg-link" data-pkg="biodb" data-topic="BiodbConnBase" data-id="updatePropertiesDefinition"><a href='../../biodb/html/BiodbConnBase.html#method-BiodbConnBase-updatePropertiesDefinition'><code>biodb::BiodbConnBase$updatePropertiesDefinition()</code></a></span></li>
</ul>
</details>
}}
\if{html}{\out{<hr>}}
\if{html}{\out{<a id="method-BiodbDbInfo-clone"></a>}}
\if{latex}{\out{\hypertarget{method-BiodbDbInfo-clone}{}}}
\subsection{Method \code{clone()}}{
The objects of this class are cloneable with this method.
\subsection{Usage}{
\if{html}{\out{<div class="r">}}\preformatted{BiodbDbInfo$clone(deep = FALSE)}\if{html}{\out{</div>}}
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
