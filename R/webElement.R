#' findElementFromElement
#'
#' @param webElem
#'
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


#' findElementsFromElement
#'
#' @param webElem
#'
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


#' isElementSelected
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

isElementSelected <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/selected", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "isElementSelected", json = NULL,...)
  res$value
}


#' getElementAttribute
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementAttribute <- function(webElem, attribute,  ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  obj$name <- attribute
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementAttribute", json = NULL,...)
  res$value
}


#' getElementProperty
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementProperty <- function(webElem, property,  ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  obj$name <- property
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/property/{{name}}", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementProperty", json = NULL,...)
  res$value
}


#' getElementCssValue
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementCssValue <- function(webElem, propertyName,  ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  obj$propertyName <- propertyName
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/css/{{propertyName}}", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementCssValue", json = NULL,...)
  res$value
}


#' getElementText
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementText <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/text", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementText", json = NULL,...)
  res$value
}


#' getElementTagName
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementTagName <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/name", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementTagName", json = NULL,...)
  res$value
}


#' getElementRect
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementRect <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/rect", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementRect", json = NULL,...)
  res$value
}


#' isElementEnabled
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

isElementEnabled <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/enabled", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "isElementEnabled", json = NULL,...)
  res$value
}


#' elementClick
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

elementClick <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/click", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClick", json = jsonBody,...)
  invisible(wbElement(res$value, remDr))
}


#' elementClear
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

elementClear <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/clear", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClear", json = jsonBody,...)
  invisible(wbElement(res$value, remDr))
}


#' elementSendKeys
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

elementSendKeys <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  sendKeys <- list(...)
      jsonBody <- toJSON(list(value = matchSelKeys(sendKeys)), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/value", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementSendKeys", json = jsonBody,...)
  invisible(wbElement(res$value, remDr))
}


#' takeElementScreenshot
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

takeElementScreenshot <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId()
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/screenshot", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "takeElementScreenshot", json = NULL,...)
  invisible(remDr)
}



