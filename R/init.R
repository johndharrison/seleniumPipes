#' remoteDr
#'
#' @return
#' @export
#'
#' @examples
#'

remoteDr <- function(remoteServerAddr = "http://localhost",
                     port             = 4444L,
                     browserName      = "firefox",
                     version          = "",
                     platform         = "ANY",
                     javascript       = TRUE,
                     nativeEvents     = TRUE,
                     extraCapabilities = list(),
                     path = "wd/hub"
                     , newSession = TRUE){
  remServAdd <- parse_url(remoteServerAddr)
  remServAdd[["port"]] <- port
  remServAdd[["path"]] <- path
  session <- list(
    remServAdd = remServAdd,
    desiredCapabilities = list(
      browserName = browserName
      , version = version
      , javascriptEnabled = javascript
      , platform = platform
      , nativeEvents = nativeEvents),
    extraCapabilities = extraCapabilities,
    sessionId = function(){.e$sessionId}
  )
  if(newSession){
    newSession(session)
  }
  invisible(session)
}


#' queryDriver
#'
#' @param verb
#' @param url
#' @param ...
#'
#' @return
#' @export
#'
#' @examples
#'

queryDriver <- function(verb = GET, url, ...){
  res <- do.call(verb, c(list(url), body = list(...)[["json"]]))
  content(res)
}
