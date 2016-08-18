remDr <- remoteDr()
remDr %>% go("https://www.google.com/ncr")
remDr %>% getTitle()
sScript <- "setTimeout(function(){alert('HELLO')},1000); return 'DONE';"
remDr %>% executeScript(sScript, args = list())
remDr %>% dismissAlert()

sScript <- "setTimeout(function(){confirm('Press a button')},1000); return 'DONE';"
remDr %>% executeScript(sScript, args = list())
remDr %>% acceptAlert()

sScript <- "setTimeout(function(){confirm('Press a button')},1000); return 'DONE';"
remDr %>% executeScript(sScript, args = list())
remDr %>% getAlertText()
remDr %>% dismissAlert()


sScript <- "setTimeout(function(){prompt('Please enter your name', '')},1000); return 'DONE';"
remDr %>% executeScript(sScript, args = list())
remDr %>% getAlertText()
remDr %>% sendAlertText("Buck Rogers?")

remDr %>% deleteSession()
