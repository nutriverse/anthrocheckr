library(dplyr)

## Summary measure for each observer for each anthropometric measurement
x <- summary_measure(x = smartStdLong$measure_value,
                     index = smartStdLong[ , c("observer", "measure_type")])

test_that("output is a list", {
  expect_is(x, "list")
})

test_that("names of output is correct", {
  expect_true(all(names(x) %in% c("mean", "sd", "max")))
})

## Summary measure for one observer for each anthropometric measurement
x <- smartStdLong %>%
  filter(observer == 1)

y <- summary_measure(x = x$measure_value, index = x$measure_type)

test_that("output is a data.frame", {
  expect_is(y, "data.frame")
})

test_that("names of output is correct", {
  expect_true(all(names(y) %in% c("mean", "sd", "max")))
})

