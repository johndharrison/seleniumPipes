#' @importFrom  httr parse_url
#' @importFrom  httr build_url
#' @importFrom  httr GET
#' @importFrom  httr POST
#' @importFrom  httr DELETE
#' @importFrom  httr content
#' @importFrom  xml2 read_html
#' @importFrom  jsonlite toJSON
#' @importFrom  jsonlite fromJSON
#' @importFrom  whisker whisker.render
NULL

#' Create a remote driver
#'
#' \code{remoteDr}: Create a remote Driver object
#' @param remoteServerAddr Object of class \code{"character"}, giving the ip of the remote server.
#'    Defaults to localhost
#' @param port Object of class \code{"integer"}, the port of the remote server on which to connect
#' @param browserName Object of class \code{"character"}. The name of the browser being used;
#'    choices include {chrome|firefox|internet explorer|iphone|htmlunit}. Defaults to firefox.
#' @param version Object of class \code{"character"}. The browser version, or the empty string if unknown.
#' @param platform Object of class \code{"character"}. A key specifying which platform the browser is running on. This value should be one of {WINDOWS|XP|VISTA|MAC|LINUX|UNIX}. When requesting a new session,
#'    the client may specify "ANY" to indicate any available platform may be used.
#' @param javascript Object of class \code{"logical"}. Whether the session supports executing user supplied JavaScript in the context of the current page.
#' @param nativeEvents Object of class \code{"logical"}. Whether the session supports native events. n WebDriver advanced user interactions are provided by either simulating the Javascript events directly (i.e. synthetic events) or by letting the browser generate the Javascript events (i.e. native events).
#'    Native events simulate the user interactions better.
#' @param extraCapabilities A list containing any os/platform/driver specific arguments.
#' @param path Path on the server side to issue webdriver calls to. Normally use the default value.
#' @param newSession Logical value whether to start an instance of the browser. If TRUE a browser will be opened using \code{\link{newSession}}
#' @return An object of class "rDriver" is returned. This is a remote Driver object that is used
#'    in many of the remote driver specific functions. Many functions that take a remote driver object as
#'    input also return the remote driver object. This allows chaining of commands. See the examples for chaining in action.
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
                     path = "wd/hub"
                     , newSession = TRUE){
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
        browserName = browserName
        , version = version
        , javascriptEnabled = javascript
        , platform = platform
        , nativeEvents = nativeEvents),
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
    session <- newSession(session)
  }
  invisible(session)
}

#' Create a Web Element
#'
#' \code{wbElement} Create a Web Element object of class "wElement"
#'
#' @param elementId This is a string returned by the web driver that identifies the web element.
#' @template remDr
#'
#' @return An object of class "wElement" is returned. This is a web element object that is used
#'    in many of the web Element specific functions. Many functions that take a web Element object as
#'    input also return the web Element object. This allows chaining of commands. See the examples for chaining in action.

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

#' queryDriver
#'
#' @param verb
#' @param url
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#'

queryDriver <- function(verb = GET, url, source, drvID, ...){
  if(!identical(source, "newSession")){
    if(is.null(.e$sessionId[[drvID]])){
      cat("\nDriver id is not registered. Has the session been deleted?\n")
      cat("Alternatively no session exists:\n\tRun remoteRd with newSession = TRUE or\n\trun newSession()")
      stop("sessionId error")
    }
  }
  res <- do.call(verb, c(list(url), body = list(...)[["json"]]))
  # Add error checking code here
  checkResponse(res)
  res <- content(res)
  .e$sessionId[[drvID]] <- res$sessionId
  res
}

#' Title
#'
#' @param response
#'
#' @return
#' @export
#'
#' @examples

checkResponse <- function(response){
  statusCodes <- structure(list(Code = c(0L, 6L, 7L, 8L, 9L, 10L, 11L, 12L, 13L,
                                          15L, 17L, 19L, 21L, 23L, 24L, 25L, 26L, 27L, 28L, 29L, 30L, 31L,
                                          32L, 33L, 34L)
                                 , Summary = c("Success",
                                               "NoSuchDriver", "NoSuchElement", "NoSuchFrame", "UnknownCommand",
                                               "StaleElementReference", "ElementNotVisible", "InvalidElementState",
                                               "UnknownError", "ElementIsNotSelectable", "JavaScriptError",
                                               "XPathLookupError", "Timeout", "NoSuchWindow", "InvalidCookieDomain",
                                               "UnableToSetCookie", "UnexpectedAlertOpen", "NoAlertOpenError",
                                               "ScriptTimeout", "InvalidElementCoordinates", "IMENotAvailable",
                                               "IMEEngineActivationFailed", "InvalidSelector", "SessionNotCreatedException",
                                               "MoveTargetOutOfBounds")
                                 , Detail = c("The command executed successfully.",
                                              "A session is either terminated or not started", "An element could not be located on the page using the given search parameters.",
                                              "A request to switch to a frame could not be satisfied because the frame could not be found.",
                                              "The requested resource could not be found, or a request was received using an HTTP method that is not supported by the mapped resource.",
                                              "An element command failed because the referenced element is no longer attached to the DOM.",
                                              "An element command could not be completed because the element is not visible on the page.",
                                              "An element command could not be completed because the element is in an invalid state (e.g. attempting to click a disabled element).",
                                              "An unknown server-side error occurred while processing the command.",
                                              "An attempt was made to select an element that cannot be selected.",
                                              "An error occurred while executing user supplied JavaScript.",
                                              "An error occurred while searching for an element by XPath.",
                                              "An operation did not complete before its timeout expired.",
                                              "A request to switch to a different window could not be satisfied because the window could not be found.",
                                              "An illegal attempt was made to set a cookie under a different domain than the current page.",
                                              "A request to set a cookie's value could not be satisfied.",
                                              "A modal dialog was open, blocking this operation", "An attempt was made to operate on a modal dialog when one was not open.",
                                              "A script did not complete before its timeout expired.", "The coordinates provided to an interactions operation are invalid.",
                                              "IME was not available.", "An IME engine could not be started.",
                                              "Argument was an invalid selector (e.g. XPath/CSS).", "A new session could not be created.",
                                              "Target provided for a move action is out of bounds."))
                            , .Names = c("Code", "Summary", "Detail")
                            , row.names = c(NA, -25L)
                            , class = "data.frame")
  if(identical(response$status_code, 200L) && identical(content(response)$status, 0L)) return()
  cat("Error detected:\n")
  cat("Response status code :", response$status_code, "\n")
  errTest <- tryCatch(content(response, encoding = "UTF-8")$value, error = function(e)e)
  errTest <- inherits(errTest, "error")
  if(!errTest){
    if(!is.null(content(response)$value$class)){
      cat("Selenium class exception:", content(response)$value$class,"\n")
    }
    if(!is.null(content(response)$status)){
      scDetail <- statusCodes[statusCodes$Code == content(response)$status,]
      cat("Selenium Status code: ", scDetail$Code, "\n")
      cat("Selenium Status summary: ", scDetail$Summary, "\n")
      cat("Selenium Status detail: ", scDetail$Detail, "\n")
    }
    if(!is.null(content(response)$value$message)){
      messageDetail <- content(response)$value$message
      cat("Selenium message: ", messageDetail, "\n")
    }
  }else{
    cat("Response message:", content(response, encoding = "UTF-8"), "\n")
  }
  cat("Please check the response with errorResponse()\n")
  cat("Please check the content returned with errorContent()\n")
  .e$errorResponse <- response
  .e$errorContent <- content(response)
  stop("Selenium Server error", call. = FALSE)
}

#' Title
#'
#' @return
#' @export
#'
#' @examples

errorResponse <- function(){
  .e$errorResponse
}

#' Title
#'
#' @return
#' @export
#'
#' @examples

errorContent <- function(){
  .e$errorContent
}
