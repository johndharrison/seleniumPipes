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
#'\code{newSession} The server should attempt to create a session that
#'    most closely matches the desired and required capabilities. Required
#'    capabilities have higher priority than desired capabilities and must
#'    be set for the session to be created.
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

#' Get amount of time that a particular type of operation can execute in.
#'
#'\code{getTimeouts} The Get Timeout command gets timeouts associated with
#'    the current session.
#'
#' @template remDr
#' @param type The type of operation to set the timeout for. Valid values
#'    are: "script" for script timeouts, "implicit" for modifying the
#'    implicit wait timeout and "page load" for setting a page load
#'    timeout.
#' @template ellipsis
#'
#' @family sessions functions
#' @template ret2
#' @export
#'
#' @example /inst/examples/docs/sessions.R
#' @name getTimeouts
NULL

#' Configure the amount of time that a particular type of operation can
#'    execute
#'
#'\code{getTimeouts} Configure the amount of time that a particular type
#'    of operation can execute for before they are aborted and a |Timeout|
#'    error is returned to the client.
#'
#' @template remDr
#' @param type The type of operation to set the timeout for. Valid values
#'    are: "script" for script timeouts, "implicit" for modifying the
#'    implicit wait timeout and "page load" for setting a page load
#'    timeout.
#' @param milliseconds The amount of time, in milliseconds, that
#'    time-limited commands are permitted to run.
#' @template ellipsis
#'
#' @family sessions functions
#' @template ret1
#' @export
#'
#' @example /inst/examples/docs/sessions.R
#' @name setTimeouts
NULL

#' Get remote end status.
#'
#'\code{status} The Status command returns information about whether a
#'    remote end is in a state in which it can create a new session.
#'    This is represented by the ready property of the response body,
#'    which has a value of false if attempting to create a session at
#'    the current time would fail.
#'
#' @template remDr
#'
#' @family sessions functions
#' @template ret2
#' @template ellipsis
#' @export
#'
#' @example /inst/examples/docs/sessions.R
#' @name status
NULL

