#' newSession
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

newSession <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    desiredCapabilities =c(remDr$desiredCapabilities, remDr$extraCapabilities)
  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "newSession", json = jsonBody,...)
  invisible(remDr)
}


#' deleteSession
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

deleteSession <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "deleteSession", json = NULL,...)
  invisible(remDr)
}


#' go
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

go <- function(remDr, url, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(
     url = url
  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "go", json = jsonBody,...)
  invisible(remDr)
}


#' getCurrentUrl
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getCurrentUrl <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getCurrentUrl", json = NULL,...)
  invisible(remDr)
}


#' back
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

back <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- NULL
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/back", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "back", json = jsonBody,...)
  invisible(remDr)
}


#' forward
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

forward <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- NULL
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/forward", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "forward", json = jsonBody,...)
  invisible(remDr)
}


#' refresh
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

refresh <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- NULL
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/refresh", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "refresh", json = jsonBody,...)
  invisible(remDr)
}


#' getTitle
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getTitle <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/title", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getTitle", json = NULL,...)
  res$value
}


#' getWindowHandle
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowHandle <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandle", json = NULL,...)
  res$value
}


#' closeWindow
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

closeWindow <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "closeWindow", json = NULL,...)
  invisible(remDr)
}


#' switchToWindow
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToWindow <- function(remDr, name, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    name = name
  ), auto_unbox = TRUE)
    
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "switchToWindow", json = jsonBody,...)
  invisible(remDr)
}


#' getWindowHandles
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowHandles <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/handles", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandles", json = NULL,...)
  res$value
}


#' fullscreenWindow
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

fullscreenWindow <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/fullscreen", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "fullscreenWindow", json = jsonBody,...)
  invisible(remDr)
}


#' maximizeWindow
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

maximizeWindow <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/maximize", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "maximizeWindow", json = jsonBody,...)
  invisible(remDr)
}


#' setWindowSize
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

setWindowSize <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setWindowSize", json = jsonBody,...)
  invisible(remDr)
}


#' getWindowPosition
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowPosition <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowPosition", json = NULL,...)
  invisible(remDr)
}


#' setWindowPosition
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

setWindowPosition <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setWindowPosition", json = jsonBody,...)
  invisible(remDr)
}


#' getWindowSize
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowSize <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowSize", json = NULL,...)
  invisible(remDr)
}


#' switchToFrame
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToFrame <- function(remDr, Id = NULL, ...){
  
# Add function specific JSON to post
  if("webElement" %in% class(Id)){
    # pass the webElement as Json to SS
    Id <- setNames(as.character(Id$elementId), "ELEMENT")
  }
  jsonBody <- toJSON(list(
    id = Id
  ), auto_unbox = TRUE, null = "null")
    
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "switchToFrame", json = jsonBody,...)
  invisible(remDr)
}


#' switchToParentFrame
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToParentFrame <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame/parent", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "switchToParentFrame", json = jsonBody,...)
  invisible(remDr)
}


#' findElement
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

findElement <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElement", json = jsonBody,...)
  invisible(remDr)
}


#' findElements
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

findElements <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "findElements", json = jsonBody,...)
  invisible(remDr)
}


#' getActiveElement
#'
#' @param remDr
#'
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
  invisible(remDr)
}


#' getPageSource
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getPageSource <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/source", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getPageSource", json = NULL,...)
  read_html(res$value)
}


#' executeScript
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

executeScript <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/sync", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "executeScript", json = jsonBody,...)
  invisible(remDr)
}


#' executeAsyncScript
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

executeAsyncScript <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/async", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "executeAsyncScript", json = jsonBody,...)
  invisible(remDr)
}


#' getCookie
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getCookie <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getCookie", json = NULL,...)
  invisible(remDr)
}


#' addCookie
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

addCookie <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "addCookie", json = jsonBody,...)
  invisible(remDr)
}


#' deleteCookie
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

deleteCookie <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "deleteCookie", json = NULL,...)
  invisible(remDr)
}


#' deleteAllCookies
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

deleteAllCookies <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId)/cookie", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "deleteAllCookies", json = NULL,...)
  invisible(remDr)
}


#' setTimeout
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

setTimeout <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/timeouts", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setTimeout", json = jsonBody,...)
  invisible(remDr)
}


#' performActions
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

performActions <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "performActions", json = jsonBody,...)
  invisible(remDr)
}


#' releasingActions
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

releasingActions <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "releasingActions", json = NULL,...)
  invisible(remDr)
}


#' dismissAlert
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

dismissAlert <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "dismissAlert", json = jsonBody,...)
  invisible(remDr)
}


#' acceptAlert
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

acceptAlert <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "acceptAlert", json = jsonBody,...)
  invisible(remDr)
}


#' getAlertText
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getAlertText <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getAlertText", json = NULL,...)
  invisible(remDr)
}


#' sendAlertText
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

sendAlertText <- function(remDr, ...){
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "sendAlertText", json = jsonBody,...)
  invisible(remDr)
}


#' takeScreenshot
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

takeScreenshot <- function(remDr, ...){
  
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/screenshot", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "takeScreenshot", json = NULL,...)
  invisible(remDr)
}



