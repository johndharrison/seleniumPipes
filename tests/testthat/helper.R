initFun <- function(){
  if(identical(TRUE, getOption("seleniumPipes_SL"))){
    # sauce labs test
    pv <- packageVersion("seleniumPipes")
    slFlags <- list(
      name = "seleniumPipes-test-suite",
      build = sum(unlist(pv)*10^(3-seq_along(unlist(pv))))
      , tags =  list("api-example"),
      "custom-data" = list(
        release = do.call(paste, list(pv, collapse = "."))
      )
    )
    selOptions <- getOption("seleniumPipes_selOptions")
    selOptions$extraCapabilities <- c(selOptions$extraCapabilities,
                                      slFlags)
    options(seleniumPipes_selOptions = selOptions)
    source(file.path("tests", "testthat", 'setup.R'), local = TRUE)
  }else{
    remDr <- remoteDr(browserName = "chrome")
    # set page load timeout to 3 secs
    remDr %>% setTimeouts(milliseconds = 10000)
    # wait 5 secs for elements to load
    remDr %>% setTimeouts(type = "implicit", milliseconds = 5000)
    htmlSrc <- if(identical(Sys.getenv("TRAVIS"), "true")){
      "http-server:8080"
    }else{
      "localhost:3000"
    }
    loadPage <- function(pgStr){
      paste0("http://", file.path(htmlSrc, paste0(pgStr, ".html")))
    }
    rdBrowser <- remDr$sessionInfo$browserName

  }
  list(remDr = remDr, rdBrowser = rdBrowser, loadPage = loadPage)
}
