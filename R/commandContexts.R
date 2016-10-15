
#' @rdname closeWindow
closeWindow <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL),
                     source = "closeWindow",
                     drvID = remDr$drvID, json = NULL,...)
  invisible(remDr)
}

#' @rdname fullscreenWindow
fullscreenWindow <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  # Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/fullscreen", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "fullscreenWindow",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname getWindowHandle
getWindowHandle <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getWindowHandle",
                     drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowHandles
getWindowHandles <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/handles", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getWindowHandles",
                     drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowPosition
getWindowPosition <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getWindowPosition",
                     drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowSize
getWindowSize <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getWindowSize",
                     drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname maximizeWindow
maximizeWindow <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  jsonBody <- NULL

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/maximize", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "maximizeWindow",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname setWindowPosition
setWindowPosition <- function(remDr, x, y, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  jsonBody <- toJSON(list(
    x = x, y = y
  ), auto_unbox = TRUE)
  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "setWindowPosition",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname setWindowSize
setWindowSize <- function(remDr, width, height, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  jsonBody <- toJSON(list(
    width = width, height = height
  ), auto_unbox = TRUE)
  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "setWindowSize",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname switchToFrame
switchToFrame <- function(remDr, Id = NULL, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  # Add function specific JSON to post
  if("wElement" %in% class(Id)){
    # pass the webElement as Json to SS
    Id <- Id$elementId
  }
  jsonBody <- toJSON(list(
    id = Id
  ), auto_unbox = TRUE, null = "null")

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/frame", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "switchToFrame",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname switchToParentFrame
switchToParentFrame <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  # Add function specific JSON to post
  jsonBody <- NULL

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/frame/parent", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "switchToParentFrame",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname switchToWindow
switchToWindow <- function(remDr, name, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  # Add function specific JSON to post
  jsonBody <- toJSON(list(
    name = name
  ), auto_unbox = TRUE)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "switchToWindow",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

