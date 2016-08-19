\dontrun{
  remDr <- remoteDr()
  remDr %>% go("http://www.google.com/ncr")

  # select the search box
  searchElem <- remDr %>% findElement("name", "q")

  # get the name of our element
  searchElem %>% getElementAttribute("name")

  # get the css background-color
  searchElem %>% getElementCssValue("background-color")
  blueScript <- "arguments[0].style.backgroundColor = 'blue';"
  remDr %>% executeScript(blueScript, list(searchElem))
  searchElem %>% getElementCssValue("background-color")

  # get the javascript property
  # searchElem %>% getElementProperty("backgroundColor")

  # get dimensions
  searchElem %>% getElementRect

  searchElem %>% getElementTagName

  # get some text and return it
  remDr %>% go("http://r-project.org")
  remDr %>% findElement("css", "h1") %>% getElementText

  # close browser
  remDr %>% deleteSession
}

