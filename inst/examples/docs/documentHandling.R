\dontrun{
remDr <- remoteDr()
# Get the page source
remDr %>% go("https://www.google.com/ncr") %>%
  getPageSource

remDr %>% getTitle()
webElem <- remDr %>% findElement("css", "img#hplogo")
# check if the logo is hidden
remDr %>% executeScript("return document.getElementById('hplogo').hidden;", args = list())
# [1] FALSE
# hide the logo
remDr %>% executeScript("document.getElementById('hplogo').hidden = true;", args = list())
# Make the logo visible this time passing a web Element as an argument
remDr %>% executeScript(script = "return arguments[0].hidden = false;", args = list(webElem))

# Pass arguments
remDr %>% executeScript(script = "return argument[1] + argument[2];"
                        , args = list(1, 2))

# Return a web Element
remDr %>% executeScript(script = "return document.getElementById('hplogo');", args = list())
# ElementId: 0
# Remote Driver:
#   Remote Ip Address: http://localhost:4444/wd/hub
# Remote sessionId: 9a83672a-d72b-4873-aa7d-96f7f1f80fa0

# Return a web Element in a more complex object
script <- "var test ={num:1, str:'a', el:document.getElementById('hplogo')};return test;"
remDr %>% executeScript(script = script
                        , args = list())
# $str
# [1] "a"
#
# $num
# [1] 1
#
# $el
# ElementId: 0
# Remote Driver:
#   Remote Ip Address: http://localhost:4444/wd/hub
# Remote sessionId: 9a83672a-d72b-4873-aa7d-96f7f1f80fa0

# Run with replace = FALSE
remDr %>% executeScript(script = script
                        , args = list(), replace = FALSE)
# $str
# [1] "a"
#
# $num
# [1] 1
#
# $el
# $el$ELEMENT
# [1] "0"

remDr %>% setTimeout("script")

asScript <- "setTimeout(function(){arguments[arguments.length -1]('DONE');},5000); "
system.time(test1 <- remDr %>% executeAsyncScript(asScript, args = list()))
sScript <- "setTimeout(function(){},5000); return 'DONE';"
system.time(test2 <- remDr %>% executeScript(sScript, args = list()))


remDr %>% deleteSession()

}
