library(testthat)
library(seleniumPipes)
if(Sys.getenv("NOT_CRAN") == "true"){
  test_check("seleniumPipes", "alerts", invert = TRUE)
}
