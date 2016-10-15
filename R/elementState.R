
#' @rdname getElementAttribute
getElementAttribute <- function(webElem, attribute, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  obj$name <- attribute
  pT <-"/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getElementAttribute",
                     drvID = webElem$remDr$drvID,
                     json = NULL, ...)
  res$value
}



#' @rdname getElementCssValue
getElementCssValue <- function(webElem, propertyName, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  obj$propertyName <- propertyName
  pT <- "/session/{{sessionId}}/element/{{elementId}}/css/{{propertyName}}"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getElementCssValue",
                     drvID = webElem$remDr$drvID,
                     json = NULL, ...)
  res$value
}



#' @rdname getElementProperty
getElementProperty <- function(webElem, property, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  obj$name <- property
  pT <- "/session/{{sessionId}}/element/{{elementId}}/property/{{name}}"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getElementProperty",
                     drvID = webElem$remDr$drvID,
                     json = NULL, ...)
  res$value
}



#' @rdname getElementRect
getElementRect <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  pT <- "/session/{{sessionId}}/element/{{elementId}}/rect"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getElementRect",
                     drvID = webElem$remDr$drvID,
                     json = NULL, ...)
  res$value
}



#' @rdname getElementTagName
getElementTagName <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT

  pT <- "/session/{{sessionId}}/element/{{elementId}}/name"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getElementTagName",
                     drvID = webElem$remDr$drvID,
                     json = NULL, ...)
  res$value
}



#' @rdname getElementText
getElementText <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT

  pT <- "/session/{{sessionId}}/element/{{elementId}}/text"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getElementText",
                     drvID = webElem$remDr$drvID,
                     json = NULL, ...)
  res$value
}



#' @rdname isElementEnabled
isElementEnabled <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT

  pT <- "/session/{{sessionId}}/element/{{elementId}}/enabled"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "isElementEnabled",
                     drvID = webElem$remDr$drvID,
                     json = NULL,...)
  res$value
}



#' @rdname isElementSelected
isElementSelected <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT

  pT <- "/session/{{sessionId}}/element/{{elementId}}/selected"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "isElementSelected",
                     drvID = webElem$remDr$drvID,
                     json = NULL,...)
  res$value
}



