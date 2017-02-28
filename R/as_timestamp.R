#' Convert Milliseconds to a SubRip (SRT) Timestamp
#'
#' @param x Vector of timestamps.
#'
#' @return A character vector corresponding to x.
#'
#' @export
as_timestamp <- function(x) {

  purrr::map_chr(x, function(y) {

    stamp <-
      c(
        y %/% 3.6e6,
        y %%  3.6e6 %/% 6e4,
        y %%  3.6e6 %%  6e4 %/% 1e3,
        y %%  1e3
      ) %>%
      stringr::str_pad(2, pad = "0")

    paste(stamp[1:3], collapse = ":") %>%
      paste(stringr::str_pad(stamp[4], 3, pad = "0"), sep = ",")

  })

}
