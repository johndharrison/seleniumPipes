context("page_loading_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser; loadPage <- init$loadPage
on.exit(remDr %>% deleteSession())

test_that("testShouldWaitForDocumentToBeLoaded", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("simpleTest")) %>%
    getTitle
  expect_identical(result, "Hello WebDriver")
}
)

test_that("testShouldBeAbleToGetAFragmentOnTheCurrentPage", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("xhtmlTest")) %>%
    getCurrentUrl
  wElem <- remDr %>% go(paste0(result, "#text")) %>%
    findElement("id", "id1")
  expect_true(inherits(wElem, "wElement"))
}
)

test_that("testShouldReturnWhenGettingAUrlThatDoesNotResolve", {
  skip_on_cran()
  expect_silent(
    result <- remDr %>% go("http://www.thisurldoesnotexist.comx/")
  )
}
)

test_that("testShouldReturnWhenGettingAUrlThatDoesNotConnect", {
  skip_on_cran()
  expect_silent(
    result <- remDr %>% go("http://localhost:3001")
  )
}
)

test_that("testShouldBeAbleToNavigateBackInTheBrowserHistory", {
  remDr %>% go(loadPage("formPage")) %>%
    findElement("id", "imageButton") %>%
    elementClick
  result <- remDr %>% getTitle
  expect_identical(result, "We Arrive Here")
  resBack <- remDr %>% back %>%
    getTitle
  expect_identical(resBack, "We Leave From Here")
}
)

test_that("testShouldBeAbleToNavigateBackInPresenceOfIframes", {
  skip_on_cran()
  remDr %>% go(loadPage("xhtmlTest")) %>%
    findElement("name", "sameWindow") %>%
    elementClick
  expect_identical(remDr %>% getTitle, "This page has iframes")
  result <- remDr %>% back %>%
    getTitle
  expect_identical(result, "XHTML Test Page")
}
)

test_that("testShouldBeAbleToNavigateForwardsInTheBrowserHistory", {
  skip_on_cran()
  remDr %>% go(loadPage("formPage")) %>%
    findElement("id", "imageButton") %>%
    elementClick
  expect_identical(remDr %>% getTitle, "We Arrive Here")
  remDr %>% back
  expect_identical(remDr %>% getTitle, "We Leave From Here")
  remDr %>% forward
  expect_identical(remDr %>% getTitle, "We Arrive Here")
}
)

test_that("testShouldNotHangifOpenCallIsNeverFollowedByCloseCall", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("document_write_in_onload")) %>%
    findElement("xpath", "//body")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testShouldBeAbleToRefreshAPage", {
  result <- remDr %>% go(loadPage("xhtmlTest")) %>%
    refresh %>%
    getTitle
  expect_identical(result, "XHTML Test Page")
}
)
