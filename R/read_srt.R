#' Read a SubRip (SRT) File
#'
#' Read a SubRip format (filename extension \code{.srt}) text file.
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
    separate(raw, c("index", "time", "text"), sep = "(\r\n)|\n", extra = "merge") %>%
    separate(time, c("start", "end"), sep = " --> ")

}
