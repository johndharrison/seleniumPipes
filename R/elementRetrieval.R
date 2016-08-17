
#' @rdname findElement
findElement <- function(remDr, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElement", drvID = remDr$drvID, json = jsonBody,...)
  invisible(wbElement(res$value, remDr))
}

#' @rdname findElementFromElement
findElementFromElement <- function(webElem, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/element", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElementFromElement", drvID = webElem$remDr$drvID, json = jsonBody,...)
  invisible(wbElement(res$value, webElem$remDr))
}



#' @rdname findElements
findElements <- function(remDr, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElements", drvID = remDr$drvID, json = jsonBody,...)
  invisible(lapply(res$value, wbElement, remDr = remDr))
}

#' @rdname findElementsFromElement
findElementsFromElement <- function(webElem, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/elements", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElementsFromElement", drvID = webElem$remDr$drvID, json = jsonBody,...)
  invisible(lapply(res$value, wbElement, remDr = webElem$remDr))
}



#' @rdname getActiveElement
getActiveElement <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/active", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getActiveElement", drvID = remDr$drvID, json = NULL,...)
  invisible(wbElement(res$value, remDr))
}

