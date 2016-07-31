seleniumPipes - lightweight implementation of w3c wedriver specification
==========================

### Install

To install seleniumPipes run:

```
devtools::install_github("johndharrison/seleniumPipes")
```

To get started using `seleniumPipes` you can look at the following example

```
library(seleniumPipes)
library(RSelenium) # start a server with utility function
RSelenium::startServer()
remDr <- remoteDr()
remDr %>% go(url = "http://www.google.com")
remDr %>% go(url = "http://www.bbc.com")
```
