\dontrun{
  remDr <- remoteDr()
  remDr %>% go("http://www.google.com/ncr")

  # get the title
  remDr %>% getTitle

  # get the current page url
  remDr %>% getCurrentUrl

  # navigate
  remDr %>% go("http://www.bbc.co.uk")

  # go back
  remDr %>% (seleniumPipes::back)

  # go forward
  remDr %>% forward

  # refresh page
  remDr %>% refresh

  # close browser
  remDr %>% deleteSession
}

