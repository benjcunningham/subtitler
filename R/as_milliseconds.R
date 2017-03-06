#' Convert a SubRip (SRT) Timestamp to Milliseconds
#'
#' Convert a vector of SubRip-style timestamps into milliseconds. Checks
#' that each element is of the form hours:minutes:seconds,milliseconds
#' where units are fixed as two zero-padded digits and the fractional
#' component is fixed as three zero-padded digits (i.e., \code{00:00:00,000}).
#'
#' @param x Character vector of SubRip timestamps.
#'
#' @return A numeric vector corresponding to x.
#'
#' @export
as_milliseconds <- function(x) {

  ms <- c(3.6e6, 6e4, 1e3, 1)

  stringr::str_split(x, ":|,") %>%
    purrr::map(function(i) sum(as.numeric(i) * ms)) %>%
    unlist()

}
