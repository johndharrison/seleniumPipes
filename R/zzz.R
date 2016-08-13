.onLoad <- function(libname = find.package("seleniumpipes"), pkgname = "seleniumpipes"){
  op <- options()
  op.seleniumPipes <- list(
    seleniumPipes_SL = FALSE,
    seleniumPipes_selOptions = list(),
    seleniumPipes_sauceID = ""
  )
  toset <- !(names(op.seleniumPipes) %in% names(op))
  if(any(toset)) options(op.seleniumPipes[toset])
  invisible()
}

.e <- new.env(parent = emptyenv())
.e$sessionId <- NA
