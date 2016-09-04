context("takes_screenshots_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser; loadPage <- init$loadPage
on.exit(remDr %>% deleteSession())

test_that("testShouldWriteScreenshotToFile", {
  skip_on_cran()
  tmpF <- tempfile()
  result <- remDr %>% go(loadPage("simpleTest")) %>%
    takeScreenshot(file = tmpF)
  expect_true(file.exists(tmpF))
}
)

test_that("test_get_screenshot_as_png", {
  skip_on_cran()
  if (!.Platform$OS.type == "unix") {
    skip("unix file command used to determine file type")
  }
  tmpF <- tempfile()
  result <- remDr %>% go(loadPage("simpleTest")) %>%
    takeScreenshot(file = tmpF)
  fileInfo <- system(paste("file --mime-type", tmpF), intern = TRUE)
  expect_true(grepl("image/png", fileInfo))
}
)
