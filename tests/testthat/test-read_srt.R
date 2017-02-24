context("Read SubRip Files")

library(readr)

test_that("Read in data frame looks as expected", {

  srt <- read_srt("charlie_work.srt")
  csv <- read_csv("charlie_work.csv")

  expect_equal(srt[1:3, ], csv[1:3, ])

})
