#' remoteDr
#'
#' @return
#' @export
#'
#' @examples
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
  remServAdd[["path"]] <- path
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
      sessionId = function(){.e$sessionId}
    )
    , class = "rDriver")

  if(newSession){
    newSession(session)
  }
  invisible(session)
}

#' wbElement
#'
#' @param elementId
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples
#'

wbElement <- function(elementId, remDr){
  structure(
    list(
      sessionId = function(){.e$sessionId},
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

queryDriver <- function(verb = GET, url, source, ...){
  if(!identical(source, "newSession")){
    if(is.na(.e$sessionId)) stop("No session exists. Run remoteRd with newSession = TRUE or\n run newSession()")
  }
  res <- do.call(verb, c(list(url), body = list(...)[["json"]]))
  # Add error checking code here
  checkResponse(res)
  res <- content(res)
  .e$sessionId <- res$sessionId
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
  if(identical(res$status_code, 200L)) return()
  cat("Error detected:\n")
  cat("Response status code :", res$status_code, "\n")
  if(!is.null(content(res)$value$class)){
    cat("Selenium class exception:", content(res)$value$class,"\n")
  }
  cat("Please check the response with errorResponse()\n")
  cat("Please check the content returned with errorContent()\n")
  .e$errorResponse <- res
  .e$errorContent <- content(res)
  stop("Selenium Server error")
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
