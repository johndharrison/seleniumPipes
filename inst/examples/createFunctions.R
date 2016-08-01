# utility script to get the w3c specs to create the functions in seleniumPipes
# assummed ran from the project base

library(xml2)
library(httr)
library(rvest)
library(data.table)
library(rapportools)
library(whisker)
appURL <- "https://w3c.github.io/webdriver/webdriver-spec.html"
doc <- read_html(appURL)
tabXpath <- "//section[h3[text()='List of Endpoints']]//table"
methPaths <- html_table(xml_find_all(doc, tabXpath))[[1]]
setDT(methPaths)
setnames(methPaths, names(methPaths), tocamel(tolower(names(methPaths))))
methPaths[,command := tocamel(tolower(command))]
methPaths[, uriTemplate := gsub("session id", "sessionId", uriTemplate)]
methPaths[, uriTemplate := gsub("element id", "elementId", uriTemplate)]
methPaths[, uriTemplate := gsub("\\{", "\\{\\{", uriTemplate)]
methPaths[, uriTemplate := gsub("\\}", "\\}\\}", uriTemplate)]
methPaths[, elemInd := grepl("\\{elementId\\}", uriTemplate)]
methPaths[, Arg := ifelse(elemInd, "webElem", "remDr")]

funcTemp <- list(
remDr = "#' {{command}}
#'
#' @param {{Arg}}
#'
#' @return
#' @export
#'
#' @examples

{{command}} <- function({{Arg}},{{{addArgs}}} ...){
  {{{JSON_command}}}
  obj <- {{Arg}}
  obj$sessionId <- {{Arg}}$sessionId()
  pathTemplate <- whisker.render(\"{{uriTemplate}}\", data = obj)
  pathURL <- {{Arg}}[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = {{method}}, url = build_url(pathURL), source = \"{{command}}\", json = {{JSON}},...)
  {{return}}
}


",
webElem = "#' {{command}}
#'
#' @param {{Arg}}
#'
#' @return
#' @export
#'
#' @examples

{{command}} <- function({{Arg}},{{{addArgs}}} ...){
{{{JSON_command}}}
obj <- {{Arg}}
obj$sessionId <- {{Arg}}$sessionId()
obj$elementId <- {{Arg}}$elementId$ELEMENT
pathTemplate <- whisker.render(\"{{uriTemplate}}\", data = obj)
pathURL <- {{Arg}}[['remDr']][['remServAdd']]
pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
res <- queryDriver(verb = {{method}}, url = build_url(pathURL), source = \"{{command}}\", json = {{JSON}},...)
{{return}}
}


")

# configure returns
selReturn <- list(
  ret1 = "invisible(remDr)"
  , ret2 = "res$value"
  , ret3 = "read_html(res$value)"
  , ret4 = "invisible(wbElement(res$value, remDr))"
  , ret5 = "invisible(lapply(res$value, wbElement, remDr = remDr))"
)

# list of POST type JSON commands

JCommands <- list(
  newSession = list( com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    desiredCapabilities =c(remDr$desiredCapabilities, remDr$extraCapabilities)
  ), auto_unbox = TRUE)
  ", args = NULL, type = "ret1"),

  go = list(com =  "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
     url = url
  ), auto_unbox = TRUE)
  ", args = " url,", type = "ret1"),

  back = list(com =  "
# Add function specific JSON to post
  jsonBody <- NULL
  ", type = "ret1"),


  forward = list(com =  "
# Add function specific JSON to post
  jsonBody <- NULL
  ", type = "ret1"),


  refresh = list(com =  "
# Add function specific JSON to post
  jsonBody <- NULL
  ", type = "ret1"),

  default = list(com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  ", type = "ret1"),

  getPageSource = list(type = "ret3"),

  getTitle = list(type = "ret2"),

  getWindowHandle = list(type = "ret2"),

  closeWindow = list(type = "ret1"),

  switchToWindow = list(
    com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    name = name
  ), auto_unbox = TRUE)
    ", args = " name,", type = "ret1"
  ),

  getWindowHandles = list(type = "ret2"),

  switchToFrame = list(
    com = "
# Add function specific JSON to post
  if(\"wElement\" %in% class(Id)){
    # pass the webElement as Json to SS
    Id <- Id$elementId
  }
  jsonBody <- toJSON(list(
    id = Id
  ), auto_unbox = TRUE, null = \"null\")
    ", args = " Id = NULL,", type = "ret1"
  ),

  switchToParentFrame = list(type = "ret1"),

  findElement = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  ", args = " using = c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\"), value,"
    , type = "ret4"
  ),

  findElementFromElement = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  " , args = " using = c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\"), value,"
    , type = "ret4"
  ),

  findElements = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  " , args = " using = c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\"), value,"
    , type = "ret5"
  ),

  findElementsFromElement = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  "  , args = " using = c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\"), value,"
    , type = "ret5"
  ),

  getActiveElement = list(type = "ret4")

)

selPipeFuncs <- lapply(rowSplit(methPaths), function(x){
  appFunc <- JCommands[[x[["command"]]]]
  if(identical(x[["method"]], "POST")){
    appCommand <- appFunc[["com"]]
    defCommand <- JCommands[["default"]][["com"]]
    x[["JSON_command"]] <- ifelse(!is.null(appCommand), appCommand, defCommand)
    x[["JSON"]] <- "jsonBody"
  }else{
    x[["JSON"]] <- "NULL"
  }
  x[["addArgs"]] <- JCommands[[x[["command"]]]][["args"]]
  type <- if(is.null(appFunc)){
    JCommands[["default"]][["type"]]
  }else{
    appFunc[["type"]]
  }
  x[["return"]] <- selReturn[[type]]
  whisker.render(funcTemp[[x$Arg]], x)
}
)
remDrFuncs <- paste(selPipeFuncs[!grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
webElemFuncs <- paste(selPipeFuncs[grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
write(remDrFuncs, "R/remoteDriver.R")
write(webElemFuncs, "R/webElement.R")

