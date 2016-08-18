
#' @rdname acceptAlert
acceptAlert <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "acceptAlert", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname dismissAlert
dismissAlert <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "dismissAlert", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname getAlertText
getAlertText <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getAlertText", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname sendAlertText
sendAlertText <- function(remDr, text = "", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
    jsonBody <- toJSON(list(text = text), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "sendAlertText", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

