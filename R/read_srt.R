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

  parts <- c("index", "time", "text")
  sep <- "(\r\n)|\n"

  tibble::tibble(raw = read_srt_lines(file)) %>%
    tidyr::separate("raw", parts, sep = sep, extra = "merge") %>%
    tidyr::separate("time", c("start", "end"), sep = " --> ") %>%
    dplyr::mutate(
      index = as.integer(.data$index),
      text = stringr::str_replace(.data$text, "((\r\n)|\n)$", "")
    )

}

#' @keywords internal
read_srt_lines <- function(file) {
  f <- readr::read_file(file)
  unlist(stringr::str_split(f, "(\r\n){2,}|\n{2,}"))
}
