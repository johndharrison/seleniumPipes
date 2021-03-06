% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/elementState.R, R/elementStateDoc.R
\name{getElementTagName}
\alias{getElementTagName}
\title{Query for an element's tag name.}
\usage{
getElementTagName(webElem, ...)
}
\arguments{
\item{webElem}{An object of class "wElement". A web Element object see
\code{\link{wbElement}}.}

\item{...}{Additonal function arguments - Currently passes the
\code{\link{retry}} argument.}
}
\value{
The element's tag name, as a lowercase character string.
}
\description{
\code{getElementTagName} Query for an element's tag name.
}
\examples{
\dontrun{
  remDr <- remoteDr()
  remDr \%>\% go("http://www.google.com/ncr")

  # select the search box
  searchElem <- remDr \%>\% findElement("name", "q")

  # get the name of our element
  searchElem \%>\% getElementAttribute("name")

  # get the css background-color
  searchElem \%>\% getElementCssValue("background-color")
  blueScript <- "arguments[0].style.backgroundColor = 'blue';"
  remDr \%>\% executeScript(blueScript, list(searchElem))
  searchElem \%>\% getElementCssValue("background-color")

  # get the javascript property
  # searchElem \%>\% getElementProperty("backgroundColor")

  # get dimensions
  searchElem \%>\% getElementRect

  searchElem \%>\% getElementTagName

  # get some text and return it
  remDr \%>\% go("http://r-project.org")
  remDr \%>\% findElement("css", "h1") \%>\% getElementText

  # close browser
  remDr \%>\% deleteSession
}

}
\seealso{
Other elementState functions: \code{\link{getElementAttribute}},
  \code{\link{getElementCssValue}},
  \code{\link{getElementProperty}},
  \code{\link{getElementRect}},
  \code{\link{getElementText}},
  \code{\link{isElementEnabled}},
  \code{\link{isElementSelected}}
}

