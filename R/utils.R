#' @export
print.rDriver <- function(x, ...){
  cat("Remote Ip Address:", build_url(x$remServAdd), "\n")
  cat("Remote sessionId:", x$sessionId(), "\n")
}
