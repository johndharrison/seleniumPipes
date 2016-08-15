#' back
#'
#' @param remDr
#'
#' @family navigation functions
#' @return
#' @export
#'
#' @examples

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


#' forward
#'
#' @param remDr
#'
#' @family navigation functions
#' @return
#' @export
#'
#' @examples

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


#' getCurrentUrl
#'
#' @param remDr
#'
#' @family navigation functions
#' @return
#' @export
#'
#' @examples

getCurrentUrl <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/url", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getCurrentUrl", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' getTitle
#'
#' @param remDr
#'
#' @family navigation functions
#' @return
#' @export
#'
#' @examples

getTitle <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/title", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getTitle", drvID = remDr$drvID, json = NULL,...)
  res$value
}


#' go
#'
#' @param remDr
#'
#' @family navigation functions
#' @return
#' @export
#'
#' @examples

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


#' refresh
#'
#' @param remDr
#'
#' @family navigation functions
#' @return
#' @export
#'
#' @examples

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



