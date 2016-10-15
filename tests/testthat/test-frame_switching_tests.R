context("frame_switching_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser; loadPage <- init$loadPage
on.exit(remDr %>% deleteSession())

# ----------------------------------------------------------------------------------------------
#
# Tests that WebDriver doesn't do anything fishy when it navigates to a page with frames.
#
# ----------------------------------------------------------------------------------------------

test_that("testShouldAlwaysFocusOnTheTopMostFrameAfterANavigationEvent", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    findElement("tag name", "frameset")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testNotSwitchFocusToAnIFrameWhenAPageContainingThemIsLoaded", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    findElement("id", "iframe_page_heading")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testShouldOpenPageWithBrokenFrameset", {
  skip_on_cran()
  frame1 <- remDr %>% go(loadPage("framesetPage3")) %>%
    findElement("id", "first")
  remDr %>% switchToFrame(frame1)
  expect_true(inherits(frame1, "wElement"))
  remDr %>% switchToFrame
  frame2 <- remDr %>% findElement("id", "second")
  expect_true(inherits(frame2, "wElement"))
  remDr %>% switchToFrame(frame2)
}
)

# ----------------------------------------------------------------------------------------------
#
# Tests that WebDriver can switch to frames as expected.
#
# ----------------------------------------------------------------------------------------------

# test_that("testShouldBeAbleToSwitchToAFrameByItsIndex", {
#   result <- remDr %>% go(loadPage("frameset")) %>%
#     switchToFrame(1) %>%
#     findElement("id", "pageNumber") %>%
#     getElementText
#   expect_identical(result, "2")
# }
# )

test_that("testShouldBeAbleToSwitchToAnIframeByItsIndex", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    switchToFrame(0) %>%
    findElement("name", "id-name1") %>%
    getElementAttribute("value")
  expect_identical(result, "name")
}
)

test_that("testShouldBeAbleToSwitchToAFrameByItsName", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame("fourth") %>%
    findElement("tag name", "frame") %>%
    getElementAttribute("name")
  expect_identical(result, "child1")
}
)

test_that("testShouldBeAbleToSwitchToAnIframeByItsName", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    switchToFrame("iframe1-name") %>%
    findElement("name", "id-name1") %>%
    getElementAttribute("value")
  expect_identical(result, "name")
}
)

test_that("testShouldBeAbleToSwitchToAFrameByItsID", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("id", "fifth")) %>%
    findElement("name", "windowOne") %>%
    getElementText
  expect_identical(result, "Open new window")
}
)

test_that("testShouldBeAbleToSwitchToAnIframeByItsID", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    switchToFrame(remDr %>% findElement("id", "iframe1")) %>%
    findElement("name", "id-name1") %>%
    getElementAttribute("value")
  expect_identical(result, "name")
}
)

test_that("testShouldBeAbleToSwitchToFrameWithNameContainingDot", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("id", "sixth.iframe1")) %>%
    findElement("tag name", "body") %>%
    getElementText
  expect_identical(result, "")
}
)

test_that("testBeAbleToSwitchToAFrameUsingAPreviouslyLocatedWebElement", {
  skip_on_cran()
  frame <- remDr %>% go(loadPage("frameset")) %>%
    findElement("tag name", "frame")
  result <- remDr %>% switchToFrame(frame)%>%
    findElement("tag name", "body") %>%
    getElementText
  expect_identical(result, "")
}
)

test_that("testBeAbleToSwitchToIFrameUsingAPreviouslyLocatedWebElement", {
  skip_on_cran()
  frame <- remDr %>% go(loadPage("iframes")) %>%
    findElement("tag name", "iframe")
  result <- remDr %>% switchToFrame(frame)%>%
    findElement("name", "id-name1") %>%
    getElementAttribute("value")
  expect_identical(result, "name")
}
)

test_that("testShouldEnsureElementIsAFrameBeforeSwitching", {
  skip_on_cran()
  frame <- remDr %>% go(loadPage("frameset")) %>%
    findElement("tag name", "frameset")
  expect_error(remDr %>% switchToFrame(frame, retry = FALSE))
  expect_identical(errorContent()$status, 8L)
}
)

test_that("testFrameSearchesShouldBeRelativeToTheCurrentlySelectedFrame", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "second")) %>%
    getPageSource %>%
    xml_find_all("//body")
  expect_identical(length(result), 1L)
}
)

test_that("testShouldSelectChildFramesByChainedCalls", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "fourth")) %>%
    switchToFrame(remDr %>% findElement("name", "child2")) %>%
    findElement("tag", "body") %>%
    getElementText
  expect_identical(result, "")
}
)

test_that("testThrowExceptionLookingUpSubFramesWithSuperFrameNames", {
  skip_on_cran()
  expect_error(remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "fourth")) %>%
    switchToFrame(remDr %>% findElement("name", "second", retry = FALSE)))
  expect_identical(errorContent()$status, 7L)
}
)

test_that("testShouldThrowAnExceptionWhenAFrameCannotBeFound", {
  skip_on_cran()
  expect_error(
    result <- remDr %>% go(loadPage("xhtmlTest")) %>%
      switchToFrame(remDr %>% findElement("name", "Nothing here",
                                          retry = FALSE))
  )
  expect_identical(errorContent()$status, 7L)
}
)

test_that("testShouldThrowAnExceptionWhenAFrameCannotBeFoundByIndex", {
  skip_on_cran()
  expect_error(
    result <- remDr %>% go(loadPage("xhtmlTest")) %>%
      switchToFrame(27, retry = FALSE)
  )
  expect_identical(errorContent()$status, 8L)
}
)

test_that("testShouldBeAbleToSwitchToParentFrame", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "fourth")) %>%
    switchToParentFrame %>%
    switchToFrame(remDr %>% findElement("name", "fourth")) %>%
    findElement("name", "child2") %>%
    getElementText
  expect_identical(result, "")
}
)

test_that("testShouldBeAbleToSwitchToParentFrameFromASecondLevelFrame", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "fourth")) %>%
    switchToFrame(remDr %>% findElement("name", "child1")) %>%
    switchToParentFrame %>%
    switchToFrame(remDr %>% findElement("name", "child2"))  %>%
    findElement("tag", "body") %>%
    getElementText
  expect_identical(result, "")
}
)

test_that("testSwitchingToParentFrameFromDefaultContextIsNoOp", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("xhtmlTest")) %>%
    switchToParentFrame %>%
    getTitle
  expect_identical(result, "XHTML Test Page")
}
)

test_that("testShouldBeAbleToSwitchToParentFromAnIframe", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    switchToFrame(0L) %>%
    switchToParentFrame %>%
    findElement("id", "iframe_page_heading")
  expect_true(inherits(result, "wElement"))
}
)

# ----------------------------------------------------------------------------------------------
#
# General frame handling behavior tests
#
# ----------------------------------------------------------------------------------------------

test_that("testShouldAllowTheUserToSwitchToAnIFrameAndRemainFocusedOnIt", {
  skip_on_cran()
  remDr %>% go(loadPage("iframes")) %>%
    switchToFrame(0L) %>%
    findElement("id", "submitButton") %>%
    elementClick
  result <- remDr %>% findElement("id", "greeting") %>%
    getElementText
  expect_identical(result, "Success!")
}
)

test_that("testShouldBeAbleToClickInAFrame", {
  skip_on_cran()
  remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "third")) %>%
    findElement("id", "submitButton") %>%
    elementClick
  result <- remDr %>% findElement("id", "greeting") %>%
    getElementText
  expect_identical(result, "Success!")
}
)

test_that("testShouldBeAbleToClickInAFrameThatRewritesTopWindowLocation", {
  skip_on_cran()
  remDr %>% go(loadPage("click_tests/issue5237")) %>%
    switchToFrame(remDr %>% findElement("id", "search")) %>%
    findElement("id", "submit") %>%
    elementClick()
  result <- remDr %>% getTitle
  expect_identical(result, "Target page for issue 5237")
}
)

test_that("testShouldBeAbleToClickInASubFrame", {
  skip_on_cran()
  remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("id", "sixth")) %>%
    switchToFrame(remDr %>% findElement("id", "iframe1")) %>%
    findElement("id", "submitButton") %>%
    elementClick
  result <- remDr %>% findElement("id", "greeting") %>%
    getElementText
  expect_identical(result, "Success!")
}
)

test_that("testShouldBeAbleToFindElementsInIframesByXPath", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    switchToFrame(remDr %>% findElement("id", "iframe1")) %>%
    findElement("xpath", "//*[@id = 'changeme']")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testGetCurrentUrlReturnsTopLevelBrowsingContextUrl", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    getCurrentUrl
  expect_identical(result, loadPage("frameset"))
  result <- remDr %>%
    switchToFrame(remDr %>% findElement("name", "second")) %>%
    getCurrentUrl
  expect_identical(result, loadPage("frameset"))
}
)

test_that("testGetCurrentUrlReturnsTopLevelBrowsingContextUrlForIframes", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("iframes")) %>%
    getCurrentUrl
  expect_identical(result, loadPage("iframes"))
  result <- remDr %>%
    switchToFrame(remDr %>% findElement("id", "iframe1")) %>%
    getCurrentUrl
  expect_identical(result, loadPage("iframes"))
}
)

test_that("testShouldSwitchToTheTopIfTheFrameIsDeletedFromUnderUs", {
  skip_on_cran()
  remDr %>% go(loadPage("frame_switching_tests/deletingFrame")) %>%
    switchToFrame(remDr %>% findElement("id", "iframe1")) %>%
    findElement("id", "killIframe") %>%
    elementClick
  expect_error(remDr %>% findElement("id", "iframe1", retry = FALSE))
  remDr %>% findElement("id", "addBackFrame") %>%
    elementClick
  result <- remDr %>% findElement("id", "iframe1")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testShouldSwitchToTheTopIfTheFrameIsDeletedFromUnderUs", {
  skip_on_cran()
  remDr %>% go(loadPage("frame_switching_tests/deletingFrame")) %>%
    switchToFrame(0L) %>%
    findElement("id", "killIframe") %>%
    elementClick
  remDr %>% findElement("id", "addBackFrame") %>%
    elementClick
  result <- remDr %>% switchToFrame(0L) %>%
    findElement("id", "success")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testShouldSwitchToTheTopIfTheFrameIsDeletedWithWebelement", {
  skip_on_cran()
  remDr %>% go(loadPage("frame_switching_tests/deletingFrame")) %>%
    switchToFrame(remDr %>% findElement("id", "iframe1")) %>%
    findElement("id", "killIframe") %>%
    elementClick
  remDr %>% findElement("id", "addBackFrame") %>%
    elementClick
  webElem <- remDr %>% findElement("id", "iframe1")
  result <- remDr %>% switchToFrame(webElem) %>%
    findElement("id", "success")
  expect_true(inherits(result, "wElement"))
}
)

test_that("testShouldReturnWindowTitleInAFrameset", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    switchToFrame(remDr %>% findElement("name", "third")) %>%
    getTitle
  expect_identical(result, "Unique title")
}
)

test_that("testJavaScriptShouldExecuteInTheContextOfTheCurrentFrame", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("frameset")) %>%
    executeScript("return window == window.top")
  expect_true(result)
  result <- remDr %>%
    switchToFrame(remDr %>% findElement("name", "third")) %>%
    executeScript("return window != window.top")
  expect_true(result)
}
)
