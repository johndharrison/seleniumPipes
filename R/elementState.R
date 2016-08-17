
#' @rdname getElementAttribute
getElementAttribute <- function(webElem, attribute, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  obj$name <- attribute
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementAttribute", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname getElementCssValue
getElementCssValue <- function(webElem, propertyName, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  obj$propertyName <- propertyName
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/css/{{propertyName}}", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementCssValue", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname getElementProperty
getElementProperty <- function(webElem, property, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  obj$name <- property
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/property/{{name}}", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementProperty", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname getElementRect
getElementRect <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/rect", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementRect", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname getElementTagName
getElementTagName <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/name", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementTagName", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname getElementText
getElementText <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/text", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementText", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname isElementEnabled
isElementEnabled <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/enabled", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "isElementEnabled", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



#' @rdname isElementSelected
isElementSelected <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/selected", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "isElementSelected", drvID = webElem$remDr$drvID, json = NULL,...)
  res$value
}



