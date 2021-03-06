% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/cookies.R, R/cookiesDoc.R
\name{deleteAllCookies}
\alias{deleteAllCookies}
\title{Delete all the cookies.}
\usage{
deleteAllCookies(remDr, ...)
}
\arguments{
\item{remDr}{An object of class "rDriver". A remote driver object see
\code{\link{remoteDr}}.}

\item{...}{Additonal function arguments - Currently passes the
\code{\link{retry}} argument.}
}
\value{
invisible(remDr): An object of class "rDriver" is invisibly
   returned. A remote driver object see \code{\link{remoteDr}}. This
   allows for chaining from this function to other functions that take
   such an object as an argument. See examples for further details.
}
\description{
\code{deleteAllCookies} Delete all the cookies that are currently
   visible.
}
\examples{
\dontrun{
# assume a server is running at default location
remDr <- remoteDr()
remDr \%>\% go("https://www.google.com/ncr") \%>\%
  getTitle()
# get the cookies
remDr \%>\% getCookie()
# get a named cookie
remDr \%>\% getCookie("NID")
# add our own cookie
remDr \%>\% addCookie(name = "myCookie", value = "12")
# check its value
remDr \%>\% getCookie("myCookie")
# delete our cookie
remDr \%>\% deleteCookie("myCookie")
# check its deleted
remDr \%>\% getCookie("myCookie")

# delete all cookies
remDr \%>\% getCookie()
remDr \%>\% deleteAllCookies() \%>\%
  getCookie()

remDr \%>\% deleteSession()
}
}
\seealso{
Other cookies functions: \code{\link{addCookie}},
  \code{\link{deleteCookie}}, \code{\link{getAllCookies}},
  \code{\link{getNamedCookie}}
}

