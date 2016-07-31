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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/back", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/forward", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/refresh", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/title", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/handles", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/fullscreen", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/maximize", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame/parent", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/active", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/source", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/sync", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/async", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId)/cookie", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/timeouts", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
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
  
  remDr$sessionId <- remDr$sessionId()
  pathTemplate <- whisker.render("/session/{{sessionId}}/screenshot", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
  .e$sessionId <- res$sessionId
  invisible(res)
}



