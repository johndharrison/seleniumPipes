library(testthat)
if(is.null(getOption("seleniumPipes_selOptions"))){
  stop("Please set test options")
}
remDr <- do.call(remoteDr, getOption("seleniumPipes_selOptions"))
if(identical(getOption("seleniumPipes_SL"), TRUE)){
  options(seleniumPipes_sauceID = remDr$sessionInfo$id)
}
remDr %>% setTimeout(milliseconds = 3000) # set page load timeout to 3 secs
rdBrowser <- remDr$sessionInfo$browserName
if(rdBrowser %in% c("iPhone", "iPad", "safari")){
  htmlSrc <- "localhost:3000"
}else{
  # add somethin like 127.0.0.1	myname.local to /etc/hosts or equivalent
  htmlSrc <- "myname.local:3000"
}
loadPage <- function(pgStr){
  paste0("http://", file.path(htmlSrc, paste0(pgStr, ".html")))
}
