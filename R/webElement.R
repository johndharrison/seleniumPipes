#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

findingElementsToInteract <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/element", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

findingElementsToInteract <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/elements", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

isElementSelected <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/selected", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementAttribute <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementProperty <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/property/{{name}}", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementCssValue <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/css/{{property name}}", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementText <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/text", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementTagName <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/name", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

getElementRect <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/rect", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

isElementEnabled <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/enabled", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

elementClick <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/click", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

elementClear <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/clear", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

elementSendKeys <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/value", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

takeElementScreenshot <- function(webElem, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/screenshot", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}



