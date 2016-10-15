#' Close the current window.
#'
#'\code{closeWindow} Close the current window.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name closeWindow
NULL

#' Make current window full-screen
#'
#'\code{fullscreenWindow} The Fullscreen Window command invokes the window
#'    manager-specific “full screen” operation, if any, on the window
#'    containing the current top-level browsing context. This typically
#'    increases the window to the size of the physical display and can hide
#'    browser UI elements such as toolbars.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name fullscreenWindow
NULL

#' get current window handle
#'
#'\code{getWindowHandle} Retrieve the current window handle.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @return Returns a string which is the "handle" for the current window.
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name getWindowHandle
NULL

#' Get all window handles.
#'
#'\code{getWindowHandles} Retrieve the list of all window handles available
#'    to the session.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @return Returns a list of windows handles. Each element of the list is a
#'    string. The order window handles are returned is arbitrary.
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name getWindowHandles
NULL

#' Get current window position
#'
#'\code{getWindowPosition} The Get Window Position command returns the
#'    position on the screen of the operating system window corresponding
#'    to the current top-level browsing context.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @return Returns a list which contains the x coordinate to position the
#'    window at, relative to the upper left corner of the screen and the Y
#'    coordinate to position the window at, relative to the upper left
#'    corner of the screen
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name getWindowPosition
NULL

#' getWindowSize
#'
#'\code{getWindowSize}
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @return The width and height of the window are returned as elements in
#'    a list.
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name getWindowSize
NULL

#' Maximize the current window.
#'
#'\code{maximizeWindow} Maximize the current if not already maximized.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name maximizeWindow
NULL

#' Change the position of the current window.
#'
#'\code{setWindowPosition} Change the position of the current window.
#'
#' @template remDr
#' @param x integer The X coordinate to position the window at, relative
#'    to the upper left corner of the screen.
#' @param y integer  The Y coordinate to position the window at, relative
#'    to the upper left corner of the screen.
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name setWindowPosition
NULL

#' Change the size of the current window.
#'
#'\code{setWindowSize} Change the size of the current window.
#'
#' @template remDr
#' @param width integer The new window width.
#' @param height integer The new window height.
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name setWindowSize
NULL

#' Change focus to another frame on the page.
#'
#'\code{switchToFrame} Change focus to another frame on the page. If the
#'    frame id is null, the server should switch to the page's default
#'    content.
#'
#' @template remDr
#' @param Id {string|number|null|WebElement} Identifier for the frame to
#'    change focus to.
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name switchToFrame
NULL

#' Change focus to the parent context.
#'
#'\code{switchToParentFrame} Change focus to the parent context. If the
#'    current context is the top level browsing context, the context
#'    remains unchanged.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name switchToParentFrame
NULL

#' Change focus to another window.
#'
#'\code{switchToWindow} Change focus to another window.
#'
#' @template remDr
#' @param name The handle of the window to change focus to.
#' @template ellipsis
#'
#' @family commandContexts functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/commandContexts.R
#' @name switchToWindow
NULL


