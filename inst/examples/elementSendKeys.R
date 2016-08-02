# example for elementSendkeys and elementClear and elementClick
remDr <- remoteDr()
remDr %>% go("https://www.google.com/ncr")
remDr %>% getTitle()
# usually google names its search box name="q"
webElem <- remDr %>% findElement("name", "q")
webElem %>% elementSendKeys(list("Q project"))
webElem %>% elementClear()
webElem %>% elementSendKeys(list("R project", key = "enter"))
webElem %>% elementClear()
# this time click the search button
webElem %>% elementSendKeys(list("R project"))
searchButton <- remDr %>% findElement("xpath", "//button[@value='Search']")
searchButton %>% elementClick

# for now google urls search returns are designated h3[@class = 'r']

firstResult <- remDr %>% findElement("xpath", "//h3[@class = 'r']")
firstResult %>% elementClick

remDr %>% deleteSession()
