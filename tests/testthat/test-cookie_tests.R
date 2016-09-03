context("cookie_tests")
init <- initFun()
remDr <- init$remDr; rdBrowser <- init$rdBrowser; loadPage <- init$loadPage
on.exit(remDr %>% deleteSession())


test_that("testAddCookie", {
  skip_on_cran()
  remDr %>% go(loadPage("simpleTest")) %>%
    executeScript("return document.cookie;")
  remDr %>% addCookie(name=  "foo",
                      value = "bar",
                      path = "/",
                      secure = FALSE)
  cookie_returned <- remDr %>% executeScript("return document.cookie;")
  expect_true(grepl("foo=bar", cookie_returned))
  remDr %>% deleteAllCookies
}
)

test_that("testAddingACookieThatExpiredInThePast", {
  skip_on_cran()
  remDr %>% go(loadPage("simpleTest")) %>%
    addCookie(name=  "foo",
              value = "bar",
              path = "/",
              secure = FALSE,
              expiry = as.integer(Sys.time() -100))
  cookies <- remDr %>% getAllCookies
  expect_equal(length(cookies), 0L)
  remDr %>% deleteAllCookies
}
)

test_that("testDeleteAllCookie", {
  skip_on_cran()
  remDr %>% go(loadPage("simpleTest")) %>%
    addCookie(name=  "foo",
                      value = "bar",
                      path = "/",
                      secure = FALSE)
  remDr %>% deleteAllCookies
  expect_equal(0L, length(remDr %>% getAllCookies))
  remDr %>% deleteAllCookies
}
)

test_that("testDeleteCookie", {
  skip_on_cran()
  remDr %>% go(loadPage("simpleTest")) %>%
    addCookie(name=  "foo",
              value = "bar",
              path = "/",
              secure = FALSE)
  remDr %>% deleteCookie(name = "foo")
  expect_equal(0L, length(remDr %>% getAllCookies))
  remDr %>% deleteAllCookies
}
)

test_that("testShouldGetCookieByName", {
  skip_on_cran()
  key <- sprintf("key_%d", as.integer(runif(1) * 10000000))
  remDr %>% go(loadPage("simpleTest")) %>%
    executeScript("document.cookie = arguments[0] + '=set';", list(key))
  cookie <- remDr %>% getNamedCookie(key)
  expect_equal(cookie$value, "set")
  remDr %>% deleteAllCookies
}
)

test_that("testGetAllCookies", {
  skip_on_cran()
  key1 <- sprintf("key_%d", as.integer(runif(1) * 10000000))
  key2 <- sprintf("key_%d", as.integer(runif(1) * 10000000))
  cookies <- remDr %>% go(loadPage("simpleTest")) %>%
    getAllCookies()
  count <- length(cookies)
  remDr %>% addCookie(name = key1, value = "value") %>%
    addCookie(name = key2, value = "value")
  cookies <- remDr %>% getAllCookies()
  expect_equal(count + 2, length(cookies))
  remDr %>% deleteAllCookies
}
)

test_that("testShouldNotDeleteCookiesWithASimilarName", {
  skip_on_cran()
  cookieOneName <- "fish"
  remDr %>% go(loadPage("simpleTest")) %>%
    addCookie(name = cookieOneName, value = "cod") %>%
    addCookie(name = paste0(cookieOneName, "x"), value = "earth") %>%
    deleteCookie(cookieOneName)
  cookies <- remDr %>% getAllCookies
  expect_false(identical(cookies[[1]][["name"]], cookieOneName))
  expect_equal(cookies[[1]][["name"]], paste0(cookieOneName, "x"))
  remDr %>% deleteAllCookies
}
)
