seleniumPipes
==========================
| CRAN version       | Travis build status    | SauceTests  |
| :-------------: |:-------------:|:-------------:|
| [![](http://www.r-pkg.org/badges/version/seleniumPipes)](http://cran.rstudio.com/web/packages/seleniumPipes/index.html) | [![Build Status](https://travis-ci.org/johndharrison/seleniumPipes.svg?branch=master)](https://travis-ci.org/johndharrison/seleniumPipes) | [![Sauce Test Status](https://saucelabs.com/buildstatus/seleniumPipes)](https://saucelabs.com/u/seleniumPipes) |


 

#### Selenium test status


[![Sauce Test Status](https://saucelabs.com/browser-matrix/seleniumPipes.svg)](https://saucelabs.com/u/seleniumPipes)

##### *A lightweight implementation of w3c webdriver specification*

### Introduction

seleniumPipes is a lightweight implementation of the [w3c webdriver specification](https://w3c.github.io/webdriver/webdriver-spec.html).
It has been built utilising `xml2`, `httr` and `magrittr` so provides an alternative for users who are familiar with piping.

### Install

To install seleniumPipes from CRAN

```
install.packages("seleniumPipes")
```


To install the current developement version of seleniumPipes run:

```
devtools::install_github("johndharrison/seleniumPipes")
```

### Getting started

The easiest way to start is to look at the Basic operations vignette:

* [seleniumpipes: Basic Operation](http://rpubs.com/johndharrison/seleniumPipes-basic)

Failing this a few basic examples are presented below:

Get started using `seleniumPipes` you can look at the following example

```
library(seleniumPipes)
library(RSelenium) # start a server with utility function
selServ <- RSelenium::startServer()
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

remDr %>% deleteSession()
selServ$stop()
```

### Piping

Piping in `seleniumPipes` is achieved using the pipe operator from `magrittr `%>%`:

```
remDr %>% go("http://www.google.com/ncr") %>% 
  findElement("name", "q") %>% 
  elementSendKeys("R project", key = "enter")
  
```

Functions relating to the remote driver which would not be expected to return data can
be expected to return the remote driver. Functions relating to a web element which would not be expected to return data can be expected to return the web element. This allows chaining of commands as shown above.

Further examples are available on install in the examples directory.

### Builtin retry of Endpoints

```
remDr <- remoteDr()
webElem <- remDr %>% go("http://www.google.com/ncr") %>% 
  findElement("name", "q")

# change the name of q with an 8 second delay
myscript <- "var myElem = arguments[0]; window.setTimeout(function(){
 myElem.setAttribute('name','funkyname');
}, 8000);"
remDr %>% executeScript(myscript, args = list(webElem))

newWebElem <- remDr %>% findElement("name", "funkyname")

# > newWebElem <- remDr %>% findElement("name", "funkyname")
# 
# Calling  findElement  - Try no:  1  of  3 
# 
# Calling  findElement  - Try no:  2  of  3 

newWebElem %>% getElementAttribute("name")
```
