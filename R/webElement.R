#' findElementFromElement
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

findElementFromElement <- function(webElem, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/element", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElementFromElement", json = jsonBody,...)
  invisible(res)
}


#' findElementsFromElement
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

findElementsFromElement <- function(webElem, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/elements", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElementsFromElement", json = jsonBody,...)
  invisible(res)
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
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/selected", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "isElementSelected", json = NULL,...)
  invisible(res)
}


#' getElementAttribute
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementAttribute <- function(webElem, ...){
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementAttribute", json = NULL,...)
  invisible(res)
}


#' getElementProperty
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementProperty <- function(webElem, ...){
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/property/{{name}}", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementProperty", json = NULL,...)
  invisible(res)
}


#' getElementCssValue
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementCssValue <- function(webElem, ...){
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/css/{{property name}}", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementCssValue", json = NULL,...)
  invisible(res)
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
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/text", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementText", json = NULL,...)
  invisible(res)
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
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/name", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementTagName", json = NULL,...)
  invisible(res)
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
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/rect", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementRect", json = NULL,...)
  invisible(res)
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
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/enabled", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "isElementEnabled", json = NULL,...)
  invisible(res)
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
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/click", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClick", json = jsonBody,...)
  invisible(res)
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
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/clear", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClear", json = jsonBody,...)
  invisible(res)
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
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/value", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementSendKeys", json = jsonBody,...)
  invisible(res)
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
  
  webElem$sessionId <- webElem$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/screenshot", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "takeElementScreenshot", json = NULL,...)
  invisible(res)
}



