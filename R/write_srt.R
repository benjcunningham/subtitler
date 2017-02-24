#' Read a SubRip (SRT) File
#'
#' @param x A data frame to write to disk. Must contain the columns
#'   \code{index}, \code{start}, \code{end}, and \code{text}.
#' @param path Path to write to.
#' @param append If FALSE, will overwrite existing file. If TRUE, will
#'   append to existing file. In both cases, if file does not exist a
#'   new file is created.
#'
#' @return The input x, invisibly.
#'
#' @export
write_srt <- function(x, path, append = FALSE) {

  y <-
    tibble::as_data_frame(x) %>%
    dplyr::mutate_(
      time = ~ paste(start, "-->", end),
      sub = ~ paste(index, time, text, "\n", sep = "\n")
    )

  paste(y$sub, collapse = "") %>%
    readr::write_file(path, append)

  invisible(x)

}