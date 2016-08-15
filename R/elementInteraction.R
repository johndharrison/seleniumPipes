#' elementClear
#'
#' @param webElem
#'
#' @family elementInteraction functions
#' @return
#' @export
#'
#' @examples

elementClear <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/clear", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClear", drvID = webElem$remDr$drvID, json = jsonBody,...)
  invisible(webElem)
}


#' elementClick
#'
#' @param webElem
#'
#' @family elementInteraction functions
#' @return
#' @export
#'
#' @examples

elementClick <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  jsonBody <- NULL
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/click", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementClick", drvID = webElem$remDr$drvID, json = jsonBody,...)
  invisible(webElem)
}


#' elementSendKeys
#'
#' @param webElem
#'
#' @family elementInteraction functions
#' @return
#' @export
#'
#' @examples

elementSendKeys <- function(webElem, ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT
  sendKeys <- list(...)
      jsonBody <- toJSON(list(value = matchSelKeys(sendKeys)), auto_unbox = TRUE)
  pathTemplate <- whisker.render("/session/{{sessionId}}/element/{{elementId}}/value", data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "elementSendKeys", drvID = webElem$remDr$drvID, json = jsonBody,...)
  invisible(webElem)
}



