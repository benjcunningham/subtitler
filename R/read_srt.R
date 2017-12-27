#' Read a SubRip (SRT) file into a tibble
#'
#' Reads a SubRip format file (extension \code{.srt}) and creates a
#' tibble from it, with rows corresponding to subtitle records in the
#' file.
#'
#' @param file Path to a file.
#'
#' @return A data frame.
#'
#' @export
read_srt <- function(file) {

  tibble::data_frame(
    raw =
      readr::read_file(file) %>%
      stringr::str_split("(\r\n){2,}|\n{2,}") %>%
      unlist()
  ) %>%
    tidyr::separate_("raw", c("index", "time", "text"), sep = "(\r\n)|\n", extra = "merge") %>%
    tidyr::separate_("time", c("start", "end"), sep = " --> ") %>%
    dplyr::mutate_(
      index = ~ as.integer(index),
      text  = ~ stringr::str_replace(text, "((\r\n)|\n)$", "")
    )

}
