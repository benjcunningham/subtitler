#' Convert a SubRip (SRT) Timestamp to Milliseconds
#'
#' @param x Character vector of timestamps in the form
#'   \code{HH:MM:SS,mmm}.
#'
#' @return A numeric vector corresponding to x.
#'
#' @export
as_milliseconds <- function(x) {

  ms <- c(3.6e6, 6e4, 1e3, 1)

  purrr::map_dbl(x, function(y) {

    stamp <-
      stringr::str_split(y, ":|,") %>%
      unlist() %>%
      as.numeric()

    sum(stamp * ms)

  })

}
