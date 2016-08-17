\dontrun{
# assume a server is running at default location
remDr <- remoteDr()
remDr %>% go("https://www.google.com/ncr") %>%
  getTitle()
# get the cookies
remDr %>% getCookie()
# get a named cookie
remDr %>% getCookie("NID")
# add our own cookie
remDr %>% addCookie(name = "myCookie", value = "12")
# check its value
remDr %>% getCookie("myCookie")
# delete our cookie
remDr %>% deleteCookie("myCookie")
# check its deleted
remDr %>% getCookie("myCookie")

# delete all cookies
remDr %>% getCookie()
remDr %>% deleteAllCookies() %>%
  getCookie()

remDr %>% deleteSession()
}
