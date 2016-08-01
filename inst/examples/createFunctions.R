# utility script to get the w3c specs to create the functions in seleniumPipes
# assummed ran from the project base

library(xml2)
library(httr)
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

funcTemp <- "#' {{command}}
#'
#' @param {{Arg}}
#'
#' @return
#' @export
#'
#' @examples

{{command}} <- function({{Arg}},{{addArgs}} ...){
  {{{JSON_command}}}
  {{Arg}}$sessionId <- {{Arg}}$sessionId()
  pathTemplate <- whisker.render(\"{{uriTemplate}}\", data = {{Arg}})
  pathURL <- {{Arg}}[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = {{method}}, url = build_url(pathURL), source = \"{{command}}\", json = {{JSON}},...)
  invisible(res)
}


"
# list of POST type JSON commands

JCommands <- list(
  newSession = list( com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    desiredCapabilities =c(remDr$desiredCapabilities, remDr$extraCapabilities)
  ), auto_unbox = TRUE)
  ", args = NULL),

  go = list(com =  "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
     url = url
  ), auto_unbox = TRUE)
  ", args = " url,"),

  back = list(com =  "
# Add function specific JSON to post
  jsonBody <- NULL
  "),


  forward = list(com =  "
# Add function specific JSON to post
  jsonBody <- NULL
  "),


  refresh = list(com =  "
# Add function specific JSON to post
  jsonBody <- NULL
  "),

  default = list(com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(

  ), auto_unbox = TRUE)
  ")
)

selPipeFuncs <- lapply(rowSplit(methPaths), function(x){
  if(identical(x[["method"]], "POST")){
    appCommand <- JCommands[[x[["command"]]]][["com"]]
    defCommand <- JCommands[["default"]][["com"]]
    x[["JSON_command"]] <- ifelse(!is.null(appCommand), appCommand, defCommand)
    x[["JSON"]] <- "jsonBody"
  }else{
    x[["JSON"]] <- "NULL"
  }
  x[["addArgs"]] <- JCommands[[x[["command"]]]][["args"]]
  whisker.render(funcTemp, x)
}
)
remDrFuncs <- paste(selPipeFuncs[!grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
webElemFuncs <- paste(selPipeFuncs[grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
write(remDrFuncs, "R/remoteDriver.R")
write(webElemFuncs, "R/webElement.R")

