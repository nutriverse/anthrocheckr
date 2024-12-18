xx <- calculate_tem_cohort(df = smartStd,
                           m1 = "muac1", m2 = "muac2",
                           index = "observer", n = 10)


test_that("output is a data.frame", {
  expect_s3_class(xx, "data.frame")
})

yy <- smartStd
yy$subject <- factor(x = yy$subject)

test_that("stop works", {
  expect_error(calculate_tem_cohort(df = yy,
                                    m1 = "subject", m2 = "muac2",
                                    index = "observer", n = 10))
  expect_error(calculate_tem_cohort(df = yy,
                                    m1 = "muac1", m2 = "subject",
                                    index = "observer", n = 10))
})
