#' Accept alert
#'
#'\code{acceptAlertOld} accept a JavaScript alert This uses the old
#'    JSONwireprotocol endpoints.
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
#'\code{dismissAlertOld}  dismiss a JavaScript alert. This uses the old
#'  JSONwireprotocol endpoints.
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
#'\code{executeAsyncScriptOld} This function uses the old JSONwireprotocol
#'    end points. Inject a snippet of JavaScript into the page for
#'    asynchronous execution in the context of the currently selected
#'    frame.
#'
#'    The driver will pass a callback as the last argument to the snippet,
#'    and block until the callback is invoked.
#'
#' @template remDr
#' @param script character: The script to inject.
#' @param args The arguments of the script as a list.
#' @param replace logical: If TRUE any elements identify as web Elements
#'    are converted to such.
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
#'\code{executeScriptOld} This function uses the old JSONwireprotocol end
#'    points. Inject a snippet of JavaScript into the page for execution
#'    in the context of the currently selected frame. The executed script
#'    is assumed to be synchronous and the result of evaluating the script
#'    will be returned.
#'
#' @template remDr
#' @param script character: The script to inject.
#' @param args The arguments of the script as a list.
#' @param replace logical: If TRUE any elements identify as web Elements
#'    are converted to such.
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
#'\code{getAlertTextOld} Get the text from a JavaScript alert. This uses
#'    the old JSONwireprotocol endpoints.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @return The alert text is returned as a string.
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getAlertTextOld
NULL

#' Retrieve the current window handle.
#'
#'\code{getWindowHandleOld} Retrieve the current window handle. Uses the
#'    old JSONwireprotocol end points
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @return Returns a string which is the "handle" for the current window.
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowHandleOld
NULL

#' Get all window handles.
#'
#'\code{getWindowHandlesOld} Uses the old JSONwireprotocol end points.
#'    Retrieve the list of all window handles available to the session.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family oldMethods functions
#' @return Returns a list of windows handles. Each element of the list is
#'    a string. The order window handles are returned is arbitrary.
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowHandlesOld
NULL

#' Send text to alert
#'
#'\code{sendAlertTextOld} Send keystrokes to JavaScript prompt() dialog.
#'    This uses the old JSONwireprotocol endpoints.
#'
#' @template remDr
#' @param text A character vector of length 1. In other words a string.
#'    The text is passed to the JavaScript alert
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
#'\code{getWindowPositionOld} Get the position of the specified window.
#'    Uses the old JSONwireprotocol end points.
#'
#' @template remDr
#' @param handle Handle of the window to query. If handle = "current"
#'    (the default) the current window is used.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @return Returns a list which contains the x coordinate to position the
#'    window at, relative to the upper left corner of the screen and the
#'    Y coordinate to position the window at, relative to the upper left
#'    corner of the screen
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowPositionOld
NULL

#' Get window size
#'
#'\code{getWindowSizeOld} Get the size of the specified window. Uses the
#'    old JSONwireprotocol end points.
#'
#' @template remDr
#' @param handle Handle of the window to query. If handle = "current"
#'    (the default) the current window is used.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @return The width and height of the window are returned as elements in
#'    a list.
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name getWindowSizeOld
NULL

#' Change the size of the specified window.
#'
#'\code{setWindowSize} Change the size of the specified window.
#'
#' @template remDr
#' @param width integer The new window width.
#' @param height integer The new window height.
#' @param handle Handle of the window to query. If handle = "current"
#'    (the default) the current window is used.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name setWindowSizeOld
NULL

#' Change the position of the specified window.
#'
#'\code{setWindowSize} Change the position of the specified window.
#'
#' @template remDr
#' @param x integer The X coordinate to position the window at, relative
#'    to the upper left corner of the screen.
#' @param y integer  The Y coordinate to position the window at, relative
#'    to the upper left corner of the screen.
#' @param handle Handle of the window to query. If handle = "current"
#'    (the default) the current window is used.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name setWindowPositionOld
NULL

#' Maximize the current window.
#'
#'\code{maximizeWindowOld} Maximize the specified window if not already
#'    maximized.
#'
#' @template remDr
#' @param handle Handle of the window to query. If handle = "current"
#'    (the default) the current window is used.
#' @template ellipsis
#'
#' @family oldMethods functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/oldMethods.R
#' @name maximizeWindowOld
NULL


