remDr <- remoteDr()
remDr %>% go("https://cran.r-project.org/")
remDr %>% getTitle()
frames <- remDr %>%  getPageSource() %>% xml_find_all("//frame") %>% xml_attr("name")

# Switch to the main body
webElem <- remDr %>% findElements("css", "frame")
remDr %>% switchToFrame(webElem[[3]])

# find the table 2nd row
webElem <- remDr %>% findElement("css", "table tr:nth-child(2)")
# from the 2nd row of the table get the links
links <- webElem %>% findElementsFromElement("css", "a")

remDr %>% deleteSession()
