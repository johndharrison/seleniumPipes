#' Start a selenium server and browser
#'
#' @param port Port to run on
#' @param browser Which browser to start
#' @param version what version of Selenium Server to run. Default = "latest"
#'     which runs the most recent version. To see other version currently
#'     sourced run binman::list_versions("seleniumserver")
#' @param chromever what version of Chrome driver to run. Default = "latest"
#'     which runs the most recent version. To see other version currently
#'     sourced run binman::list_versions("chromedriver"), A value of NULL
#'     excludes adding the chrome browser to Selenium Server.
#' @param geckover what version of Gecko driver to run. Default = "latest"
#'     which runs the most recent version. To see other version currently
#'     sourced run binman::list_versions("geckodriver"), A value of NULL
#'     excludes adding the firefox browser to Selenium Server.
#' @param phantomver what version of PhantomJS to run. Default = "2.1.1"
#'     which runs the most recent stable version. To see other version currently
#'     sourced run binman::list_versions("phantomjs"), A value of NULL
#'     excludes adding the PhantomJS headless browser to Selenium Server.
#' @param iedrver what version of IEDriverServer to run. Default = "latest"
#'     which runs the most recent version. To see other version currently
#'     sourced run binman::list_versions("iedriverserver"), A value of NULL
#'     excludes adding the internet explorer browser to Selenium Server.
#'     NOTE this functionality is Windows OS only.
#' @param verbose If TRUE, include status messages (if any)
#' @param check If TRUE check the versions of selenium available and the
#'    versions of associated drivers (chromever, geckover, phantomver,
#'    iedrver). If new versions are available they will be downloaded.
#' @param ... Additional arguments to pass to \code{\link{remoteDr}}
#'
#' @return A list containing a server and a client. The server is the object
#' returned by \code{\link[wdman]{selenium}} and the client is an object of class
#' \code{\link{remoteDriver}}
#' @details This function is a wrapper around \code{\link[wdman]{selenium}}.
#'     It provides a "shim" for the current issue running firefox on
#'     Windows. For a more detailed set of functions for running binaries
#'     relating to the Selenium/webdriver project see the
#'     \code{\link[wdman]{wdman}} package. Both the client and server
#'     are closed using a registered finalizer.
#' @export
#' @importFrom wdman selenium
#'
#' @examples
#' \dontrun{
#' # start a chrome browser
#' sp <- spDriver()
#' remDr <- sp[["client"]]
#' remDr %>% go("http://www.google.com/ncr")
#' remDr %>% go("http://www.bbc.com")
#' remDr %>% deleteSession()
#' # stop the selenium server
#' sp[["server"]]$stop()
#'
#' # if user forgets to stop server it will be garbage collected.
#' sp <- spDriver()
#' rm(sp)
#' gc(sp)
#' }

spDriver <- function(port = 4567L,
                     browser = c("chrome", "firefox", "phantomjs",
                                 "internet explorer"),
                     version = "latest",
                     chromever = "latest",
                     geckover = "latest",
                     iedrver = NULL,
                     phantomver = "2.1.1",
                     verbose = TRUE,
                     check = TRUE, ...){
  selServ <- wdman::selenium(port = port, verbose = verbose,
                             version = version,
                             chromever = chromever,
                             geckover = geckover,
                             iedrver = iedrver,
                             phantomver = phantomver,
                             check = TRUE)
  browser <- match.arg(browser)
  remDr <- remoteDr(browserName = browser, port = port, newSession = FALSE,
                    ...)
  if(identical(browser, "internet explorer")){
    selServ$stop()
    stop("Internet Explorer is only available on Windows.")
  }
  # check server status
  res <- suppressMessages({
      tryCatch({remDr %>% status(list(noTry = 4, delay = 1000))},
               error = function(e){e})
    })
  if(inherits(res, "error")){
    warning("Cannot determine Selenium Server status")
  }
  remDr %>% newSession()
  csEnv <- new.env()
  csEnv[["server"]] <- selServ
  csEnv[["client"]] <- remDr
  clean <- function(e){
    chk <- suppressMessages(
      tryCatch({e[["client"]]$close()}, error = function(e)e)
    )
    e[["server"]]$stop()
  }
  reg.finalizer(csEnv, clean)
  class(csEnv) <- c("spClientServer", class(csEnv))
  return(csEnv)
}
