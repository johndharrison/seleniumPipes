#' newSession
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

newSession <- function(remDr, ...){
  pathTemplate <- whisker.render("/session", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = DELETE, url = build_url(pathURL), ...)
}


#' go
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

go <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/back", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/forward", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/refresh", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/title", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = DELETE, url = build_url(pathURL), ...)
}


#' switchToWindow
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToWindow <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/handles", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/fullscreen", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/maximize", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
}


#' switchToFrame
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToFrame <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame/parent", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/active", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/source", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/sync", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/async", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = DELETE, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId)/cookie", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = DELETE, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/timeouts", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = DELETE, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), ...)
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
  pathTemplate <- whisker.render("/session/{{sessionId}}/screenshot", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = GET, url = build_url(pathURL), ...)
}



