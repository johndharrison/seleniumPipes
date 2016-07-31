# utility script to get the w3c specs to create the functions in seleniumPipes
# assummed ran from the project base

library(xml2)
library(httr)
library(data.table)
library(rapportools)
library(whisker)
appURL <- "https://w3c.github.io/webdriver/webdriver-spec.html"
doc <- read_html(appURL)
tabXpath <- "//table[@class='simple jsoncommand']"
methPaths <- rbindlist(html_table(xml_find_all(doc, tabXpath)))
desMeth <- sapply(xml_find_all(doc, tabXpath)
                  , function(x) {
                    tryCatch(xml_text(xml_find_one(x, "./preceding-sibling::h3")),
                             error=function(err) NA_character_)
                  }
)

methPaths[,description := tocamel(tolower(desMeth))]
setnames(methPaths, names(methPaths), tocamel(names(methPaths)))
methPaths[, PathTemplate := gsub("session id", "sessionId", PathTemplate)]
methPaths[, PathTemplate := gsub("element id", "elementId", PathTemplate)]
methPaths[, PathTemplate := gsub("\\{", "\\{\\{", PathTemplate)]
methPaths[, PathTemplate := gsub("\\}", "\\}\\}", PathTemplate)]
methPaths[, elemInd := grepl("\\{elementId\\}", PathTemplate)]
methPaths[, Arg := ifelse(elemInd, "webElem", "remDr")]
methPaths <- methPaths[!is.na(methPaths$description), ]

funcTemp <- "#' {{description}}
#'
#' @param {{Arg}}
#'
#' @return
#' @export
#'
#' @examples

{{description}} <- function({{Arg}}, ...){
  pathTemplate <- whisker.render(\"{{PathTemplate}}\", data = {{Arg}})
  pathURL <- {{Arg}}[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  {{HTTPMethod}}(url = build_url(pathURL), ...)
}


"

selPipeFuncs <- lapply(rowSplit(methPaths), function(x) whisker.render(funcTemp, x))
remDrFuncs <- paste(selPipeFuncs[!grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
webElemFuncs <- paste(selPipeFuncs[grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
write(remDrFuncs, "R/remoteDriver.R")
write(webElemFuncs, "R/webElement.R")

