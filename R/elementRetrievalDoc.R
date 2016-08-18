#' Search for an element on the page
#'
#'\code{findElement} Search for an element on the page, starting from the document root. The located element will be returned as an object of "wElement" class
#'
#' @template remDr
#' @param using Locator scheme to use to search the element, available schemes: {"class name", "css selector", "id", "name", "link text", "partial link text", "tag name", "xpath" }. Defaults to 'xpath'. Partial string matching is accepted.
#' @param value The search target. See examples.
#'
#' @template locator
#'
#' @family elementRetrieval functions
#' @template ret4
#' @export
#'
#' @example /inst/examples/docs/elementRetrieval.R
#' @name findElement
NULL

#' Search for an element on the page, starting from another element
#'
#'\code{findElementFromElement} Search for an element on the page, starting from the node defined by the parent webElement. The located element will be returned as an object of wElement class.
#'
#' @template webElem
#' @param using Locator scheme to use to search the element, available schemes: {"class name", "css selector", "id", "name", "link text", "partial link text", "tag name", "xpath" }. Defaults to 'xpath'. Partial string matching is accepted.
#' @param value The search target. See examples.
#'
#' @template locator
#'
#' @family elementRetrieval functions
#' @template ret10
#' @export
#'
#' @example /inst/examples/docs/elementRetrieval.R
#' @name findElementFromElement
NULL

#' Search for multiple elements on the page
#'
#'\code{findElements} Search for multiple elements on the page, starting from the document root. The located elements will be returned as a list of objects of class wElement.
#'
#' @template remDr
#' @param using Locator scheme to use to search the element, available schemes: {"class name", "css selector", "id", "name", "link text", "partial link text", "tag name", "xpath" }. Defaults to 'xpath'. Partial string matching is accepted.
#' @param value The search target. See examples.
#'
#' @template locator
#'
#' @family elementRetrieval functions
#' @template ret5
#' @export
#'
#' @example /inst/examples/docs/elementRetrieval.R
#' @name findElements
NULL

#' Search for multiple elements on the page, starting from another element.
#'
#'\code{findElementsFromElement} Search for multiple elements on the page, starting from the node defined by the parent webElement. The located elements will be returned as an list of objects of class wElement.
#'
#' @template webElem
#' @param using Locator scheme to use to search the element, available schemes: {"class name", "css selector", "id", "name", "link text", "partial link text", "tag name", "xpath" }. Defaults to 'xpath'. Partial string matching is accepted.
#' @param value The search target. See examples.
#'
#' @template locator
#'
#' @family elementRetrieval functions
#' @template ret11
#' @export
#'
#' @example /inst/examples/docs/elementRetrieval.R
#' @name findElementsFromElement
NULL

#' Get the element on the page that currently has focus.
#'
#'\code{getActiveElement} Get the element on the page that currently has focus. The located element will be returned as a WebcElement object.
#'
#' @template remDr
#'
#' @family elementRetrieval functions
#' @template ret4
#' @export
#'
#' @example /inst/examples/docs/elementRetrieval.R
#' @name getActiveElement
NULL


