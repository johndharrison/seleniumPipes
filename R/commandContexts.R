#' closeWindow
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

closeWindow <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "closeWindow", drvID = remDr$drvID, json = NULL,...)
  invisible(remDr)
}


#' fullscreenWindow
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

fullscreenWindow <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/fullscreen", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "fullscreenWindow", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}


#' getWindowHandle
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

getWindowHandle <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandle", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' getWindowHandles
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

getWindowHandles <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/handles", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandles", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' getWindowPosition
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

getWindowPosition <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowPosition", drvID = remDr$drvID, json = NULL,...)
  invisible(remDr)
}


#' getWindowSize
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

getWindowSize <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowSize", drvID = remDr$drvID, json = NULL,...)
  invisible(remDr)
}


#' maximizeWindow
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

maximizeWindow <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/maximize", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "maximizeWindow", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}


#' setWindowPosition
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

setWindowPosition <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setWindowPosition", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}


#' setWindowSize
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

setWindowSize <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setWindowSize", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}


#' switchToFrame
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

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
    
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "switchToFrame", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}


#' switchToParentFrame
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

switchToParentFrame <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/frame/parent", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "switchToParentFrame", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}


#' switchToWindow
#'
#' @param remDr
#'
#' @family commandContexts functions
#' @return
#' @export
#'
#' @examples

switchToWindow <- function(remDr, name, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    name = name
  ), auto_unbox = TRUE)
    
  pathTemplate <- whisker.render("/session/{{sessionId}}/window", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "switchToWindow", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}



