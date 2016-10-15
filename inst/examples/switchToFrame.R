remDr <- remoteDr()
remDr %>% go("https://cran.r-project.org/")
remDr %>% getTitle()
frames <- remDr %>%  getPageSource() %>%
  xml_find_all("//frame") %>%
  xml_attr("name")

# switch to main body
remDr %>% switchToFrame(frames[3])
remDr %>%  getPageSource() %>% xml_find_all("//a")
remDr %>%  getPageSource() %>% xml_find_all("//a") %>% length
#[1] 17

# switch back to main frame

remDr %>% switchToFrame()
remDr %>%  getPageSource() %>% html_structure()

# switch to side bar
remDr %>% switchToFrame(frames[2])
remDr %>%  getPageSource() %>% xml_find_all("//a")
remDr %>%  getPageSource() %>% xml_find_all("//a") %>% length
# [1] 13

remDr %>% deleteSession()
