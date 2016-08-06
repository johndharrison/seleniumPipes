#' findElement
#'
#' @param remDr
#'
#' @family elementRetrieval functions
#' @return
#' @export
#'
#' @examples

findElement <- function(remDr, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElement", json = jsonBody,...)
  invisible(wbElement(res$value, remDr))
}


#' findElementFromElement
#'
#' @param webElem
#'
#' @family elementRetrieval functions
#' @return
#' @export
#'
#' @examples

findElementFromElement <- function(webElem, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/element", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElementFromElement", json = jsonBody,...)
  invisible(wbElement(res$value, remDr))
}


#' findElements
#'
#' @param remDr
#'
#' @family elementRetrieval functions
#' @return
#' @export
#'
#' @examples

findElements <- function(remDr, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElements", json = jsonBody,...)
  invisible(lapply(res$value, wbElement, remDr = remDr))
}


#' findElementsFromElement
#'
#' @param webElem
#'
#' @family elementRetrieval functions
#' @return
#' @export
#'
#' @examples

findElementsFromElement <- function(webElem, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/elements", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElementsFromElement", json = jsonBody,...)
  invisible(lapply(res$value, wbElement, remDr = remDr))
}


#' getActiveElement
#'
#' @param remDr
#'
#' @family elementRetrieval functions
#' @return
#' @export
#'
#' @examples

getActiveElement <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/active", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getActiveElement", json = NULL,...)
  invisible(wbElement(res$value, remDr))
}



