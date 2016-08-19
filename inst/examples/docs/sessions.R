\dontrun{
  # start a driver without opening a browser
  remDr <- remoteDr(newSession = FALSE)

  # open a broswer
  remDr %>% newSession

  # set timeout on waiting for elements
  remDr %>% setTimeout(type = "implicit", 5000)

  # close Session
  remDr %>% deleteSession

}

