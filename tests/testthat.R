library(testthat)
library(seleniumPipes)
library(xml2)
if(Sys.getenv("NOT_CRAN") == "true"){
  test_check("seleniumPipes")
}
