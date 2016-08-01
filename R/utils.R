#' @export
print.rDriver <- function(x, ...){
  cat("Remote Ip Address:", build_url(x$remServAdd), "\n")
  cat("Remote sessionId:", x$sessionId(), "\n")
}

#' @export
print.wElement <- function(x, ...){
  cat("ElementId:", x$elementId[["ELEMENT"]], "\n")
  cat("Remote Driver:", "\n")
  print(x$remDr)
}
