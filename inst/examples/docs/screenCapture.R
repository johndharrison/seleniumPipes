\dontrun{
  remDr <- remoteDr()
  remDr %>% go("http://www.google.com/ncr")
  remDr %>% takeScreenshot

  # select the search box
  searchElem <- remDr %>% findElement("name", "q")
  #searchElem %>% takeElementScreenshot()
}

