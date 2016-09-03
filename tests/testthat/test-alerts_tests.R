context("alerts_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser
on.exit(remDr %>% deleteSession())

#1
test_that("testShouldBeAbleToOverrideTheWindowAlertMethod", {
  skip_on_cran()
  script <- "window.alert = function(msg) { document.getElementById('text').innerHTML = msg;}"
  remDr %>% go(loadPage("alerts")) %>%
    executeScript(script)
  remDr %>% findElement("id", "alert") %>%
    elementClick
  appText <- remDr %>% findElement("id", "text") %>%
    getElementText
  expect_equal("cheese", appText)
  tryCatch({remDr %>% dismissAlert(retry = FALSE)}
           , error = function(err){})
}
)

test_that("testShouldAllowUsersToAcceptAnAlertManually", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "alert") %>%
    elementClick
  remDr %>% acceptAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)

test_that("testShouldAllowUsersToAcceptAnAlertWithNoTextManually", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "empty-alert") %>%
    elementClick
  remDr %>% acceptAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)

test_that("testShouldGetTextOfAlertOpenedInSetTimeout", {
  #if(identical(rdBrowser, "chrome")) skip("Not chrome")
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
     findElement("id", "slow-alert") %>%
    elementClick
  alertTxt <- remDr %>% getAlertText
  expect_equal("Slow", alertTxt)
  remDr %>% acceptAlert
}
)

test_that("testShouldAllowUsersToDismissAnAlertManually", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "alert") %>%
    elementClick
  remDr %>% acceptAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)

test_that("testShouldAllowAUserToAcceptAPrompt", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "prompt") %>%
    elementClick
  remDr %>% acceptAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)


test_that("testShouldAllowAUserToDismissAPrompt", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "prompt") %>%
    elementClick
  remDr %>% dismissAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)

test_that("testShouldAllowAUserToSetTheValueOfAPrompt", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "prompt") %>%
    elementClick
  remDr %>% sendAlertText("cheese")
  remDr %>% acceptAlert
  alertTxt <- remDr %>% findElement("id", "text") %>% getElementText
  expect_equal("cheese", alertTxt)
}
)

test_that("testSettingTheValueOfAnAlertThrows", {
  if(identical("chrome", rdBrowser)) skip("Not chrome")
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "alert") %>%
    elementClick
  expect_error(remDr %>% sendAlertText("cheddar"))
  remDr %>% dismissAlert
}
)

test_that("testAlertShouldNotAllowAdditionalCommandsIfDimissed", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "alert") %>%
    elementClick
  remDr %>% dismissAlert
  expect_error(remDr %>% sendAlertText(retry = FALSE))
}
)

test_that("testShouldAllowUsersToAcceptAnAlertInAFrame", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    switchToFrame(remDr %>% findElement("name", "iframeWithAlert")) %>%
    findElement("id", "alertInFrame") %>%
    elementClick
  remDr %>% acceptAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)

test_that("testShouldAllowUsersToAcceptAnAlertInANestedFrame", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    switchToFrame(remDr %>% findElement("name", "iframeWithIframe")) %>%
    switchToFrame(remDr %>% findElement("name", "iframeWithAlert")) %>%
    findElement("id", "alertInFrame") %>%
    elementClick
  remDr %>% acceptAlert
  expect_equal("Testing Alerts", remDr %>% getTitle)
}
)

test_that("testPromptShouldUseDefaultValueIfNoKeysSent", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "prompt-with-default") %>%
    elementClick
  remDr %>% acceptAlert
  alertTxt <- remDr %>% findElement("id", "text") %>%
    getElementText
  expect_equal("This is a default value", alertTxt)
}
)

test_that("testPromptShouldHaveNullValueIfDismissed", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "prompt-with-default") %>%
    elementClick
  remDr %>% dismissAlert
  alertTxt <- remDr %>% findElement("id", "text") %>%
    getElementText
  expect_equal("null", alertTxt)
}
)

test_that("testHandlesTwoAlertsFromOneInteraction", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "double-prompt") %>%
    elementClick
  remDr %>% sendAlertText("brie") %>%
    acceptAlert
  remDr %>% sendAlertText("cheddar") %>%
    acceptAlert
  alertTxt1 <- remDr %>% findElement("id", "text1") %>%
    getElementText
  alertTxt2 <- remDr %>% findElement("id", "text2") %>%
    getElementText
  expect_equal("brie", alertTxt1)
  expect_equal("cheddar", alertTxt2)
}
)

test_that("testShouldHandleAlertOnPageLoad", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "open-page-with-onload-alert") %>%
    elementClick
  alertTxt <- remDr %>% getAlertText
  remDr %>% acceptAlert
  expect_equal("onload", alertTxt)
}
)

test_that("testShouldAllowTheUserToGetTheTextOfAnAlert", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "alert") %>%
    elementClick
  alertTxt <- remDr %>% getAlertText
  remDr %>% acceptAlert
  expect_equal("cheese", alertTxt)
}
)

test_that("testUnexpectedAlertPresentExceptionContainsAlertText", {
  skip_on_cran()
  remDr %>% go(loadPage("alerts")) %>%
    findElement("id", "alert") %>%
    elementClick
  expect_error(remDr %>% go(loadPage("simpleTest"), retry = FALSE))
  expect_equal(errorResponse()$status, 26)
  remDr %>% acceptAlert
}
)
