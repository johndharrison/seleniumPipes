# utility script to get the w3c specs to create the functions in seleniumPipes
# assummed ran from the project base
DOCUMENT <- FALSE
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

oldSelMethods <- list(
  data.frame(method = "GET", uriTemplate = "/session/{session id}/window_handle",
             command = "getWindowHandleOld", stringsAsFactors = FALSE),
  data.frame(method = "GET", uriTemplate = "/session/{session id}/window_handles",
             command = "getWindowHandlesOld", stringsAsFactors = FALSE),
  data.frame(method = "GET", uriTemplate = "/session/{sessionId}/window/{windowHandle}/size",
             command = "getWindowSizeOld", stringsAsFactors = FALSE),
  data.frame(method = "GET", uriTemplate = "/session/{sessionId}/window/{windowHandle}/position",
             command = "getWindowPositionOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{sessionId}/window/{windowHandle}/size",
             command = "setWindowSizeOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{sessionId}/window/{windowHandle}/position",
             command = "setWindowPositionOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{sessionId}/window/{windowHandle}/maximize",
             command = "maximizeWindowOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{session id}/execute",
             command = "executeScriptOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{session id}/execute_async",
             command = "executeAsyncScriptOld", stringsAsFactors = FALSE),
  data.frame(method = "GET", uriTemplate = "/session/{session id}/alert_text",
             command = "getAlertTextOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{session id}/alert_text",
             command = "sendAlertTextOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{session id}/alert_accept",
             command = "acceptAlertOld", stringsAsFactors = FALSE),
  data.frame(method = "POST", uriTemplate = "/session/{session id}/alert_dismiss",
             command = "dismissAlertOld", stringsAsFactors = FALSE)
  )
methPaths <- rbindlist(list(methPaths, rbindlist(oldSelMethods)))

methPaths[, uriTemplate := gsub("/session/\\{session id)/cookie", "/session/\\{session id\\}/cookie", uriTemplate)]
methPaths[, uriTemplate := gsub("session id", "sessionId", uriTemplate)]
methPaths[, uriTemplate := gsub("element id", "elementId", uriTemplate)]
methPaths[, uriTemplate := gsub("\\{property name\\}", "\\{propertyName\\}", uriTemplate)]
methPaths[, uriTemplate := gsub("\\{", "\\{\\{", uriTemplate)]
methPaths[, uriTemplate := gsub("\\}", "\\}\\}", uriTemplate)]
methPaths[, elemInd := grepl("\\{elementId\\}", uriTemplate)]
methPaths[, Arg := ifelse(elemInd, "webElem", "remDr")]

methGroups <- list(
  sessions = c("newSession", "deleteSession", "setTimeout"),
  navigation = c("go", "getCurrentUrl", "back", "forward", "refresh", "getTitle"),
  commandContexts = c("getWindowHandle", "closeWindow", "switchToWindow", "getWindowHandles"
                      , "switchToFrame", "switchToParentFrame", "getWindowSize", "setWindowSize"
                      , "getWindowPosition", "setWindowPosition", "maximizeWindow", "fullscreenWindow"),
  elementRetrieval = c("getActiveElement", "findElement", "findElements", "findElementFromElement"
                       , "findElementsFromElement"),
  elementState = c("isElementSelected", "getElementAttribute", "getElementProperty", "getElementCssValue"
                   , "getElementText", "getElementTagName", "getElementRect", "isElementEnabled"),
  elementInteraction = c("elementClick", "elementClear", "elementSendKeys"),
  documentHandling = c("getPageSource", "executeScript", "executeAsyncScript"),
  cookies = c("getAllCookies", "getNamedCookie", "addCookie", "deleteCookie", "deleteAllCookies"),
  interactions = c("performActions", "releasingActions"),
  userPrompts = c("dismissAlert", "acceptAlert", "getAlertText", "sendAlertText"),
  screenCapture = c("takeScreenshot", "takeElementScreenshot"),
  oldMethods = c("getWindowHandleOld", "getWindowHandlesOld", "getWindowPositionOld", "getWindowSizeOld"
                 , "setWindowSizeOld", "setWindowPositionOld", "maximizeWindowOld"
                 , "executeScriptOld", "executeAsyncScriptOld"
                 , "getAlertTextOld", "sendAlertTextOld", "acceptAlertOld", "dismissAlertOld")
)
methGroups <- lapply(names(methGroups), function(x){
  expand.grid(group = x, command = methGroups[[x]], stringsAsFactors = FALSE)
}
)
methGroups <- rbindlist(methGroups)
methPaths <- merge(methPaths, methGroups, by = "command")

funcTemp <- list(
remDr = list( roxy = "#' {{command}}
#'
#'{{codecommand}}
#'
#' @template remDr
{{roxyArgs}}
#' @family {{group}} functions
#' @template {{rettype}}
#' @export
#'
#' @example /inst/examples/docs/{{group}}.R
#' @name {{command}}
NULL

",

fbody = "
#' @rdname {{command}}
{{command}} <- function({{Arg}}, {{{addArgs}}}...){
  obj <- {{Arg}}
  obj$sessionId <- {{Arg}}$sessionId({{Arg}}$drvID)
  {{{JSON_command}}}
  pathTemplate <- whisker.render(\"{{uriTemplate}}\", data = obj)
  pathURL <- {{Arg}}[['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = {{method}}, url = build_url(pathURL), source = \"{{command}}\", drvID = {{Arg}}$drvID, json = {{JSON}},...)
  {{{return}}}
}
"
),

webElem = list(roxy = "#' {{command}}
#'
#'{{codecommand}}
#'
#' @template webElem
{{roxyArgs}}
#' @family {{group}} functions
#' @template {{rettype}}
#' @export
#'
#' @example /inst/examples/docs/{{group}}.R
#' @name {{command}}
NULL

",
fbody = "
#' @rdname {{command}}
{{command}} <- function({{Arg}}, {{{addArgs}}}...){
  obj <- {{Arg}}
  obj$sessionId <- {{Arg}}$sessionId({{Arg}}$remDr$drvID)
  obj$elementId <- {{Arg}}$elementId$ELEMENT
  {{{JSON_command}}}
  pathTemplate <- whisker.render(\"{{uriTemplate}}\", data = obj)
  pathURL <- {{Arg}}[['remDr']][['remServAdd']]
  pathURL[['path']] <- paste0(pathURL[['path']], pathTemplate)
  res <- queryDriver(verb = {{method}}, url = build_url(pathURL), source = \"{{command}}\", drvID = {{Arg}}$remDr$drvID, json = {{JSON}},...)
  {{{return}}}
}


"))

# configure returns
selReturn <- list(
  ret1 = "invisible(remDr)"
  , ret2 = "res$value"
  , ret3 = "read_html(res$value)"
  , ret4 = "invisible(wbElement(res$value, remDr))"
  , ret5 = "invisible(lapply(res$value, wbElement, remDr = remDr))"
  , ret6 = "if(replace){testWebElement(res$value, remDr)}else{res$value}"
  , ret7 = "invisible(webElem)"
  , ret8 = "remDr$sessionInfo <- res$value;invisible(remDr)"
  , ret9 = ".e$sessionId[[remDr$drvID]] <- NULL;invisible(remDr)"
  , ret10 = "invisible(wbElement(res$value, webElem$remDr))"
  , ret11 = "invisible(lapply(res$value, wbElement, remDr = webElem$remDr))"
  , ret12 =
"b64png <- base64_dec(res$value)
if(display){
  tmp <- file.path(tempdir(), 'tmpScreenShot.png')
  writeBin(b64png, tmp)
  viewer <- getOption(\"viewer\")
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
", ret13 =
  "b64png <- base64_dec(res$value)
if(display){
  tmp <- file.path(tempdir(), 'tmpElementScreenShot.png')
  writeBin(b64png, tmp)
  viewer <- getOption(\"viewer\")
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
"
)

# list of POST type JSON commands

JCommands <- list(
  newSession = list( com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    desiredCapabilities =c(remDr$desiredCapabilities, remDr$extraCapabilities)
  ), auto_unbox = TRUE)
  ", type = "ret8"),

  deleteSession = list(type = "ret9"),

  go = list(com =  "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
     url = url
  ), auto_unbox = TRUE)
  ", args = list(url = NA)
, type = "ret1"),

  getCurrentUrl = list(type = "ret2"),

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

  getWindowHandleOld = list(type = "ret2"),

  closeWindow = list(type = "ret1"),

  switchToWindow = list(
    com = "
# Add function specific JSON to post
  jsonBody <- toJSON(list(
    name = name
  ), auto_unbox = TRUE)
    ", args = list(name = NA)
    , type = "ret1"
  ),

  getWindowHandles = list(type = "ret2"),

  getWindowHandlesOld = list(type = "ret2"),

  getWindowPosition = list(type = "ret2"),

  getWindowPositionOld = list(com = "obj$windowHandle <- handle"
                              , args = list(handle = "\"current\""), type = "ret2"
                              ),

  getWindowSize = list(type = "ret2"),

  getWindowSizeOld = list(com = "obj$windowHandle <- handle"
                            , args = list(handle = "\"current\""), type = "ret2"
  ),

  setWindowSize = list(com = "
  jsonBody <- toJSON(list(
    width = width, height = height
  ), auto_unbox = TRUE)"
                       , args = list(width = NA, height = NA), type = "ret1"),

  setWindowSizeOld = list(com = "obj$windowHandle <- handle
  jsonBody <- toJSON(list(
    width = width, height = height
  ), auto_unbox = TRUE)"
                        , args = list(width = NA, height = NA, handle = "\"current\"")
                        , type = "ret1"
  ),

  setWindowPosition = list(com = "
  jsonBody <- toJSON(list(
    x = x, y = y
  ), auto_unbox = TRUE)"
   , args = list(x = NA, y = NA), type = "ret1"),

  setWindowPositionOld = list(com = "obj$windowHandle <- handle
  jsonBody <- toJSON(list(
    x = x, y = y
  ), auto_unbox = TRUE)"
                        , args = list(x = NA, y = NA, handle = "\"current\"")
   , type = "ret1"
  ),

  maximizeWindow = list(com = "jsonBody <- NULL\n", type = "ret2"),

  maximizeWindowOld = list(com = "jsonBody <- NULL\nobj$windowHandle <- handle"
                        , args = list(handle = "\"current\""), type = "ret2"
  ),

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
    ", args = list(Id = "NULL")
    , type = "ret1"
  ),

  switchToParentFrame = list(type = "ret1"),

  findElement = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  ", args = list(using = "c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\")"
                 , value = NA)
    , type = "ret4"
  ),

  findElementFromElement = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  " , args = list(using = "c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\")"
                  , value = NA)
    , type = "ret10"
  ),

  findElements = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  " , args = list(using = "c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\")"
                  , value = NA)
    , type = "ret5"
  ),

  findElementsFromElement = list(
    com = "
# Add function specific JSON to post
  using <- match.arg(using)
  jsonBody <- toJSON(list(
    using = using, value = value
  ), auto_unbox = TRUE)
  "  , args = list(using = "c(\"xpath\", \"css selector\", \"id\", \"name\", \"tag name\", \"class name\", \"link text\", \"partial link text\")"
                   , value = NA)
    , type = "ret11"
  ),

  getActiveElement = list(type = "ret4"),

  isElementSelected = list(type = "ret2"),

  getElementAttribute = list(
    com = "obj$name <- attribute"
    , args = list(attribute =NA), type = "ret2"),

  getElementProperty = list(
    com = "obj$name <- property"
    , args = list(property = NA), type = "ret2"),

  getElementCssValue = list(
    com = "obj$propertyName <- propertyName"
    , args = list(propertyName = NA), type = "ret2"),

  getElementText = list(type = "ret2"),

  getElementTagName = list(type = "ret2"),

  getElementRect = list(type = "ret2"),

  isElementEnabled = list(type = "ret2"),

  elementClear = list(com = "jsonBody <- NULL", type = "ret7"),

  elementClick = list(com = "jsonBody <- NULL", type = "ret7"),

  elementSendKeys = list(
    com = "sendKeys <- list(...)
      jsonBody <- toJSON(list(value = matchSelKeys(sendKeys)), auto_unbox = TRUE)"
    , type = "ret7"),

  executeScript = list(
    com = "
  args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
      x$elementId
    }else{
      x
    }
  })
  jsonBody <- toJSON(list(
    script = script, args = args
  ), auto_unbox = TRUE)
"
    , args = list(script = NA, args = "list()", replace = "TRUE")
    , type = "ret6"
  ),

  executeScriptOld = list(
    com = "
    args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
    x$elementId
    }else{
    x
    }
    })
    jsonBody <- toJSON(list(
    script = script, args = args
    ), auto_unbox = TRUE)
    "
    , args = list(script = NA, args = "list()", replace = "TRUE")
    , type = "ret6"
  ),

  executeAsyncScript = list(
    com = "
  args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
      x$elementId
    }else{
      x
    }
  })
  jsonBody <- toJSON(list(
    script = script, args = args
  ), auto_unbox = TRUE)
"
    , args = list(script = NA, args = "list()", replace = "TRUE")
    , type = "ret6"
  ),

  executeAsyncScriptOld = list(
    com = "
    args <- lapply(args, function(x){
    if('wElement' %in% class(x)){
    x$elementId
    }else{
    x
    }
    })
    jsonBody <- toJSON(list(
    script = script, args = args
    ), auto_unbox = TRUE)
    "
    , args = list(script = NA, args = "list()", replace = "TRUE")
    , type = "ret6"
  ),

  getAllCookies = list(type = "ret2"),

  getNamedCookie = list(
    com = "obj$name <- name"
    , args = list(name = "NULL")
    , type = "ret2"),

  addCookie = list(
    com = "
  cookie <- list(name = name, value = value, path = path, domain = domain
                , secure = secure, httpOnly = httpOnly, expiry = expiry)
  cookie <- cookie[!sapply(cookie, is.null)]
  jsonBody <- toJSON(list(cookie = cookie), null = \"null\", auto_unbox = TRUE)"
    , args = list(name = NA, value = NA, path = "NULL", domain = "NULL", secure = "FALSE"
                  , httpOnly = "NULL", expiry = "NULL")
    , type = "ret1"),

  deleteCookie = list(
    com = "obj$name <- name"
    , args = list(name = "NULL")
    , type = "ret1"),

  deleteAllCookies = list(type = "ret1"),

  dismissAlert = list(com = "jsonBody <- NULL", type = "ret1"),

  dismissAlertOld = list(com = "jsonBody <- NULL", type = "ret1"),

  acceptAlert = list(com = "jsonBody <- NULL", type = "ret1"),

  acceptAlertOld = list(com = "jsonBody <- NULL", type = "ret1"),

  getAlertText = list(type = "ret2"),

  getAlertTextOld = list(type = "ret2"),

  sendAlertText = list(
    com = "
    jsonBody <- toJSON(list(text = text), auto_unbox = TRUE)"
    , args = list(text = "\"\"")
    , type = "ret1"),

  sendAlertTextOld = list(
    com = "
    jsonBody <- toJSON(list(text = text), auto_unbox = TRUE)"
    , args = list(text = "\"\"")
    , type = "ret1"),

  setTimeout = list(
    com = "
      jsonBody <- toJSON(list(type = type, ms = milliseconds), auto_unbox = TRUE)"
    , args = list(type = '\"page load\"', milliseconds = 10000)
    , type = "ret1"),

  takeScreenshot = list(
    args = list(file = "NULL", display = 'getOption("seleniumPipes_display_screenshot")',
                  useViewer = '!is.null(getOption("viewer"))', returnPNG = "FALSE")
    , type = "ret12"),

  takeElementScreenshot = list(
    args = list(file = "NULL", display = 'getOption("seleniumPipes_display_screenshot")',
              useViewer = '!is.null(getOption("viewer"))', returnPNG = "FALSE")
   , type = "ret13")


)

selPipeFuncs <- lapply(rowSplit(methPaths), function(x){
  appFunc <- JCommands[[x[["command"]]]]
  appCommand <- appFunc[["com"]]
  if(identical(x[["method"]], "POST")){
    defCommand <- JCommands[["default"]][["com"]]
    x[["JSON_command"]] <- ifelse(!is.null(appCommand), appCommand, defCommand)
    x[["JSON"]] <- "jsonBody"
  }else{
    x[["JSON_command"]] <- if(!is.null(appCommand)){appCommand
    }else{
      NULL
    }
    x[["JSON"]] <- "NULL"
  }
  args <- JCommands[[x[["command"]]]][["args"]]
  if(!is.null(args)){
    x[["addArgs"]] <- paste(paste0(lapply(name(args), function(x){if(is.na(args[[x]])){
      paste0(x, ", ")
    }else{
      paste0(x," = ",args[[x]],", ")
    }
    }
    )), collapse = "")
    x[["roxyArgs"]] <- paste(c(paste0("#' @param ",name(args), "\n"), "#'"), collapse = "")
  }else{
    x[["roxyArgs"]] <- "#'"
  }
  type <- if(is.null(appFunc)){
    JCommands[["default"]][["type"]]
  }else{
    appFunc[["type"]]
  }
  x[["return"]] <- selReturn[[type]]
  x[["rettype"]] <- type
  x[["codecommand"]] <- paste0("\\code{", x[["command"]], "}")
  list(fbody = whisker.render(funcTemp[[x$Arg]][["fbody"]], x)
       , roxy = whisker.render(funcTemp[[x$Arg]][["roxy"]], x))
}
)
methPaths[["selFuncs"]] <- sapply(selPipeFuncs, "[[", "fbody")
methPaths[["selRoxy"]] <- sapply(selPipeFuncs, "[[", "roxy")
# remDrFuncs <- paste(selPipeFuncs[!grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
# webElemFuncs <- paste(selPipeFuncs[grepl("\\{elementId\\}", selPipeFuncs)], collapse = "")
# write(remDrFuncs, "R/remoteDriver.R")
# write(webElemFuncs, "R/webElement.R")

# write the functions to file based on the groups they are in
methPaths[,write(file = paste0("R/", group, ".R"), paste(selFuncs, collapse = "")), by = group]

# add documentation
if(DOCUMENT){
  methPaths[,write(file = paste0("R/", group, "Doc.R"), paste(selRoxy, collapse = "")), by = group]
}

