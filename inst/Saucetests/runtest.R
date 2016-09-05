library(data.table)
library(testthat)
library(seleniumPipes)
library(RSauceLabs)

options(seleniumPipes_SL = TRUE)
if(Sys.getenv("TRAVIS") == "true"){
  user <- Sys.getenv("SAUCE_USERNAME")
  pass <- Sys.getenv("SAUCE_ACCESS_KEY")
}else{
  user <- "seleniumPipes"
  pass <- Sys.getenv("SLPASS")
  if(identical(pass, "")){stop("Set a SLPASS env variable with sauceLabs pass")}
}
SLAccount <- account(user, pass)
supPlat <- getSupportedPlatforms(SLAccount)
port <- 80
# selVersion <- "2.53.1"
ip <- paste0("http://", user, ':', pass, "@ondemand.saucelabs.com")
testDir <- system.file("Saucetests", package = "seleniumPipes")
# osBrowser <- list(
#   "Windows 10" = list(list(browser = "chrome", version = '51')
#                       , list(browser = "firefox", version = '45')
#                       , list(browser = "internet explorer", version = '11')
#                       , list(browser = "MicrosoftEdge", version = '13.10586')
#   ),
#   "Windows 8.1" = list(list(browser = "chrome", version = '51')
#                        , list(browser = "firefox", version = '45')
#                        , list(browser = "internet explorer", version = '11')
#   ),
#   "Linux" = list(list(browser = "chrome", version = '48')
#                  , list(browser = "firefox", version = '45')
#                  #, list(browser = "opera", version = '12')
#   ),
#   "OS X 10.11" = list(list(browser = "firefox", version = '45')
#                       , list(browser = "chrome", version = '51')
#                     #  , list(browser = "safari", version = '9')
#   ),
#   "OS X 10.10" = list(list(browser = "firefox", version = '45')
#                       , list(browser = "chrome", version = '51')
#                       #, list(browser = "safari", version = '8')
#   )
# )
# osBrowser <- osBrowser[4]
#
# osBrowser <- lapply(names(osBrowser), function(x){
#   out <- rbindlist(osBrowser[[x]])
#   out[, os:=x]
# })
#
# osBrowser <- rbindlist(osBrowser)

osBrowser <- supPlat[!short_version %in% c("dev", "beta") & api_name %in% c("chrome", "firefox")
        , .(max(as.numeric(short_version))), by = list(os, api_name)]
osBrowser<- osBrowser[1]
setnames(osBrowser, c("api_name", "os", "V1"), c("browser", "os", "version"))
testResults <- Map(function(os, browser, version){
  selOptions <- list(remoteServerAddr = ip, port = port, browserName = browser
                             , version = version, platform = os
                             , extraCapabilities = list(username = user
                                                        , accessKey = pass
                                                        )#, "selenium-version" = selVersion)
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
  updateJob(account, user, jobID = x$id,
            passed = !any(data.frame(x$result)$error),
    "custom-data" = list(release = do.call(paste, list(pv, collapse = "."))
                         , testResults = data.frame(x$result)[, c("test", "failed", "error")])
  )
})
