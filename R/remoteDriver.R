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
  jsonBody <- toJSON(
    list(desiredCapabilities =c(remDr$desiredCapabilities, remDr$extraCapabilities))
    , auto_unbox = TRUE)

  pathTemplate <- whisker.render("/session", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = DELETE, url = build_url(pathURL), json = NULL,...)
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

# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)

  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/back", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/forward", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/refresh", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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
  queryDriver(verb = DELETE, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/window/fullscreen", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/window/maximize", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/frame", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/frame/parent", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/sync", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/async", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = DELETE, url = build_url(pathURL), json = NULL,...)
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
  queryDriver(verb = DELETE, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/timeouts", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = DELETE, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
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

  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = remDr)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = POST, url = build_url(pathURL), json = jsonBody,...)
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
  queryDriver(verb = GET, url = build_url(pathURL), json = NULL,...)
}



