
#' @rdname acceptAlertOld
acceptAlertOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert_accept", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "acceptAlertOld", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname dismissAlertOld
dismissAlertOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert_dismiss", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "dismissAlertOld", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname executeAsyncScriptOld
executeAsyncScriptOld <- function(remDr, script, args = list(), replace = TRUE, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
    args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
    x$elementId
    }else{
    x
    }
    })
    jsonBody <- toJSON(list(
    script = script, args = args
    ), auto_unbox = TRUE)
    
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute_async", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "executeAsyncScriptOld", drvID = remDr$drvID, json = jsonBody,...)
  if(replace){testWebElement(res$value, remDr)}else{res$value}
}

#' @rdname executeScriptOld
executeScriptOld <- function(remDr, script, args = list(), replace = TRUE, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
    args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
    x$elementId
    }else{
    x
    }
    })
    jsonBody <- toJSON(list(
    script = script, args = args
    ), auto_unbox = TRUE)
    
  pathTemplate <- whisker.render("/session/{{sessionId}}/execute", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "executeScriptOld", drvID = remDr$drvID, json = jsonBody,...)
  if(replace){testWebElement(res$value, remDr)}else{res$value}
}

#' @rdname getAlertTextOld
getAlertTextOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert_text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getAlertTextOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowHandleOld
getWindowHandleOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window_handle", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandleOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowHandlesOld
getWindowHandlesOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window_handles", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandlesOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowPositionOld
getWindowPositionOld <- function(remDr, handle = "current", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  obj$windowHandle <- handle
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/{{windowHandle}}/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowPositionOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getWindowSizeOld
getWindowSizeOld <- function(remDr, handle = "current", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  obj$windowHandle <- handle
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/{{windowHandle}}/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowSizeOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname maximizeWindowOld
maximizeWindowOld <- function(remDr, handle = "current", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  jsonBody <- NULL
obj$windowHandle <- handle
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/{{windowHandle}}/maximize", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "maximizeWindowOld", drvID = remDr$drvID, json = jsonBody,...)
  res$value
}

#' @rdname sendAlertTextOld
sendAlertTextOld <- function(remDr, text = "", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
    jsonBody <- toJSON(list(text = text), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert_text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "sendAlertTextOld", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname setWindowPositionOld
setWindowPositionOld <- function(remDr, x, y, handle = "current", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  obj$windowHandle <- handle
  jsonBody <- toJSON(list(
    x = x, y = y
  ), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/{{windowHandle}}/position", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setWindowPositionOld", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname setWindowSizeOld
setWindowSizeOld <- function(remDr, width, height, handle = "current", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  obj$windowHandle <- handle
  jsonBody <- toJSON(list(
    width = width, height = height
  ), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/window/{{windowHandle}}/size", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setWindowSizeOld", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

