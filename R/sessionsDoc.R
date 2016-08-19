#' Delete the session.
#'
#'\code{deleteSession} Delete the session.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family sessions functions
#' @template ret9
#' @export
#'
#' @example /inst/examples/docs/sessions.R
#' @name deleteSession
NULL

#' Create a new session.
#'
#'\code{newSession} The server should attempt to create a session that most closely matches the desired and required capabilities. Required capabilities have higher priority than desired capabilities and must be set for the session to be created.
#'
#' @template remDr
#' @template ellipsis
#'
#' @family sessions functions
#' @template ret8
#' @export
#'
#' @example /inst/examples/docs/sessions.R
#' @name newSession
NULL

#' Configure the amount of time that a particular type of operation can execute
#'
#'\code{setTimeout} Configure the amount of time that a particular type of operation can execute
#'    for before they are aborted and a |Timeout| error is returned to the client.
#'
#' @template remDr
#' @param type The type of operation to set the timeout for. Valid values are: "script" for script timeouts, "implicit" for modifying the implicit wait timeout and "page load" for setting a page load timeout.
#' @param milliseconds The amount of time, in milliseconds, that time-limited commands are permitted to run.
#' @template ellipsis
#'
#' @family sessions functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/sessions.R
#' @name setTimeout
NULL


