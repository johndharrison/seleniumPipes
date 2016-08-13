library(seleniumPipes)
library(testthat)
testEnv <- seleniumPipes:::.e
if(is.null(testEnv$selOptions)){
  stop("Please set test options")
}
remDr <- do.call(remoteDr, testEnv$selOptions)
remDr %>% setTimeout(3000) # set page load timeout to 3 secs
rdBrowser <- remDr$sessionInfo$browserName
htmlSrc <- "localhost:3000"
loadPage <- function(pgStr){
  paste0("http://", file.path(htmlSrc, paste0(pgStr, ".html")))
}
