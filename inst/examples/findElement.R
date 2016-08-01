remDr <- remoteDr()
remDr %>% go("https://cran.r-project.org/")
remDr %>% getTitle()
frames <- remDr %>%  getPageSource() %>% xml_find_all("//frame") %>% xml_attr("name")

webElem <- remDr %>% findElement("css", "frame")

remDr %>% deleteSession()
