#' takeElementScreenshot
#'
#' @param webElem
#'
#' @family screenCapture functions
#' @return
#' @export
#'
#' @examples

takeElementScreenshot <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/screenshot", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "takeElementScreenshot", drvID = webElem$drvID, json = NULL,...)
  invisible(remDr)
}


#' takeScreenshot
#'
#' @param remDr
#'
#' @family screenCapture functions
#' @return
#' @export
#'
#' @examples

takeScreenshot <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/screenshot", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "takeScreenshot", drvID = remDr$drvID, json = NULL,...)
  invisible(remDr)
}



