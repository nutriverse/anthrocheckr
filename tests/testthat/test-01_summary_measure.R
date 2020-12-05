library(dplyr)

## Summary measure for each observer for each anthropometric measurement
x <- summary_measure(df = smartStdLong,
                     measures = "measure_value",
                     index = c("observer", "measure_type"))

test_that("output is a data.frame", {
  expect_is(x, "data.frame")
})

test_that("names of output is correct", {
  expect_true(all(names(x) %in% c("observer", "measure_type",
                                  "mean", "sd", "max")))
})

## Summary measure for one observer for each anthropometric measurement
x <- smartStdLong %>%
  filter(observer == 1)

y <- summary_measure(df = x, measures = "measure_value", index = "measure_type")

test_that("output is a data.frame", {
  expect_is(y, "data.frame")
})

test_that("names of output is correct", {
  expect_true(all(names(y) %in% c("measure_type", "mean", "sd", "max")))
})

