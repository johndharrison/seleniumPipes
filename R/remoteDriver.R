#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

newSession <- function(remDr, ...){
  pathTemplate <- whisker.render("/session", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

deleteSession <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  DELETE(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

setTimeout <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/timeouts", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

go <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getCurrentUrl <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

back <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/back", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

forward <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/forward", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

refresh <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/refresh", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getTitle <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/title", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowHandle <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

closeWindow <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  DELETE(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToWindow <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowHandles <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/handles", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToFrame <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

switchToParentFrame <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame/parent", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowSize <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

setWindowSize <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getWindowPosition <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

setWindowPosition <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

maximizeWindow <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/maximize", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

fullscreenWindow <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/fullscreen", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getActiveElement <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/active", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

findingElementsToInteract <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/element", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

findingElementsToInteract <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/elements", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

gettingPageSource <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/source", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

executeScript <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/sync", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

executeAsyncScript <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/async", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getCookie <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

addCookie <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

deleteCookie <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/cookie/{{name}}", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  DELETE(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

NA <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

NA <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  DELETE(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

dismissAlert <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

acceptAlert <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

getAlertText <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

sendAlertText <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  POST(url = build_url(pathURL$path), ...)
}


#' Title
#'
#' @param remDr
#'
#' @return
#' @export
#'
#' @examples

takeScreenshot <- function(remDr, ...){
  pathTemplate <- whisker.render("/session/{{sessionId}}/screenshot", data = .e)
  pathURL <- .e$remServAdd
  pathURL$path <- paste0(pathURL$path, pathTemplate)
  GET(url = build_url(pathURL$path), ...)
}



