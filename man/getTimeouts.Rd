% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sessions.R, R/sessionsDoc.R
\name{getTimeouts}
\alias{getTimeouts}
\title{Get amount of time that a particular type of operation can execute in.}
\usage{
getTimeouts(remDr, type = "page load", ...)
}
\arguments{
\item{remDr}{An object of class "rDriver". A remote driver object see
\code{\link{remoteDr}}.}

\item{type}{The type of operation to set the timeout for. Valid values
are: "script" for script timeouts, "implicit" for modifying the
implicit wait timeout and "page load" for setting a page load
timeout.}

\item{...}{Additonal function arguments - Currently passes the
\code{\link{retry}} argument.}
}
\value{
ret2 : res$value NEED TO FILL IN specifics for each function
}
\description{
\code{getTimeouts} The Get Timeout command gets timeouts associated with
   the current session.
}
\examples{
\dontrun{
  # start a driver without opening a browser
  remDr <- remoteDr(newSession = FALSE)

  # open a broswer
  remDr \%>\% newSession

  # set timeout on waiting for elements
  remDr \%>\% setTimeout(type = "implicit", 5000)

  # close Session
  remDr \%>\% deleteSession

}

}
\seealso{
Other sessions functions: \code{\link{deleteSession}},
  \code{\link{newSession}}, \code{\link{setTimeouts}},
  \code{\link{status}}
}

