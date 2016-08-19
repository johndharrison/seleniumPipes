\dontrun{
  remDr <- remoteDr()
  remDr %>% go("http://www.google.com/ncr")

  # find the search form query box and search for "R project"
  webElem <- remDr %>% findElement("name", "q") %>%
    elementSendKeys("R project", key = "enter")
  # click the first link hopefully should be www.r-project.org
  remDr %>% findElement("css", "h3.r a") %>% elementClick

  # get the navigation div
  navElem <- remDr %>% findElement("css", "div[role='navigation']")

  # find all the links in this div
  navLinks <- navElem %>% findElementsFromElement("css", "a")

  # check the links
  nLinks <- sapply(navLinks, function(x) x %>% getElementText)

  # compare with all links
  allLinks <- remDr %>% findElements("css", "a")
  aLinks <- sapply(allLinks, function(x) x %>% getElementText)

  # show the effect of searching for elements from element
  aLinks %in% nLinks

  remDr %>% deleteSession
}

