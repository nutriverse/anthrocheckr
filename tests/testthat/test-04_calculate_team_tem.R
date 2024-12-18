# Tests for calculate_team_tem -------------------------------------------------

team_tem <- calculate_team_tem(
  n = 10, k = 4, m = stature[ , c("m1", "m2", "m3", "m4")]
)

test_that("calculate_team_tem works as expected", {
  expect_type(team_tem, "double")
})

expect_error(calculate_team_tem(n = 10, k = 4, m = stature$m1))

expect_error(
  calculate_team_tem(
    n = 10, k = 4, m = stature[1:9, c("m1", "m2", "m3")]
  )
)
