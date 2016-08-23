.onLoad <- function(libname = find.package("seleniumpipes"), pkgname = "seleniumpipes"){
  op <- options()
  op.seleniumPipes <- list(
    seleniumPipes_SL = FALSE,
    seleniumPipes_selOptions = list(),
    seleniumPipes_sauceID = "",
    seleniumPipes_display_screenshot = TRUE,
    seleniumPipes_no_try = 3L,
    seleniumPipes_no_try_delay = 5000L

  )
  toset <- !(names(op.seleniumPipes) %in% names(op))
  if(any(toset)) options(op.seleniumPipes[toset])
  invisible()
}

.e <- new.env(parent = emptyenv())
.e$sessionId <- list()

#' Implements the W3C webdriver specification.
#'
#' @section Package options:
#'
#' seleniumPipes uses the following \code{\link{options}} to configure behaviour:
#'
#' \itemize{
#'   \item \code{seleniumPipes_display_screenshot}: Logical value indicating whether to display
#'      PNG returned by \code{\link{takeScreenshot}} and \code{\link{takeElementScreenshot}}.
#'      Defaults to TRUE
#'
#'   \item \code{seleniumPipes_no_try}: An integer giving the number of time to try calling an endpoint
#'      on the Selenium Server. Defaults to 3 attempts
#'
#'   \item \code{seleniumPipes_no_try_delay}: An integer detailing the delay between attempts to
#'      call a failing endpoint on the Selenium Server. Defaults to 5000 miliseconds = 5 seconds.
#'
#'   \item \code{seleniumPipes_SL}: A logical value which acts as a flag indicating whether SauiceLabs is being
#'      used for package testing.
#'
#'   \item \code{seleniumPipes_selOptions}: A list used to store options to pass to \code{\link{remoteDr}}
#'      when running tests.
#'
#'   \item \code{seleniumPipes_sauceID}: A character used to store remote session ids when running SauceLab tests on the
#'      package.
#'
#' }
#' @docType package
#' @name seleniumPipes
NULL

#' Documetation of retry argument
#'
#' The ability to \code{retry} function code is enabled by default.
#' \code{retry} can be a logical value.
#'  if it is TRUE then \code{noTry = getOption("seleniumPipes_no_try")} and \code{delay = getOption("seleniumPipes_no_try_delay")}.
#'  If it is FALSE the facility to have multiple trys of the function call is removed. \code{retry} can also be
#'  a list with the following named arguments that will override the values in \code{options}
#'   \describe{
#'      \item{"noTry"}{Integer indicating how many times to try the function call}
#'      \item{"delay"}{Integer indicating delay between trys of the function call}
#'    }
#' @name retry
#' @examples
#' \dontrun{
#' remDr <- remoteDr()
#' webElem <- remDr %>% go("http://www.google.com/ncr") %>%
#'   findElement("name", "q")
#' # change the name of q with an 8 second delay
#' myscript <- "var myElem = arguments[0];
#' window.setTimeout(function(){
#'  myElem.setAttribute('name','funkyname');
#' }, 8000);"
#' remDr %>% executeScript(myscript, args = list(webElem))
#'
#' newWebElem <- remDr %>% findElement("name", "funkyname")
#'
#'# > newWebElem <- remDr %>% findElement("name", "funkyname")
#'#
#'# Calling  findElement  - Try no:  1  of  3
#'#
#'# Calling  findElement  - Try no:  2  of  3
#'
#' newWebElem %>% getElementAttribute("name")
#'
#' # compare with a function that will fail (no element present)
#' remDr %>% findElement("id", "i am not here", retry = list(noTry = 5, delay = 10))
#' remDr %>% findElement("id", "i am not here", retry = FALSE)
#' }
NULL
