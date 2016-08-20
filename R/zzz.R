.onLoad <- function(libname = find.package("seleniumpipes"), pkgname = "seleniumpipes"){
  op <- options()
  op.seleniumPipes <- list(
    seleniumPipes_SL = FALSE,
    seleniumPipes_selOptions = list(),
    seleniumPipes_sauceID = "",
    seleniumPipes_display_screenshot = TRUE,
    seleniumPipes_retry = 3,
    seleniumPipes_retry_delay = 5000

  )
  toset <- !(names(op.seleniumPipes) %in% names(op))
  if(any(toset)) options(op.seleniumPipes[toset])
  invisible()
}

.e <- new.env(parent = emptyenv())
.e$sessionId <- list()
