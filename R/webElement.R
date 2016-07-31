#' findElementFromElement
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

findElementFromElement <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/element", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/elements", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/selected", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/property/{{name}}", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/css/{{property name}}", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/text", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/name", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/rect", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/enabled", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/click", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/clear", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/value", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/screenshot", data = webElem)
  pathURL <- webElem[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
}



