# Tests for summary measures function ------------------------------------------

test_that("calculate_* works as expected", {
  expect_type(
    calculate_mean(
      c(
        smartStd[smartStd$observer == 0 , "weight1"], 
        smartStd[smartStd$observer == 0 , "weight2"]
      )
    ),
    "double"
  )
  expect_type(
    calculate_sd(
      c(
        smartStd[smartStd$observer == 0 , "weight1"], 
        smartStd[smartStd$observer == 0 , "weight2"]
      )
    ),
    "double"
  )
  expect_type(
    calculate_max(
      c(
        smartStd[smartStd$observer == 0 , "weight1"], 
        smartStd[smartStd$observer == 0 , "weight2"]
      )
    ),
    "double"
  )
})