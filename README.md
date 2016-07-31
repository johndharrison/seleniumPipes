seleniumPipes - lightweight implementation of w3c wedriver specification
==========================

### Introduction

seleniumPipes is a lightweight implementation of the [w3c wedriver specification](https://w3c.github.io/webdriver/webdriver-spec.html).
It has been built utilising `xml2`, `httr` and `magrittr` so provides an alternative for users who are familiar with piping.

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
