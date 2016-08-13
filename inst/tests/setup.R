library(seleniumPipes)
library(testthat)
testEnv <- seleniumPipes:::.e
if(is.null(testEnv$selOptions)){
  stop("Please set test options")
}
remDr <- do.call(remoteDr, testEnv$selOptions)
remDr %>% setTimeout(milliseconds = 3000) # set page load timeout to 3 secs
rdBrowser <- remDr$sessionInfo$browserName
if(identical(testEnv$SL, TRUE)){
  testEnv$SauceID <- remDr$sessionInfo$id
}
if(rdBrowser %in% c("iPhone", "iPad", "safari")){
  htmlSrc <- "localhost:3000"
}else{
  # add somethin like 127.0.0.1	myname.local to /etc/hosts or equivalent
  htmlSrc <- "myname.local:3000"
}
loadPage <- function(pgStr){
  paste0("http://", file.path(htmlSrc, paste0(pgStr, ".html")))
}
