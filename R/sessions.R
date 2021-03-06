
#' @rdname deleteSession
deleteSession <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = DELETE, url = build_url(pathURL),
                     source = "deleteSession",
                     drvID = remDr$drvID, json = NULL,...)
  .e$sessionId[[remDr$drvID]] <- NULL;invisible(remDr)
}

#' @rdname getTimeouts
getTimeouts <- function(remDr, type = "page load", ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  jsonBody <- toJSON(list(type = type),
                     auto_unbox = TRUE)
  pathTemplate <-
    whisker.render("/session/{{sessionId}}/timeouts", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "getTimeouts",
                     drvID = remDr$drvID, json = NULL,...)
  res$value
}

#' @rdname newSession
newSession <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  # Add function specific JSON to post
  jsonBody <- toJSON(list(
    desiredCapabilities =c(remDr$desiredCapabilities,
                           remDr$extraCapabilities)
  ), auto_unbox = TRUE)

  pathTemplate <-
    whisker.render("/session", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "newSession",
                     drvID = remDr$drvID, json = jsonBody,...)
  remDr$sessionInfo <- res$value;invisible(remDr)
}

#' @rdname setTimeouts
setTimeouts <- function(remDr, type = "page load", milliseconds = 10000,
                        ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  jsonBody <- toJSON(list(type = type, ms = milliseconds),
                     auto_unbox = TRUE)
  pathTemplate <-
    whisker.render("/session/{{sessionId}}/timeouts", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL),
                     source = "setTimeouts",
                     drvID = remDr$drvID, json = jsonBody,...)
  invisible(remDr)
}

#' @rdname status
status <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/status", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
                     source = "status",
                     drvID = remDr$drvID, json = NULL,...)
  res$value
}

