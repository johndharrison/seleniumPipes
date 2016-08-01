seleniumPipes
==========================

##### *A lightweight implementation of w3c wedriver specification*

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
remDr %>% back()
remDr %>% forward()
remDr %>% refresh()
remDr %>% go("https://cloud.r-project.org/") %>% getPageSource()
# {xml_document}
# <html>
# [1] <head>\n<title>The Comprehensive R Archive Network</title>\n<meta content="text/html; charset=u ...
# [2] <frameset style="border: none;" cols="1*, 4*">\n<frameset rows="120, 1*">\n<frame frameborder=" ...

remDr %>% getPageSource() %>% xml_find_all("//frame") %>% xml_attr("name")
 
# [1] "logo"     "contents" "banner"  

```
