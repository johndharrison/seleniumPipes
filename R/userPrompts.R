#' acceptAlert
#'
#' @param remDr
#'
#' @family userPrompts functions
#' @return
#' @export
#'
#' @examples

acceptAlert <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/accept", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "acceptAlert", json = jsonBody,...)
  invisible(remDr)
}


#' dismissAlert
#'
#' @param remDr
#'
#' @family userPrompts functions
#' @return
#' @export
#'
#' @examples

dismissAlert <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/dismiss", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "dismissAlert", json = jsonBody,...)
  invisible(remDr)
}


#' getAlertText
#'
#' @param remDr
#'
#' @family userPrompts functions
#' @return
#' @export
#'
#' @examples

getAlertText <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getAlertText", json = NULL,...)
  res$value
}


#' sendAlertText
#'
#' @param remDr
#'
#' @family userPrompts functions
#' @return
#' @export
#'
#' @examples

sendAlertText <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId()
  sendKeys <- list(...)
  jsonBody <- toJSON(list(text = matchSelKeys(sendKeys)), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/alert/text", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "sendAlertText", json = jsonBody,...)
  invisible(remDr)
}



