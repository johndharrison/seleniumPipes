library(testthat)
if(is.null(getOption("seleniumPipes_selOptions"))){
  stop("Please set test options")
}
remDr <- do.call(remoteDr, getOption("seleniumPipes_selOptions"))
if(identical(getOption("seleniumPipes_SL"), TRUE)){
  options(seleniumPipes_sauceID =
            remDr$sessionInfo$webdriver.remote.sessionid)
}
# set page load timeout to 3 secs
remDr %>% setTimeout(milliseconds = 10000)
# wait 5 secs for elements to load
remDr %>% setTimeout(type = "implicit", milliseconds = 5000)
rdBrowser <- remDr$sessionInfo$browserName
if(rdBrowser %in% c("iPhone", "iPad", "safari")){
  htmlSrc <- "myname.local:3000"
}else{
  # add somethin like 127.0.0.1	myname.local to /etc/hosts or equivalent
  htmlSrc <- "localhost:3000"
}
loadPage <- function(pgStr){
  paste0("http://", file.path(htmlSrc, paste0(pgStr, ".html")))
}
