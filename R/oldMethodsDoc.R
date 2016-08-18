#' Accept alert
#'
#'\code{acceptAlertOld} accept a JavaScript alert This uses the old JSONwireprotocol endpoints.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name acceptAlertOld
NULL

#' Dismiss Alert
#'
#'\code{dismissAlertOld}  dismiss a JavaScript alert. This uses the old JSONwireprotocol endpoints.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name dismissAlertOld
NULL

#' executeAsyncScriptOld
#'
#'\code{executeAsyncScriptOld} This function uses the old JSONwireprotocol end points. Inject a snippet of JavaScript into the page for asynchronous execution in
#'    the context of the currently selected frame.
#'
#'    The driver will pass a callback as the last argument to the snippet, and
#'    block until the callback is invoked.
#'
#' @template remDr
#' @param script character: The script to inject.
#' @param args The arguments of the script as a list.
#' @param replace logical: If TRUE any elements identify as web Elements are converted to such.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret6
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name executeAsyncScriptOld
NULL

#' Execute JavaScript asynchronously on browser.
#'
#'\code{executeScriptOld} This function uses the old JSONwireprotocol end points. Inject a snippet of JavaScript into the page for execution in the context
#'    of the currently selected frame. The executed script is assumed to be
#'    synchronous and the result of evaluating the script will be returned.
#'
#' @template remDr
#' @param script character: The script to inject.
#' @param args The arguments of the script as a list.
#' @param replace logical: If TRUE any elements identify as web Elements are converted to such.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret6
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name executeScriptOld
NULL

#' Get alert text
#'
#'\code{getAlertTextOld} Get the text from a JavaScript alert. This uses the old JSONwireprotocol endpoints.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret2
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getAlertTextOld
NULL

#' getWindowHandleOld
#'
#'\code{getWindowHandleOld}
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret2
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowHandleOld
NULL

#' getWindowHandlesOld
#'
#'\code{getWindowHandlesOld}
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret2
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowHandlesOld
NULL

#' Send text to alert
#'
#'\code{sendAlertTextOld} Send keystrokes to JavaScript prompt() dialog. This uses the old JSONwireprotocol endpoints.
#'
#' @template remDr
#' @param text A character vector of length 1. In other words a string. The text is passed to the JavaScript alert
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name sendAlertTextOld
NULL

#' Get window position
#'
#'\code{getWindowPositionOld}
#'
#' @template remDr
#' @param handle Handle of the window to query. If handle = "current" (the default) the current window is used.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowPositionOld
NULL

#' getWindowSize
#'
#'\code{getWindowSizeOld}
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowSizeOld
NULL

#' setWindowSizeOld
#'
#'\code{setWindowSize}
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name setWindowSizeOld
NULL


