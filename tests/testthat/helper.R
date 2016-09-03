initFun <- function(){
  if(identical(TRUE, getOption("seleniumPipes_SL"))){
    # sauce labs test
    pv <- packageVersion("seleniumPipes")
    slFlags <- list(name = "seleniumPipes-test-suite"
                    , build = sum(unlist(pv)*10^(3-seq_along(unlist(pv)))) # 1.2.1 for example 121
                    , tags =  list("api-example")
                    , "custom-data" = list(release = do.call(paste, list(pv, collapse = ".")))
    )
    selOptions <- getOption("seleniumPipes_selOptions")
    selOptions$extraCapabilities <- c(selOptions$extraCapabilities, slFlags)
    options(seleniumPipes_selOptions = selOptions)
    source(file.path("tests", "testthat", 'setup.R'), local = TRUE)
  }else{
    remDr <- remoteDr(browserName = "chrome")
    remDr %>% setTimeout(milliseconds = 10000) # set page load timeout to 3 secs
    remDr %>% setTimeout(type = "implicit", milliseconds = 5000) # wait 5 secs for elements to load
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
  list(remDr = remDr, rdBrowser = rdBrowser)
}
