#' Read a SubRip (SRT) File
#'
#' @param file Path to a file.
#'
#' @return A data frame.
#'
#' @export
read_srt <- function(file) {

  size <- file.info(file)$size

  subs <-
    readChar(file, size) %>%
    stringr::str_split("(\r\n){2,}|\n{2,}") %>%
    unlist()

  purrr::map_df(subs[subs != ""], function(x) {

    sub <- unlist(stringr::str_split(x, "(\r\n)|\n"))

    tibble::data_frame(
      index =
        sub[1] %>%
        as.integer(),
      start =
        sub[2] %>%
        stringr::str_extract("^\\d+:\\d+:\\d+,\\d+"),
      end =
        sub[2] %>%
        stringr::str_extract("\\d+:\\d+:\\d+,\\d+$"),
      text  =
        sub[3:length(sub)] %>%
        paste(collapse = "\n")
    )

  })

}
