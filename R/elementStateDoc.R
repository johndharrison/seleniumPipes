#' Get the value of an element's attribute.
#'
#'\code{getElementAttribute} Get the value of an element's attribute.
#'
#' @template webElem
#' @param attribute The attribute to query as a character string.
#' @template ellipsis
#'
#' @family elementState functions
#' @return The value of the attribute, or null if it is not set on the
#'    element.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name getElementAttribute
NULL

#' Query the value of an element's computed CSS property.
#'
#'\code{getElementCssValue} Query the value of an element's computed CSS
#'    property. The CSS property to query should be specified using the
#'    CSS property name, not the JavaScript property name (e.g.
#'    background-color instead of backgroundColor).
#'
#' @template webElem
#' @param propertyName The property to query as a character string
#' @template ellipsis
#'
#' @family elementState functions
#' @return The value of the specified CSS property.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name getElementCssValue
NULL

#' Query the value of an elements property.
#'
#'\code{getElementProperty} Query the value of an elements property.
#'
#' @template webElem
#' @param property The property to query as a character string
#' @template ellipsis
#'
#' @family elementState functions
#' @return The value of the elements specified property.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name getElementProperty
NULL

#' Return the dimensions and coordinates of an element
#'
#'\code{getElementRect} The getElementRect fuinction returns the
#'    dimensions and coordinates of the given web element.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementState functions
#' @return The returned value is a list including the following members:
#' \describe{
#'   \item{x}{X axis position of the top-left corner of the web element
#'      relative to the current browsing context’s document element in CSS
#'      reference pixels.}
#'   \item{y}{Y axis position of the top-left corner of the web element
#'      relative to the current browsing context’s document element in CSS
#'      reference pixels.}
#'   \item{height}{Height of the web element’s bounding rectangle in CSS
#'      reference pixels. }
#'   \item{width}{Width of the web element’s bounding rectangle in CSS
#'      reference pixels. }
#' }
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name getElementRect
NULL

#' Query for an element's tag name.
#'
#'\code{getElementTagName} Query for an element's tag name.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementState functions
#' @return  The element's tag name, as a lowercase character string.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name getElementTagName
NULL

#' Returns the visible text for the element.
#'
#'\code{getElementText} Returns the visible text for the element.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementState functions
#' @return The visible text for an element is returned as a character
#'    string.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name getElementText
NULL

#' Determine if an element is currently enabled.
#'
#'\code{isElementEnabled} Determine if an element is currently enabled.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementState functions
#' @return A logical value is returned indicating whether the elemnent is
#'    enabled.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name isElementEnabled
NULL

#' Determine if an element is currently selected.
#'
#'\code{isElementSelected} Determines if an OPTION element, or an INPUT
#'    element of type checkbox or radiobutton is currently selected.
#'
#' @template webElem
#' @template ellipsis
#'
#' @family elementState functions
#' @return A logical value is returned indicating whether the elemnent is
#'    selected.
#' @export
#'
#' @example /inst/examples/docs/elementState.R
#' @name isElementSelected
NULL


