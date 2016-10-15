#' takeElementScreenshot
#'
#'\code{takeElementScreenshot}
#'
#' @template webElem
#' @param file If not null the decoded PNG is written to file using the
#'    string provided here. Defaults to NULL.
#' @param display logical Display the PNG or not (default is set in
#'    getOption("seleniumPipes_display_screenshot")).
#' @param useViewer A viewer to view the PNG. Looks for the RSudio viewer
#'    by default.
#' @param returnPNG logical return the decoded PNG. If false (default)
#'    webElem is returned to allow chaining.
#' @template ellipsis
#'
#' @family screenCapture functions
#' @template ret13
#' @export
#'
#' @example /inst/examples/docs/screenCapture.R
#' @name takeElementScreenshot
NULL

#' takeScreenshot
#'
#'\code{takeScreenshot}
#'
#' @template remDr
#' @param file If not null the decoded PNG is written to file using the
#'    string provided here. Defaults to NULL.
#' @param display logical Display the PNG or not (default is set in
#'    getOption("seleniumPipes_display_screenshot")).
#' @param useViewer A viewer to view the PNG. Looks for the RSudio viewer
#'    by default.
#' @param returnPNG logical return the decoded PNG. If false (default)
#'    remDr is returned to allow chaining.
#' @template ellipsis
#'
#' @family screenCapture functions
#' @template ret12
#' @export
#'
#' @example /inst/examples/docs/screenCapture.R
#' @name takeScreenshot
NULL


