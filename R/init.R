#' remoteDr
#'
#' @return
#' @export
#'
#' @examples
#'

remoteDr <- function(remoteServerAddr = "localhost",
                     port             = 4444L,
                     browserName      = "firefox",
                     version          = "",
                     platform         = "ANY",
                     javascript       = TRUE,
                     nativeEvents     = TRUE,
                     extraCapabilities = "list"
                     , newSession = TRUE){
  remServAdd <- parse_url(remoteServerAddr)
  remServAdd[["port"]] <- port
  session <- list(
    remServAdd = remServAdd,
    desiredCapabilities = list(
      browserName = browserName
      , version = version
      , javascriptEnabled = javascript
      , platform = platform
      , nativeEvents = nativeEvents),
    extraCapabilities = extraCapabilities
  )
  if(newSession){
    newSession(session)
  }
  invisible(session)
}
