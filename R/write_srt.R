#' Write a data frame of SubRip (SRT) parts to file
#'
#' Takes a data frame of SubRip subtitle components and writes them to
#' file to the specification of the format.
#'
#' @param x Data frame to write to disk. Must contain the columns
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

  stopifnot(tibble::is_tibble(x))

  glue::glue_data(x, "{index}\n{start} --> {end}\n{text}\n\n") %>%
    glue::collapse(sep = "\n") %>%
    readr::write_file(path, append)

  invisible(x)

}
