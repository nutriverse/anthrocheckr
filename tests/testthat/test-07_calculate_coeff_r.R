# Tests for calculate_coeff_r --------------------------------------------------

## Calculate intra-observer TEM
intra <- calculate_tem_cohort(
  df = smartStd, m1 = "muac1", m2 = "muac2", index = "observer", n = 11
)

## Get inter-observer TEM
muacDF1 <- subset(
  smartStd, select = c(-muac2, -weight1, -weight2, -height1, -height2)
)

muacDF2 <- subset(
  smartStd, select = c(-muac1, -weight1, -weight2, -height1, -height2)
)

## Spread the dataset to wide format
muacDF1 <- tidyr::spread(muacDF1, key = "observer", value = "muac1")
muacDF2 <- tidyr::spread(muacDF2, key = "observer", value = "muac2")
muacDF <- merge(muacDF1, muacDF2, by = "subject")
inter <- calculate_team_tem(n = 10, k = 22, m = muacDF[ , 2:23])

total_tem <- calculate_total_tem(intra = intra$tem, inter = inter)

## Calculate sd
stdev <- calculate_sd(
  measures = subset(smartStdLong, measure_type == "muac")$measure_value,
  index = subset(smartStdLong, measure_type == "muac")$observer
)


test_that("calculate_coeff_r works as expected", {
  expect_type(
    calculate_coeff_r(total_tem = total_tem, sd = stdev$sd),
    "double"
  )
})