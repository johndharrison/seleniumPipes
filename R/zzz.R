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
