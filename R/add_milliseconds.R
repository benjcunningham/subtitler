#' Add Milliseconds to a SubRip (SRT) Timestamp
#'
#' Convenience method for directly adding milliseconds to a timestamp.
#' Equivalent to \code{as_timestamp(as_milliseconds(x) + ms)}.
#'
#' @param x Vector of timestamps.
#' @param ms Numeric vector of milliseconds to add.
#'
#' @return A character vector corresponding to x.
#'
#' @export
add_milliseconds <- function(x, ms) {

  as_timestamp(as_milliseconds(x) + ms)

}
