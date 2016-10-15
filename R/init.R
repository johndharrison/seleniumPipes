#' @importFrom  httr parse_url
#' @importFrom  httr build_url
#' @importFrom  httr GET
#' @importFrom  httr POST
#' @importFrom  httr DELETE
#' @importFrom  httr content
#' @importFrom  httr message_for_status
#' @importFrom  xml2 read_html
#' @importFrom  jsonlite toJSON
#' @importFrom  jsonlite fromJSON
#' @importFrom  jsonlite base64_dec
#' @importFrom  magrittr %>%
#' @importFrom  whisker whisker.render
NULL

#' Create a remote driver
#'
#' \code{remoteDr}: Create a remote Driver object
#' @param remoteServerAddr Object of class \code{"character"}, giving the
#'    ip of the remote server. Defaults to localhost
#' @param port Object of class \code{"integer"}, the port of the remote
#'    server on which to connect
#' @param browserName Object of class \code{"character"}. The name of the
#'    browser being used; choices include
#'    {chrome|firefox|internet explorer|iphone}. Defaults to firefox.
#' @param version Object of class \code{"character"}. The browser version,
#'    or the empty string if unknown.
#' @param platform Object of class \code{"character"}. A key specifying
#'    which platform the browser is running on. This value should be one
#'    of {WINDOWS|XP|VISTA|MAC|LINUX|UNIX}. When requesting a new session,
#'    the client may specify "ANY" to indicate any available platform may
#'    be used.
#' @param javascript Object of class \code{"logical"}. Whether the session
#'    supports executing user supplied JavaScript in the context of the
#'    current page.
#' @param nativeEvents Object of class \code{"logical"}. Whether the
#'    session supports native events. n WebDriver advanced user
#'    interactions are provided by either simulating the Javascript events
#'    directly (i.e. synthetic events) or by letting the browser generate
#'    the Javascript events (i.e. native events). Native events simulate
#'    the user interactions better.
#' @param extraCapabilities A list containing any os/platform/driver
#'    specific arguments.
#' @param path Path on the server side to issue webdriver calls to.
#'    Normally use the default value.
#' @param newSession Logical value whether to start an instance of the
#'    browser. If TRUE a browser will be opened using
#'    \code{\link{newSession}}
#' @param ... Pass addional arguments to newSession. Currently used to
#'    pass \code{\link{retry}}
#' @return An object of class "rDriver" is returned. This is a remote
#'    Driver object that is used in many of the remote driver specific
#'    functions. Many functions that take a remote driver object as input
#'    also return the remote driver object. This allows chaining of
#'    commands. See the examples for chaining in action.
#' @export
#'
#' @examples
#' \dontrun{
#' # assume a server is available at the default location.
#' remDr <- remoteDr()
#' remDR %>% go("http://www.google.com") %>%
#'  findElement("name", "q") %>%
#'  elementSendKeys("R project", key = "enter")
#' # close our browser
#' remDr %>% deleteSession
#' }
#'

remoteDr <- function(remoteServerAddr = "http://localhost",
                     port             = 4444L,
                     browserName      = "firefox",
                     version          = "",
                     platform         = "ANY",
                     javascript       = TRUE,
                     nativeEvents     = TRUE,
                     extraCapabilities = list(),
                     path = "wd/hub",
                     newSession = TRUE,
                     ...
                     ){
  remServAdd <- parse_url(remoteServerAddr)
  remServAdd[["port"]] <- port
  remServAdd[["path"]] <- if(identical(remServAdd[["path"]], "")){
    path
  }else{
    file.path(remServAdd[["path"]], path)
  }
  if(is.null(remServAdd[["scheme"]])){
    remServAdd[["scheme"]] <- "http"
  }
  session <- structure(
    list(
      remServAdd = remServAdd,
      desiredCapabilities = list(
        browserName = browserName,
        version = version,
        javascriptEnabled = javascript,
        platform = platform,
        nativeEvents = nativeEvents
      ),
      extraCapabilities = extraCapabilities,
      sessionId = function(drvID){.e$sessionId[[drvID]]},
      sessionInfo = NULL,
      drvID = {
        chk <- FALSE
        while(!chk){
          proID <- make.names(tempfile("",""))
          if(!proID %in% names(.e$sessionId)) chk <- TRUE
        }
        proID
      }
    )
    , class = "rDriver")

  if(newSession){
    session <- newSession(session, ...)
  }
  invisible(session)
}

#' Create a Web Element
#'
#' \code{wbElement} Create a Web Element object of class "wElement"
#'
#' @param elementId This is a string returned by the web driver that
#'    identifies the web element.
#' @template remDr
#'
#' @return An object of class "wElement" is returned. This is a web
#'    element object that is used in many of the web Element specific
#'    functions. Many functions that take a web Element object as input
#'    also return the web Element object. This allows chaining of
#'    commands. See the examples for chaining in action.

#' @export
#'
#' @examples \dontrun{
#' remDr <- remoteDr()
#' webElem <- remDR %>% go("http://www.google.com") %>%
#'  findElement("name", "q")
#' # print the webElement
#' webElem
#'
#' # send keys to the web Element
#' webElem %>%  elementSendKeys("R project", key = "enter")
#'
#' # close browser
#' remDr %>% deleteSession()
#' }

wbElement <- function(elementId, remDr){
  structure(
    list(
      sessionId = function(drvID){.e$sessionId[[drvID]]},
      elementId = elementId,
      remDr = remDr
    )
    ,  class = "wElement")
}

#' Send a query to remote Driver.
#'
#' \code{queryDriver} A function to send a query to a remote driver.
#' Intended for seleniumPipes internal use mainly.
#' @param verb The http method to use. See \code{\link{VERB}}
#' @param url The url of the remote server endpoint.
#' @param source The name of the seleniumPipes function that called
#'    queryDriver.
#' @param drvID The driver id of the session as given by an object of
#'    class "remoteDr"
#' @param ... additonal arguments
#'
#' @return The contents of the response from the remote server. See
#'    \code{\link{content}} for details.
#' @export
#'
#' @examples \dontrun{
#' # internal method
#' }
#'

queryDriver <- function(verb = GET, url, source, drvID, ...){
  if(!identical(source, "newSession")){
    if(is.null(.e$sessionId[[drvID]])){
      message("Driver id is not registered. Has the session been deleted?")
      message("Alternatively no session exists:
              \tRun remoteRd with newSession = TRUE or
              \trun newSession()")
      stop("sessionId error")
    }
  }
  # Add error checking code here
  vArg <- c(list(url), body = list(...)[["json"]])
  noTry <- getOption("seleniumPipes_no_try")
  delay <- getOption("seleniumPipes_no_try_delay")
  if(!is.null(rtry <- list(...)[["retry"]])){
    if(is.logical(rtry)){
      if(!rtry){
        noTry <- 1L
        delay <- 100L
      }
    }
    if(is.list(rtry)){
      noTry <- ifelse(is.null(rtry$noTry),
                      getOption("seleniumPipes_no_try"),
                      as.integer(rtry$noTry))
      delay <- ifelse(is.null(rtry$delay),
                      getOption("seleniumPipes_no_try_delay"),
                      as.integer(rtry$delay))
    }
  }

  res <- retry(func = checkResponse, v = verb, vArg, source,
               noTry = noTry, delay = delay)
  res <- content(res)
  .e$sessionId[[drvID]] <- res$sessionId
  res
}

#' Check the response from remote server
#'
#' \code{checkResponse} checks the response from a remote web driver and
#'    checks against known errors. uses statusCodes in sysdata.rda see
#'    seleniumPipes:::statusCodes
#'
#' @param response The value returned by a http method from httr see
#'    \code{\link{VERB}}
#'
#' @return Stops with appropriate error if any found. On error
#'    \code{\link{errorResponse}} and \code{\link{errorContent}} may
#'    provide additional detail.
#' @export
#'
#' @examples \dontrun{
#' # internal method
#' }
#'

checkResponse <- function(response){
  if(identical(response$status_code, 200L) &&
     identical(content(response)$status, 0L)) return()
  errFunc <- function(){
    message("Error detected:")
    message("Response status code : ", response$status_code)
    errTest <- tryCatch(content(response, encoding = "UTF-8")$value,
                        error = function(e)e
    )
    errTest <- inherits(errTest, "error")
    if(!errTest){
      if(!is.null(content(response)$value$class)){
        message("Selenium class exception: ",
                content(response)$value$class)
      }
      if(!is.null(content(response)$status)){
        scDetail <-
          statusCodes[statusCodes$Code == content(response)$status,]
        message("Selenium Status code: ", scDetail$Code)
        message("Selenium Status summary: ", scDetail$Summary)
        message("Selenium Status detail: ", scDetail$Detail)
      }
      if(!is.null(content(response)$value$message)){
        messageDetail <- content(response)$value$message
        message("Selenium message: ", messageDetail)
      }
    }else{
      message("Response message:")
      message_for_status(response)
    }
    message("Please check the response with errorResponse()")
    message("Please check the content returned with errorContent()")
    .e$errorResponse <- response
    .e$errorContent <- content(response)
    stop("Selenium Server error", call. = FALSE)
  }
  structure(list(err = errFunc), class = "checkResponse")
}

#' Return the response from remote webdriver
#'
#'\code{errorResponse} returns the response from the remote webdriver on
#'    an error.
#' @return returns response see \code{\link{VERB}}. Headers, request etc.
#'    can be examined from this object.
#' @export
#'
#' @examples \dontrun{
#' remDr <- remoteDr()
#' remDr %>% findElement("name", "sdofnsdofk")
#' errorResponse()
#' }

errorResponse <- function(){
  .e$errorResponse
}

#' Returns the content from remote webdriver
#'
#'\code{errorContent} returns the content from the remote webdriver on an
#'    error.
#' @return returns content see \code{\link{content}}
#' @export
#'
#' @examples \dontrun{
#' remDr <- remoteDr()
#' remDr %>% findElement("name", "sdofnsdofk")
#' errorContent()
#' }

errorContent <- function(){
  .e$errorContent
}

retry <- function(func, v, vArg, source,
                  noTry = getOption("seleniumPipes_no_try"),
                  delay = getOption("seleniumPipes_no_try_delay")){
  tryNo <- 1L
  while(!tryNo > noTry){
    tst <- tryCatch({func(res <- do.call(v, vArg))},
                    error = function(e)e
    )

    if(inherits(tst, "checkResponse")){
      message("Called ",source, " - Try no: ", tryNo, " of ", noTry)
      if(!identical(tryNo, noTry)){Sys.sleep(delay/1000)}
      tryNo <- tryNo + 1
    }else{
      tryNo <- noTry + 1
    }
  }
  if(inherits(func(res), "checkResponse")){
    func(res)$err()
  }else{
    res
  }
}

