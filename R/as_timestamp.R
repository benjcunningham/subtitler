#' Convert Milliseconds to a SubRip (SRT) Timestamp
#'
#' @param x Vector of timestamps.
#'
#' @return A character vector corresponding to x.
#'
#' @export
as_timestamp <- function(x) {

  df <- tibble::tibble(
    H = pad_time(x %/% 3.6e6, 2),
    M = pad_time(x %%  3.6e6 %/% 6e4, 2),
    S = pad_time(x %%  3.6e6 %%  6e4 %/% 1e3, 2),
    f = pad_time(x %%  1e3, 3)
  )

  as.character(glue::glue_data(df, "{H}:{M}:{S},{f}"))

}

#' @keywords internal
pad_time <- function(x, width) {
  stringr::str_pad(x, width, pad = "0")
}
