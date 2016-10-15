
#' @rdname takeElementScreenshot
takeElementScreenshot <-
  function(webElem, file = NULL,
           display = getOption("seleniumPipes_display_screenshot"),
           useViewer = !is.null(getOption("viewer")), returnPNG = FALSE,
           ...){
  obj <- webElem
  obj$sessionId <- webElem$sessionId(webElem$remDr$drvID)
  obj$elementId <- webElem$elementId$ELEMENT

  pT <- "/session/{{sessionId}}/element/{{elementId}}/screenshot"
  pathTemplate <- whisker.render(pT, data = obj)
  pathURL <- webElem[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
            source = "takeElementScreenshot", drvID = webElem$remDr$drvID,
            json = NULL,...)
  b64png <- base64_dec(res$value)
if(display){
  tmp <- file.path(tempdir(), 'tmpElementScreenShot.png')
  writeBin(b64png, tmp)
  viewer <- getOption("viewer")
  if (useViewer){
    viewer(tmp)
  }else{
    utils::browseURL(tmp)
  }
}
if(!is.null(file)){
  writeBin(b64png, file)
}
if(returnPNG){
  b64png
}else{
  invisible(webElem)
}

}



#' @rdname takeScreenshot
takeScreenshot <-
  function(remDr, file = NULL,
           display = getOption("seleniumPipes_display_screenshot"),
           useViewer = !is.null(getOption("viewer")), returnPNG = FALSE,
           ...){
  obj <- remDr
  obj$sessionId <- remDr$sessionId(remDr$drvID)

  pathTemplate <-
    whisker.render("/session/{{sessionId}}/screenshot", data = obj)
  pathURL <- remDr[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = GET, url = build_url(pathURL),
            source = "takeScreenshot",
            drvID = remDr$drvID, json = NULL,...)
  b64png <- base64_dec(res$value)
if(display){
  tmp <- file.path(tempdir(), 'tmpScreenShot.png')
  writeBin(b64png, tmp)
  viewer <- getOption("viewer")
  if (useViewer){
    viewer(tmp)
  }else{
    utils::browseURL(tmp)
  }
}
if(!is.null(file)){
  writeBin(b64png, file)
}
if(returnPNG){
  b64png
}else{
  invisible(remDr)
}

}

