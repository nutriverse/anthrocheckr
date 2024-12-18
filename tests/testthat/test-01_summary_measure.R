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

  expect_s3_class(
    calculate_mean(smartStd$weight1, index = smartStd$observer),
    "data.frame"
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

  expect_s3_class(
    calculate_sd(smartStd$weight1, index = smartStd$observer),
    "data.frame"
  )

  expect_type(
    calculate_max(
      abs(
        smartStd[smartStd$observer == 0, "weight1"] - 
          smartStd[smartStd$observer == 0, "weight2"]
      )
    ),
    "double"
  )

  expect_s3_class(
    calculate_max(
      abs(
        smartStd[ , "weight1"] - 
          smartStd[ , "weight2"]
      ),
      index = smartStd$observer
    ),
    "data.frame"
  )
})