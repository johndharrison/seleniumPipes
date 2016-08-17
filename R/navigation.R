
#' @rdname back
back <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- NULL
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/back", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "back", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname forward
forward <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- NULL
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/forward", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "forward", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname getCurrentUrl
getCurrentUrl <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getCurrentUrl", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname getTitle
getTitle <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/title", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getTitle", drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname go
go <- function(remDr, url, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(
     url = url
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "go", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname refresh
refresh <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
# Add function specific JSON to post
  jsonBody <- NULL
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/refresh", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "refresh", drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

