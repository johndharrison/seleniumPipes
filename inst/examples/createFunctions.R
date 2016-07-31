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

{{command}} <- function({{Arg}}, ...){
  pathTemplate <- whisker.render(\"{{uriTemplate}}\", data = {{Arg}})
  pathURL <- {{Arg}}[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  queryDriver(verb = {{method}}, url = build_url(pathURL), ...)
}


"

selPipeFuncs <- lapply(rowSplit(methPaths), function(x) whisker.render(funcTemp, x))
remDrFuncs <- paste(selPipeFuncs[!grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
webElemFuncs <- paste(selPipeFuncs[grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
write(remDrFuncs, "R/remoteDriver.R")
write(webElemFuncs, "R/webElement.R")

