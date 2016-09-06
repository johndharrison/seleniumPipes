library(data.table)
library(testthat)
library(seleniumPipes)
library(RSauceLabs)
travis <- Sys.getenv("TRAVIS") == "true"
oldRetry <- getOption("seleniumPipes_no_try_delay")
options(seleniumPipes_no_try_delay = 1000)
options(seleniumPipes_SL = TRUE)
if(travis){
  user <- Sys.getenv("SAUCE_USERNAME")
  pass <- Sys.getenv("SAUCE_ACCESS_KEY")
  SLAccount <- account(user, pass)
  jobNo <- as.numeric(Sys.getenv("TRAVIS_JOB_NUMBER"))
  if(jobNo%%1 > 0.100001){
    quit("no")
  }
}else{
  user <- "seleniumPipes"
  pass <- Sys.getenv("SLPASS")
  SLAccount <- account(user, pass)
  if(identical(pass, "")){stop("Set a SLPASS env variable with sauceLabs pass")}
}
tunnels <- getTunnels(account = SLAccount, username = user)
if(length(tunnels) == 0L){
  quit("no")
}
appTunnels <- lapply(tunnels, function(x){
  getTunnel(account = SLAccount, username = user, tunnelID = x)}
)
supPlat <- getSupportedPlatforms(SLAccount)
supPlat <- supPlat[!short_version %in% c("dev", "beta")]
supPlat <- supPlat[!(api_name == "firefox" & as.numeric(short_version) > 47.999)]
supPlat <- supPlat[!(api_name == "chrome" & as.numeric(short_version) > 51.999)]
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

osBrowser <- supPlat[api_name %in% c("chrome", "firefox")
        , .(max(as.numeric(short_version))), by = list(os, api_name)]
setnames(osBrowser, c("api_name", "os", "V1"), c("browser", "os", "version"))
testResults <- Map(function(os, browser, version){
  selOptions <- list(remoteServerAddr = ip, port = port, browserName = browser
                             , platform = os#, version = version
                             , extraCapabilities = list(username = user
                                                        , accessKey = pass
                                                        , recordVideo = FALSE
                                                        , recordScreenshots = FALSE
                                                        )#, "selenium-version" = selVersion)
  )
  if(travis){
    # use the first tunnel
    selOptions$extraCapabilities[["tunnel-identifier"]] <- appTunnels[[1]]$tunnel_identifier
  }
  options(seleniumPipes_selOptions = selOptions)
  testRes <- test_dir(testDir, reporter = "Tap", filter = "api_example")
  list(id = getOption("seleniumPipes_sauceID"), result = testRes, browser = browser, os = os)
}, os = osBrowser$os
, browser = osBrowser$browser
, version = osBrowser$version)

# Annotate tests
pv <- packageVersion("seleniumPipes")
updateResults <- lapply(testResults, function(x){
  updateJob(account = SLAccount, username = user, jobID = x$id,
            passed = sum(data.frame(x$result)$failed) == 0L,
            custom_data = list(release = do.call(paste, list(pv, collapse = "."))
                         , testResults = data.frame(x$result)[, c("test", "failed", "error")])
  )
})
options(seleniumPipes_no_try_delay = oldRetry)
