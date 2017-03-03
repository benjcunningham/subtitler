context("Work with SubRip Files")

suppressMessages({

  library(dplyr)
  library(readr)

  srt <- read_srt("charlie_work.srt")
  csv <- read_csv("charlie_work.csv")

  cols <- c("index", "start", "end", "text")

})


test_that("Read in data frame looks as expected", {

  expect_equal(srt[cols], csv[cols])

})

test_that("Timestamps convert to milliseconds", {

  expect_equal(as_milliseconds(srt$start), csv$start_ms)
  expect_equal(as_milliseconds(srt$end), csv$end_ms)

})

test_that("Milliseconds convert to timestamps", {

  expect_equal(as_timestamp(csv$start_ms), srt$start)
  expect_equal(as_timestamp(csv$end_ms), srt$end)

})

test_that("Written out SRT looks exactly like the original", {

  tmp <- tempfile()
  on.exit(unlink(tmp))

  write_srt(srt, tmp)

  infile <- read_file("charlie_work.srt")
  outfile <- read_file(tmp)

  expect_equal(infile, outfile)

})
