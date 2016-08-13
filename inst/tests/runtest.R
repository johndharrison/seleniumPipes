library(data.table)
library(testthat)
library(seleniumPipes)

options(seleniumPipes_SL = TRUE)
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
                      , list(browser = "MicrosoftEdge", version = '13.10586')
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
osBrowser <- osBrowser[1]
osBrowser <- lapply(names(osBrowser), function(x){
  out <- rbindlist(osBrowser[[x]])
  out[, os:=x]
})

osBrowser <- rbindlist(osBrowser)

testResults <- Map(function(os, browser, version){
  selOptions <- list(remoteServerAddr = ip, port = port, browserName = browser
                             , version = version, platform = os
                             , extraCapabilities = list(username = user
                                                        , accessKey = pass
                                                        , "selenium-version" = selVersion)
  )
  options(seleniumPipes_selOptions = selOptions)
  testRes <- test_dir(testDir, reporter = "Tap", filter = "api_example")
  list(id = getOption("seleniumPipes_sauceID"), result = testRes, browser = browser, os = os)
}, os = osBrowser$os
, browser = osBrowser$browser
, version = osBrowser$version)

# Annotate tests
pv <- packageVersion("seleniumPipes")
updateResults <- lapply(testResults, function(x){
  ip <- paste0("https://saucelabs.com/rest/v1/", user, "/jobs/", x$id)
  body <- list(
    passed = !any(data.frame(x$result)$error),
    "custom-data" = list(release = do.call(paste, list(pv, collapse = "."))
                         , testResults = data.frame(x$result)[, c("test", "failed", "error")])
  )
  PUT(ip, body = body, authenticate(user, pass), encode = "json")
})
