#' Add a specific cookie.
#'
#'\code{addCookie} Add a specific cookie.
#'
#' @template remDr
#' @param name character: The name of the cookie; may not be null or an
#'    empty string
#' @param value character: The cookie value; may not be null.
#' @param path character: The path the cookie is visible to. If left blank
#'    or set to null, will be set to "/".
#' @param domain character: The domain the cookie is visible to. It should
#'    be null or the same as the domain of the current URL.
#' @param secure logical:  Whether this cookie requires a secure
#'    connection(https?). It should be null or equal to the security of
#'    the current URL.
#' @param httpOnly logical:  Whether the cookie is an httpOnly cookie.
#' @param expiry The cookie's expiration date; may be null.
#' @template ellipsis
#' @export
#'
#' @family cookies functions
#' @template ret1
#'
#' @example /inst/examples/docs/cookies.R
#' @name addCookie
NULL

#' Delete all the cookies.
#'
#'\code{deleteAllCookies} Delete all the cookies that are currently
#'    visible.
#'
#' @template remDr
#' @template ellipsis
#' @export
#'
#' @family cookies functions
#' @template ret1
#'
#' @example /inst/examples/docs/cookies.R
#' @name deleteAllCookies
NULL

#' Delete a given cookie.
#'
#'\code{deleteCookie} Delete the cookie with the give name.
#'
#' @template remDr
#' @param name character: The name of the cookie; may not be null or an
#'    empty string
#' @template ellipsis
#' @export
#'
#' @family cookies functions
#' @template ret1
#'
#' @example /inst/examples/docs/cookies.R
#' @name deleteCookie
NULL

#' Get all current domain cookies
#'
#'\code{getAllCookies} Get all the cookies for the current domain.
#'
#' @template remDr
#' @template ellipsis
#' @export
#'
#' @family cookies functions
#' @return A list of all the cookies on the current domain are returned.
#'    These cookies have values as stipulated by the arguments given in
#'    \code{\link{addCookie}}.
#'
#' @example /inst/examples/docs/cookies.R
#' @name getAllCookies
NULL

#' Get a named cookie
#'
#'\code{getNamedCookie} Get the cookie with a given name.
#'
#' @template remDr
#' @param name character: The name of the cookie; may not be null or an
#'    empty string
#' @template ellipsis
#' @export
#'
#' @family cookies functions
#' @return A named cookies from the current domain is returned if it
#'    exists. These cookies have values as stipulated by the arguments
#'    given in \code{\link{addCookie}}.
#'
#' @example /inst/examples/docs/cookies.R
#' @name getNamedCookie
NULL


