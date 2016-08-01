#' findElementFromElement
#'
#' @param webElem
#'
#' @return
#' @export
#'
#' @examples

findElementFromElement <- function(webElem, using = c("xpath", "css selector", "id", "name", "tag name", "class name", "link text", "partial link text"), value, ...){

# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
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

# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  
obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
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
invisible(remDr)
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

obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/attribute/{{name}}", data = obj)
pathURL <- webElem[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementAttribute", json = NULL,...)
invisible(remDr)
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

obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/property/{{name}}", data = obj)
pathURL <- webElem[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementProperty", json = NULL,...)
invisible(remDr)
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

obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/css/{{property name}}", data = obj)
pathURL <- webElem[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getElementCssValue", json = NULL,...)
invisible(remDr)
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
invisible(remDr)
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
invisible(remDr)
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
invisible(remDr)
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
invisible(remDr)
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
  
obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/click", data = obj)
pathURL <- webElem[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClick", json = jsonBody,...)
invisible(remDr)
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
  
obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/clear", data = obj)
pathURL <- webElem[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClear", json = jsonBody,...)
invisible(remDr)
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
  
obj <- webElem
obj$sessionId <- webElem$sessionId()
obj$elementId <- webElem$elementId$ELEMENT
pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/value", data = obj)
pathURL <- webElem[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementSendKeys", json = jsonBody,...)
invisible(remDr)
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



