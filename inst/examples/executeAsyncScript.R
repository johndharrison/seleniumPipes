remDr <- remoteDr()
remDr %>% setTimeout("script")
remDr %>% go("https://www.google.com/ncr")
remDr %>% getTitle()
asScript <-
  "setTimeout(function(){arguments[arguments.length -1]('DONE');},5000); "
system.time(test1 <- remDr %>% executeAsyncScript(asScript, args = list()))
sScript <- "setTimeout(function(){},5000); return 'DONE';"
system.time(test2 <- remDr %>% executeScript(sScript, args = list()))

remDr %>% deleteSession()
