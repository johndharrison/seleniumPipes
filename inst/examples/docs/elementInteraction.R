\dontrun{
  # start a brower
  remDr <- remoteDr()
  remDr %>% go("http://www.google.com/ncr")

  queryBox <- remDr %>% findElement("name", "q")

  # send text to the query box
  queryBox %>% elementSendKeys("Some ", "text")

  # clear the query box
  queryBox %>% elementClear

  # get the search button
  searchBtn <- remDr %>% findElement("name", "btnG")
  # send text to query box
  queryBox %>% elementSendKeys("R project")

  # click the search button
  searchBtn %>% elementClick

  # close browser
  remDr %>% deleteSession
}
