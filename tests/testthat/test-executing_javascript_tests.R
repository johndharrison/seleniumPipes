context("executing_javascript_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser; loadPage <- init$loadPage
on.exit(remDr %>% deleteSession())

test_that("testShouldBeAbleToExecuteSimpleJavascriptAndReturnAString", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("xhtmlTest")) %>%
    executeScript("return document.title")
  expect_true(inherits(result, "character"))
  expect_equal("XHTML Test Page", result)
}
)

test_that("testShouldBeAbleToExecuteSimpleJavascriptAndReturnAnInteger", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("nestedElements")) %>%
    executeScript("return document.getElementsByName('checky').length")
  expect_true(inherits(result, "integer"))
  expect_gt(result, 1)
}
)

test_that("testShouldBeAbleToExecuteSimpleJavascriptAndReturnAWebElement", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("xhtmlTest")) %>%
    executeScript("return document.getElementById('id1')")
  expect_true(inherits(result, "wElement"))
  expect_equal(result %>% getElementTagName, "a")
}
)

test_that("testShouldBeAbleToExecuteSimpleJavascriptAndReturnABoolean", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("xhtmlTest")) %>%
    executeScript("return true")
  expect_true(inherits(result, "logical"))
  expect_true(result)
}
)

test_that("testShouldBeAbleToExecuteSimpleJavascriptAndAStringsArray", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return ['zero', 'one', 'two']")
  expectedResult <- list('zero', 'one', 'two')
  expect_identical(result, expectedResult)
}
)

test_that("testShouldBeAbleToExecuteSimpleJavascriptAndReturnAnArray", {
  skip_on_cran()
  result <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return ['zero', [true, false]]")
  expectedResult <- list('zero', list(TRUE, FALSE))
  expect_identical(result, expectedResult)
}
)

test_that("testPassingAndReturningAnIntShouldReturnAWholeNumber", {
  skip_on_cran()
  expectedResult <- 1L
  result <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0]", list(expectedResult))
  expect_true(inherits(result, "integer"))
  expect_identical(result, expectedResult)
}
)

test_that("testPassingAndReturningADoubleShouldReturnADecimal", {
  skip_on_cran()
  expectedResult <- 1.2
  result <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0]", list(expectedResult))
  expect_true(inherits(result, "numeric"))
  expect_identical(result, expectedResult)
}
)

test_that("testShouldThrowAnExceptionWhenTheJavascriptIsBad", {
  skip_on_cran()
  expect_error(remDr %>% go(loadPage("xhtmlTest")) %>%
    executeScript("return squiggle()", retry = FALSE))
}
)

test_that("testShouldBeAbleToCallFunctionsDefinedOnThePage", {
  skip_on_cran()
  remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("displayMessage('I like cheese')")
  text <- remDr %>% findElement("id", "result") %>%
    getElementText
  expect_identical(text, 'I like cheese')
}
)

test_that("testShouldBeAbleToPassAStringAnAsArgument", {
  skip_on_cran()
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0] == 'fish' ? 'fish' : 'not fish'"
                  , list("fish"))
  expect_identical(value, "fish")
}
)

test_that("testShouldBeAbleToPassABooleanAnAsArgument", {
  skip_on_cran()
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0] == true"
                  , list(TRUE))
  expect_true(value)
}
)

test_that("testShouldBeAbleToPassANumberAnAsArgument", {
  skip_on_cran()
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0] == 1 ? true : false"
                  , 1L)
  expect_true(value)
}
)

test_that("testShouldBeAbleToPassAWebElementAsArgument", {
  skip_on_cran()
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("arguments[0]['flibble'] = arguments[0].getAttribute('id'); return arguments[0]['flibble']"
                  , list(remDr %>% findElement("id", "plainButton")))
  expect_identical(value, "plainButton")
}
)

test_that("testShouldBeAbleToPassAnArrayAsArgument", {
  skip_on_cran()
  array <- list("zerohero", 1, TRUE, 3.14159)
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0].length"
                  , list(array))
  expect_equal(value, length(array))
}
)

test_that("testShouldBeAbleToPassInMoreThanOneArgument", {
  skip_on_cran()
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return arguments[0] + arguments[1]"
                  , list("one", "two"))
  expect_identical(value, "onetwo")
}
)

test_that("testJavascriptStringHandlingShouldWorkAsExpected", {
  skip_on_cran()
  value <- remDr %>% go(loadPage("javascriptPage")) %>%
    executeScript("return ''")
  expect_identical(value, "")
  value <- remDr %>% executeScript("return undefined")
  expect_identical(value, NULL)
  value <- remDr %>% executeScript("return ' '")
  expect_identical(value, " ")
}
)

test_that("testShouldBeAbleToCreateAPersistentValue", {
  skip_on_cran()
  remDr %>% go(loadPage("formPage")) %>%
    executeScript("document.alerts = []")
  remDr %>% executeScript("document.alerts.push('hello world')")
  text <- remDr %>% executeScript("return document.alerts.shift()")
  expect_identical(text, "hello world")
}
)

test_that("testCanPassANone", {
  skip_on_cran()
  res <- remDr %>% go(loadPage("simpleTest")) %>%
    executeScript("return arguments[0] === null", list(NA))
  expect_true(res)
}
)
