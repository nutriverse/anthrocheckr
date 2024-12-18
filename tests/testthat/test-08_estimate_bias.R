# Tests for estimate_bias() ----------------------------------------------------

x <- subset(smartStdLong, measure_type == "height")

y <- calculate_mean(measures = x$measure_value, index = x$observer)

z <- calculate_mean(x$measure_value)

bias_df <- estimate_bias(
  msur = y$mean[y$index != 0], msup = y$mean[y$index == 0], mall = z
)

test_that("estimate_bias works as expected", {
  expect_s3_class(bias_df, "data.frame")
})


