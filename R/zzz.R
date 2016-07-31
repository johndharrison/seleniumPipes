.onLoad <- function(libname = find.package("seleniumpipes"), pkgname = "seleniumpipes"){
  op <- options()
  op.seleniumPipes <- list(
  )
  toset <- !(names(op.seleniumPipes) %in% names(op))
  if(any(toset)) options(op.seleniumPipes[toset])
  invisible()
}

.e <- new.env()
.e$sessionId <- NA
