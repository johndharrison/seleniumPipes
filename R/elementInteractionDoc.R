#' Clear an elements text value.
#'
#'\code{elementClear} Clear a TEXTAREA or text INPUT element's value.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementInteraction functions
#' @template ret7
#' @export
#'
#' @example /inst/examples/docs/elementInteraction.R
#' @name elementClear
NULL

#' Click on an element.
#'
#'\code{elementClick} The elementClick function scrolls into view the element and clicks the in-view centre point. If the element is not pointer-interactable, an element not interactable error is returned.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementInteraction functions
#' @template ret7
#' @export
#'
#' @example /inst/examples/docs/elementInteraction.R
#' @name elementClick
NULL

#' Send a sequence of key strokes to an element.
#'
#'\code{elementSendKeys} The elementSendKeys function scrolls into view the form control element and then sends the provided keys to the element. In case the element is not keyboard interactable, an element not interactable error is returned.
#'
#' @template webElem
#' @param ... keys to send the element. \code{seleniumPipes} includes mappings to unicode keys see \code{\link{selKeys}}. To use one of this name the string using key. See examples
#'
#' @family elementInteraction functions
#' @template ret7
#' @export
#'
#' @example /inst/examples/docs/elementInteraction.R
#' @name elementSendKeys
NULL


