
#' @rdname executeAsyncScript
executeAsyncScript <- function(remDr, script, args = list(), replace = TRUE,  ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
      x$elementId
    }else{
      x
    }
  })
  jsonBody <- toJSON(list(
    script = script, args = args
  ), auto_unbox = TRUE)

  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/async", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "executeAsyncScript", drvID = remDr$drvID, json = jsonBody,...)
  if(replace){testWebElement(res$value, remDr)}else{res$value}
}

#' @rdname executeScript
executeScript <- function(remDr, script, args = list(), replace = TRUE,  ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
      x$elementId
    }else{
      x
    }
  })
  jsonBody <- toJSON(list(
    script = script, args = args
  ), auto_unbox = TRUE)

  pathTemplate <- whisker.render("/session/{{sessionId}}/execute/sync", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = POST, url = build_url(pathURL), source = "executeScript", drvID = remDr$drvID, json = jsonBody,...)
  if(replace){testWebElement(res$value, remDr)}else{res$value}
}

#' @rdname getPageSource
getPageSource <- function(remDr, ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)
  
  pathTemplate <- whisker.render("/session/{{sessionId}}/source", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL), source = "getPageSource", drvID = remDr$drvID, json = NULL,...)
  read_html(res$value)
}

