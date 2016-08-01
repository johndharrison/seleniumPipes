remDr <- remoteDr()
remDr %>% go("https://cran.r-project.org/")
remDr %>% getTitle()
frames <- remDr %>%  getPageSource() %>% xml_find_all("//frame") %>% xml_attr("name")

# Switch to the main body
webElem <- remDr %>% findElements("css", "frame")
remDr %>% switchToFrame(webElem[[3]])

# find the table
webElem <- remDr %>% findElement("css", "table")
# within the first row of the table get the 2nd link
link2 <- webElem %>% findElementFromElement("css", "li:nth-child(2) a")

remDr %>% deleteSession()
