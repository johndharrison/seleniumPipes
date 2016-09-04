context("api_example_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser; loadPage <- init$loadPage
on.exit(remDr %>% deleteSession())

#1
test_that("GetTitle", {
  skip_on_cran()
  title <- remDr %>% go(loadPage("simpleTest")) %>%
    getTitle()
  expect_equal("Hello WebDriver", title)
}
)

#2
test_that("GetCurrentUrl", {
  skip_on_cran()
  getCurrentUrl <- remDr %>% go(loadPage("simpleTest")) %>%
    getCurrentUrl()
  expect_equal(loadPage("simpleTest"), getCurrentUrl)
}
)

#3
test_that("FindElementsByXPath", {
  skip_on_cran()
  findElementText <- remDr%>% go(loadPage("simpleTest")) %>%
    findElement(using = "xpath", "//h1") %>% getElementText()

  expect_equal("Heading", findElementText)
}
)

#4-5
test_that("FindElementByXpathThrowNoSuchElementException", {
  skip_on_cran()
  expect_error(
    findElementText <- remDr%>% go(loadPage("simpleTest")) %>%
      findElement(using = "xpath", "//h4", retry = FALSE) %>% getElementText()
  )
  expect_equal(7, errorContent()$status)
}
)

#6-7
test_that("FindElementsByXpath", {
  skip_on_cran()
  elems <- remDr %>% go(loadPage("nestedElements")) %>%
    findElements(using = "xpath", "//option")
  expect_equal(48, length(elems))
  expect_equal("One", elems[[1]] %>% getElementAttribute("value"))
}
)

#8
test_that("FindElementsByName", {
  skip_on_cran()
  elem <- remDr %>% go(loadPage("xhtmlTest")) %>%
    findElement(using = "name", "windowOne")
  expect_equal("Open new window", elem %>% getElementText)
}
)

#9
test_that("FindElementsByNameInElementContext", {
  skip_on_cran()
  childElem <- remDr %>% go(loadPage("nestedElements")) %>%
    findElement(using = "name", "form2") %>%
    findElementFromElement(using = "name", "selectomatic")
  expect_equal("2", childElem %>% getElementAttribute("id"))
}
)

#10
test_that("FindElementsByLinkTextInElementContext", {
  skip_on_cran()
  childElem <- remDr %>% go(loadPage("nestedElements")) %>%
    findElement(using = "name", "div1") %>%
    findElementFromElement(using = "link text", "hello world")
  expect_equal("link1", childElem %>% getElementAttribute("name"))
}
)

#11
test_that("FindElementByIdInElementContext", {
  skip_on_cran()
  childElem <- remDr %>% go(loadPage("nestedElements")) %>%
    findElement(using = "name", "form2") %>%
    findElementFromElement(using = "id", "2")
  expect_equal("selectomatic", childElem %>% getElementAttribute("name"))
}
)

#12
test_that("FindElementByXpathInElementContext", {
  skip_on_cran()
  childElem <- remDr %>% go(loadPage("nestedElements")) %>%
    findElement(using = "name", "form2") %>%
    findElementFromElement(using = "xpath", "select")
  expect_equal("2", childElem %>% getElementAttribute("id"))
}
)

#13-14
test_that("FindElementByXpathInElementContextNotFound", {
  skip_on_cran()
  expect_error(remDr %>% go(loadPage("nestedElements")) %>%
                 findElement(using = "name", "form2") %>%
                 findElementFromElement(using = "xpath", "div", retry = FALSE))
  expect_equal(7, errorContent()$status)
}
)

#15
test_that("ShouldBeAbleToEnterDataIntoFormFields", {
  skip_on_cran()
  elem <- remDr %>% go(loadPage("xhtmlTest")) %>%
    findElement(using = "xpath", "//form[@name='someForm']/input[@id='username']") %>%
    elementClear() %>%
    elementSendKeys("some text")
  elem <- remDr %>% findElement(using = "xpath", "//form[@name='someForm']/input[@id='username']")
  expect_equal("some text", elem %>% getElementAttribute("value"))
}
)

#16-17
test_that("FindElementByTagName", {
  skip_on_cran()
  elems <-remDr %>% go(loadPage("simpleTest")) %>%
    findElements(using = "tag name", "div")
  num_by_xpath <- length(remDr %>% findElements(using = "xpath", "//div"))
  expect_equal(num_by_xpath, length(elems))
  elems <- remDr %>% findElements(using = "tag name", "iframe")
  expect_equal(0, length(elems))
}
)

#18
test_that("FindElementByTagNameWithinElement", {
  skip_on_cran()
  elems <- remDr %>% go(loadPage("simpleTest")) %>%
    findElement(using = "id", "multiline") %>%
    findElementsFromElement(using = "tag name", "p")
  expect_true(length(elems) == 1)
}
)

#19-21
test_that("SwitchToWindow", {
  skip_on_cran()
  #if(rdBrowser == 'safari'){
  # see https://code.google.com/p/selenium/issues/detail?id=3693
  #return()
  #}
  title_1 = "XHTML Test Page"
  title_2 = "We Arrive Here"

  remDr %>% go (loadPage("xhtmlTest")) %>%
    findElement(using = "link text", "Open new window") %>% elementClick()
  expect_equal(title_1, remDr %>% getTitle)
  remDr %>% switchToWindow("result")
  #         wait.until(lambda dr: dr.switch_to_window("result") is None)
  expect_equal(title_2, remDr %>% getTitle)
  # close window and switch back to first one
  chk <- tryCatch({
    windows <- unlist(remDr %>% getWindowHandles)
    currentWindow <- remDr %>% getWindowHandle
    remDr %>% closeWindow() %>% switchToWindow(windows[!windows %in% currentWindow])
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    windows <- unlist(remDr %>% getWindowHandlesOld)
    currentWindow <- remDr %>% getWindowHandleOld
    remDr %>% closeWindow() %>% switchToWindow(windows[!windows %in% currentWindow])
  }
  expect_equal(title_1, remDr %>% getTitle)
}
)

####
test_that("SwitchFrameByName", {
  skip_on_cran()
  remDr %>% go(loadPage("frameset")) %>%
    switchToFrame("third") %>% findElement(using = "id", "checky") %>%
    elementClick()
}
)

#22-23
test_that("IsEnabled", {
  skip_on_cran()
  elem <- remDr %>% go(loadPage("formPage")) %>%
    findElement(using = "xpath", "//input[@id='working']")
  expect_true(elem %>% isElementEnabled)
  elem <- remDr %>% findElement(using = "xpath", "//input[@id='notWorking']")
  expect_false(elem %>% isElementEnabled)
}
)

#24-27
test_that("IsSelectedAndToggle", {
  skip_on_cran()
  if(rdBrowser == 'chrome' && package_version(remDr$sessionInfo$version)$major < 16){
    return("deselecting preselected values only works on chrome >= 16")
  }
  elem <- remDr %>% go(loadPage("formPage")) %>%
    findElement(using = "id", "multi")
  option_elems <-  elem %>% findElementsFromElement(using = "xpath", "option")
  expect_true(option_elems[[1]] %>% isElementSelected)
  option_elems[[1]] %>% elementClick
  expect_false(option_elems[[1]] %>% isElementSelected)
  option_elems[[1]] %>% elementClick
  expect_true(option_elems[[1]] %>% isElementSelected)
  expect_true(option_elems[[3]] %>% isElementSelected)
}
)

#28-30
test_that("Navigate", {
  skip_on_cran()
  # if(rdBrowser == 'safari'){
  # see http://code.google.com/p/selenium/issues/detail?id=3771&can=1&q=browser%3DSafari%20component%3DWebDriver%20status%3ANew%2CAccepted%2CWorkingAsIntended%2CWontFix%2CNotFeasible&colspec=ID%20Stars%20Type%20Status%20Priority%20Owner%20Summary%20Browser%20Component
  # return()
  # }

  remDr %>% go(loadPage("formPage")) %>%
    findElement(using = "id", "imageButton") %>% elementClick
  expect_equal("We Arrive Here", remDr %>% getTitle)
  remDr %>% seleniumPipes::back()
  expect_equal("We Leave From Here", remDr %>% getTitle)
  remDr %>% forward()
  expect_equal("We Arrive Here", remDr %>% getTitle)
}
)

#31
test_that("GetAttribute", {
  skip_on_cran()
  attr <- remDr %>% go(loadPage("xhtmlTest")) %>%
    findElement(using = "id", "id1") %>% getElementAttribute("href")
  expect_equal(paste0(loadPage("xhtmlTest"), "#"), attr)
}
)

#32-36
test_that("GetImplicitAttribute", {
  skip_on_cran()
  elems <- remDr %>% go(loadPage("nestedElements")) %>%
    findElements(using = "xpath", "//option")
  expect_true(length(elems) >= 3)
  for(x in seq(4)){
    expect_equal(x-1, as.integer(elems[[x]] %>% getElementAttribute("index")))
  }
}
)

#37
test_that("ExecuteSimpleScript", {
  skip_on_cran()
  chk <- tryCatch({
    title <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScript("return document.title;")
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    title <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScriptOld("return document.title;")
  }
  expect_equal("XHTML Test Page", title)
}
)

#38
test_that("ExecuteScriptAndReturnElement", {
  skip_on_cran()
  chk <- tryCatch({
    elem <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScript("return document.getElementById('id1');")
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    elem <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScriptOld("return document.getElementById('id1');")
  }
  expect_identical("wElement", class(elem))
}
)

#39
test_that("ExecuteScriptWithArgs", {
  skip_on_cran()
  chk <- tryCatch({
    result <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScript("return arguments[0] == 'fish' ? 'fish' : 'not fish';", list("fish"))
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    result <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScriptOld("return arguments[0] == 'fish' ? 'fish' : 'not fish';", list("fish"))
  }
  expect_equal("fish", result)
}
)

#40
test_that("ExecuteScriptWithMultipleArgs", {
  skip_on_cran()
  chk <- tryCatch({
    result <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScript("return arguments[0] + arguments[1]", list(1, 2))
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    result <- remDr %>% go(loadPage("xhtmlTest")) %>%
      executeScriptOld("return arguments[0] + arguments[1]", list(1, 2))
  }
  expect_equal(3, result)
}
)

#41
test_that("ExecuteScriptWithElementArgs", {
  skip_on_cran()
  chk <- tryCatch({
    button <- remDr %>% go(loadPage("javascriptPage")) %>%
      findElement(using = "id", "plainButton")
    appScript <- "arguments[0]['flibble'] = arguments[0].getAttribute('id'); return arguments[0]['flibble'];"
    result <- remDr %>% executeScript(appScript, list(button))
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    button <- remDr %>% go(loadPage("javascriptPage")) %>%
      findElement(using = "id", "plainButton")
    appScript <- "arguments[0]['flibble'] = arguments[0].getAttribute('id'); return arguments[0]['flibble'];"
    result <- remDr %>% executeScriptOld(appScript, list(button))
  }
  expect_equal("plainButton", result)
}
)

#42
test_that("FindElementsByPartialLinkText", {
  skip_on_cran()
  elem <- remDr %>% go(loadPage("xhtmlTest")) %>%
    findElement(using = "partial link text", "new window")
  expect_equal("Open new window", elem %>% getElementText)
}
)

#43-44
test_that("IsElementDisplayed", {
  skip_on_cran()
  visible <- remDr %>% go(loadPage("javascriptPage")) %>%
    findElement(using = "id", "displayed") %>% getElementCssValue("visibility")
  not_visible <- remDr %>% findElement(using = "id", "hidden")%>% getElementCssValue("visibility")
  expect_identical(visible, "visible")
  expect_identical(not_visible, "hidden")
}
)

#45-46
test_that("MoveWindowPosition", {
  skip_on_cran()
  if(rdBrowser == 'android' || rdBrowser == "safari"){
    print("Not applicable")
    return()
  }
  chk <- tryCatch({
    loc <- remDr %>% go(loadPage("blank")) %>%
      getWindowPosition(retry = FALSE)
    # note can't test 0,0 since some OS's dont allow that location
    # because of system toolbars
    new_x = 50
    new_y = 50
    if(loc[['x']] == new_x){
      new_x <- new_x + 10
    }
    if(loc['y'] == new_y){
      new_y <- new_y + 10
    }
    remDr %>% setWindowPosition(new_x, new_y)
    loc = remDr %>% getWindowPosition
  }, error = function(e) e)
  if(grepl("Selenium Server error", as.character(chk))){
    # try old functions
    loc <- remDr %>% go(loadPage("blank")) %>%
      getWindowPositionOld
    # note can't test 0,0 since some OS's dont allow that location
    # because of system toolbars
    new_x = 50
    new_y = 50
    if(loc[['x']] == new_x){
      new_x <- new_x + 10
    }
    if(loc['y'] == new_y){
      new_y <- new_y + 10
    }
    remDr %>% setWindowPositionOld(new_x, new_y)
    loc = remDr %>% getWindowPositionOld
  }
  # change test to be within 10 pixels
  expect_lt(abs(loc[['x']] - new_x), 10)
  expect_lt(abs(loc[['y']] - new_y), 10)
}
)

#47-48
test_that("ChangeWindowSize", {
  skip_on_cran()
  if(rdBrowser == 'android'){
    print("Not applicable")
    return()
  }
  size <- remDr %>% go(loadPage("blank")) %>%
    getWindowSize()
  newSize <- rep(600, 2)
  if( size[['width']] == 600){
    newSize[1] <- 500
  }
  if( size[['height']] == 600){
    newSize[2] <- 500
  }
  remDr %>% setWindowSize(newSize[1], newSize[2])
  size <- remDr %>% getWindowSize()
  # change test to be within 10 pixels
  expect_lt(abs(size[['width']] - newSize[1]), 10)
  expect_lt(abs(size[['height']] - newSize[2]), 10)
}
)

test_that("testShouldMaximizeTheWindow", {
  size <- remDr %>% go(loadPage("blank")) %>%
    setWindowSize(200,200) %>%
    getWindowSize
  new_size <- remDr %>% maximizeWindow %>%
    getWindowSize
  expect_gt(new_size[['width']], size[['width']])
  expect_gt(new_size[['height']], size[['height']])
}
)
