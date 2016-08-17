#' Execute JavaScript asynchronously on browser.
#'
#'\code{executeAsyncScript} Inject a snippet of JavaScript into the page for asynchronous execution in
#'    the context of the currently selected frame.
#'
#'    The driver will pass a callback as the last argument to the snippet, and
#'    block until the callback is invoked.
#'
#' @template remDr
#' @param script character: The script to inject.
#' @param args The arguments of the script as a list.
#' @param replace logical: If TRUE any elements identify as web Elements are converted to such.
#'
#' @family documentHandling functions
#' @template ret6
#' @export
#'
#' @example /inst/examples/docs/documentHandling.R
#' @name executeAsyncScript
NULL

#' Execute JavaScript on browser.
#'
#'\code{executeScript}  Inject a snippet of JavaScript into the page for execution in the context
#'    of the currently selected frame. The executed script is assumed to be
#'    synchronous and the result of evaluating the script will be returned.
#'
#' @template remDr
#' @param script character: The script to inject.
#' @param args The arguments of the script as a list.
#' @param replace logical: If TRUE any elements identify as web Elements are converted to such.
#'
#' @family documentHandling functions
#' @template ret6
#' @export
#'
#' @example /inst/examples/docs/documentHandling.R
#' @name executeScript
NULL

#' Get source of last page.
#'
#'\code{getPageSource} Get the source of the last loaded page.
#'
#' @template remDr
#'
#' @family documentHandling functions
#' @template ret3
#' @export
#'
#' @example /inst/examples/docs/documentHandling.R
#' @name getPageSource
NULL


