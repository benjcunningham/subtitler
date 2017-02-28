context("Work with SubRip Files")

suppressMessages({

  library(dplyr)
  library(readr)

  srt <-
    read_srt("charlie_work.srt") %>%
    head(3) %>%
    mutate(
      start_ms = as_milliseconds(start),
      end_ms = as_milliseconds(end)
    )

  csv <- read_csv("charlie_work.csv")

})


test_that("Read in data frame looks as expected", {

  cols <- c("index", "start", "end", "text")

  expect_equal(srt[cols], csv[cols])

})

test_that("Timestamps convert to milliseconds", {

  expect_equal(srt$start_ms, csv$start_ms)
  expect_equal(srt$end_ms, csv$end_ms)

})

test_that("Milliseconds convert to timestamps", {

  expect_equal(as_timestamp(srt$start_ms), srt$start)
  expect_equal(as_timestamp(srt$end_ms), srt$end)

})
