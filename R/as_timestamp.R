#' Convert Milliseconds to a SubRip (SRT) Timestamp
#'
#' @param x Vector of timestamps.
#'
#' @return A character vector corresponding to x.
#'
#' @export
as_timestamp <- function(x) {

  y <-
    tibble::data_frame_(list(
      hh =
        ~ (x %/% 3.6e6) %>%
        stringr::str_pad(2, pad = "0"),
      mm =
        ~ (x %%  3.6e6 %/% 6e4) %>%
        stringr::str_pad(2, pad = "0"),
      ss =
        ~ (x %%  3.6e6 %%  6e4 %/% 1e3) %>%
        stringr::str_pad(2, pad = "0"),
      ms =
        ~ (x %%  1e3) %>%
        stringr::str_pad(3, pad = "0")
    ))

  sprintf("%s:%s:%s,%s", y$hh, y$mm, y$ss, y$ms)

}
