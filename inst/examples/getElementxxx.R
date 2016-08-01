# examples for getE

remDr <- remoteDr()
remDr %>% go("https://www.google.com/ncr")
remDr %>% getTitle()
# usually google names its search box name="q"
webElem <- remDr %>% findElement("name", "q")
# observe the structure
webElem %>% getElementAttribute("outerHTML") %>% read_html %>% html_structure
# <html>
# <body>
#  <input#lst-ib .gsfi.lst-d-f [spellcheck, dir, style, aria-autocomplete, role, aria-haspopup
#    , maxlength, name, autocomplete, title, value, aria-label, type]>

webElem %>% getElementAttribute("id")
# [1] "lst-ib"
webElem %>% getElementCssValue("color")
# [1] "rgba(0, 0, 0, 1)"
webElem %>% getElementCssValue("font-family")
# [1] "arial,sans-serif"

# search for google search button (Usually has text = Google Search)
webElem <- remDr %>% findElement("xpath", "//input[@value='Google Search']")
webElem  %>% getElementTagName()
# [1] "input"

webElem  %>% getElementRect()  %>% str
# List of 8
# $ x        : int 463
# $ width    : int 132
# $ y        : int 392
# $ hCode    : int -2121007104
# $ dimension: NULL
# $ class    : chr "org.openqa.selenium.Rectangle"
# $ point    : NULL
# $ height   : int 36

remDr %>% deleteSession()
