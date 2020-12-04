x <- smartStd[smartStd$observer == 0, ]
difference <- x$weight1 - x$weight2
tem <- calculate_tem(d = difference, n = length(difference))

test_that("output is numeric", {
  expect_is(tem, "numeric")
})
