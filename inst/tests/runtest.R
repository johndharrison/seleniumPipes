library(data.table)
library(testthat)
library(seleniumPipes)
testEnv <- seleniumPipes:::.e
testEnv$selOptions <- list() # reset selenium options
testEnv$SL <- TRUE
user <- "seleniumPipes"
pass <- Sys.getenv("SLPASS")
if(identical(pass, "")){stop("Set a SLPASS env variable with sauceLabs pass")}
port <- 80
selVersion <- "2.53.1"
ip <- paste0("http://", user, ':', pass, "@ondemand.saucelabs.com")
testDir <- system.file("tests", package = "seleniumPipes")
osBrowser <- list(
  "Windows 10" = list(list(browser = "chrome", version = '51')
                      , list(browser = "firefox", version = '45')
                      , list(browser = "internet explorer", version = '11')
  ),
  "Windows 8.1" = list(list(browser = "chrome", version = '51')
                       , list(browser = "firefox", version = '45')
                       , list(browser = "internet explorer", version = '11')
  ),
  "Linux" = list(list(browser = "chrome", version = '48')
                 , list(browser = "firefox", version = '45')
                 #, list(browser = "opera", version = '12')
  ),
  "OS X 10.11" = list(list(browser = "firefox", version = '45')
                      , list(browser = "chrome", version = '51')
                    #  , list(browser = "safari", version = '9')
  ),
  "OS X 10.10" = list(list(browser = "firefox", version = '45')
                      , list(browser = "chrome", version = '51')
                      #, list(browser = "safari", version = '8')
  )
)

osBrowser <- lapply(names(osBrowser), function(x){
  out <- rbindlist(osBrowser[[x]])
  out[, os:=x]
})

osBrowser <- rbindlist(osBrowser)

testResults <- Map(function(os, browser, version){
  testEnv$selOptions <- list(remoteServerAddr = ip, port = port, browserName = browser
                             , version = version, platform = os
                             , extraCapabilities = list(username = user
                                                        , accessKey = pass
                                                        , "selenium-version" = selVersion)
  )
  testRes <- test_dir(testDir, reporter = "Tap", filter = "api_example")
  list(id = testEnv[['sauceID']], result = testRes)
}, os = osBrowser$os
, browser = osBrowser$browser
, version = osBrowser$version)

testEnv$SL <- NULL
