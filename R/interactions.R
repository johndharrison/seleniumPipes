#' performActions
#'
#' @param remDr
#'
#' @family interactions functions
#' @return
#' @export
#'
#' @examples

performActions <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "performActions", json = jsonBody,...)
  invisible(remDr)
}


#' releasingActions
#'
#' @param remDr
#'
#' @family interactions functions
#' @return
#' @export
#'
#' @examples

releasingActions <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/actions", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL), source = "releasingActions", json = NULL,...)
  invisible(remDr)
}



