#' deleteSession
#'
#' @param remDr
#'
#' @family sessions functions
#' @return
#' @export
#'
#' @examples

deleteSession <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  pathTemplate <- whisker.render("/session/{{sessionId}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "deleteSession", json = NULL,...)
  invisible(remDr)
}


#' newSession
#'
#' @param remDr
#'
#' @family sessions functions
#' @return
#' @export
#'
#' @examples

newSession <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    desiredCapabilities =c(remDr$desiredCapabilities, remDr$extraCapabilities)
  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "newSession", json = jsonBody,...)
  remDr$sessionInfo <- res$value;invisible(remDr)
}


#' setTimeout
#'
#' @param remDr
#'
#' @family sessions functions
#' @return
#' @export
#'
#' @examples

setTimeout <- function(remDr, type = 'page load', milliseconds = 10000,  ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
      jsonBody <- toJSON(list(type = type, ms = milliseconds), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/timeouts", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "setTimeout", json = jsonBody,...)
  invisible(remDr)
}



