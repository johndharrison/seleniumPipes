remDr <- remoteDr()
remDr %>% go("https://www.google.com/ncr")
remDr %>% getTitle()
# usually google names its search box name="q"
webElem <- remDr %>% findElement("name", "q")
webElem %>% elementSendKeys(list("R project", key = "enter"))

remDr %>% deleteSession()
