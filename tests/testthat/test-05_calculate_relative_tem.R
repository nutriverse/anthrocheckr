# Tests for calculate_relative_tem ---------------------------------------------

tem <- calculate_tem_cohort(
  df = smartStd, m1 = "weight1", m2 = "weight2", index = "observer", n = 10
)

x <- smartStdLong[smartStdLong$measure_type == "weight", ]

mean_value <- calculate_mean(
  measures = x$measure_value, index = x[ , "observer"]
)

rel_tem <- calculate_relative_tem(tem = tem$tem, mean_value = mean_value$mean)

test_that("calculate_relative_tem works as expected", {
  expect_type(rel_tem, "double")
})
