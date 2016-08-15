#' acceptAlertOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

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


#' dismissAlertOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

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


#' executeAsyncScriptOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

executeAsyncScriptOld <- function(remDr, script, args = list(), replace = TRUE,  ...){
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


#' executeScriptOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

executeScriptOld <- function(remDr, script, args = list(), replace = TRUE,  ...){
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


#' getAlertTextOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

getAlertTextOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert_text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getAlertTextOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' getWindowHandleOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

getWindowHandleOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window_handle", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandleOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' getWindowHandlesOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

getWindowHandlesOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/window_handles", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getWindowHandlesOld", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' sendAlertTextOld
#'
#' @param remDr
#'
#' @family oldMethods functions
#' @return
#' @export
#'
#' @examples

sendAlertTextOld <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  sendKeys <- list(...)
    jsonBody <- toJSON(list(text = matchSelKeys(sendKeys)), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert_text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "sendAlertTextOld", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}



