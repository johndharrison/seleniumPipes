
#' @rdname performActions
performActions <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  # Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/actions", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "performActions",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname releasingActions
releasingActions <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/actions", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL),
                     source = "releasingActions",
                     drvID = remDr$drvID, json = NULL,...)
  invisible(remDr)
}

