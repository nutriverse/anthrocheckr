# Tests for calculate_total_tem ------------------------------------------------

# Calculate intra-observer TEM
intra <- calculate_tem_cohort(
  df = smartStd, m1 = "muac1", m2 = "muac2", index = "observer", n = 11
)

# Get inter-observer TEM
muacDF1 <- subset(
  smartStd, select = c(-muac2, -weight1, -weight2, -height1, -height2)
)

muacDF2 <- subset(
  smartStd, select = c(-muac1, -weight1, -weight2, -height1, -height2)
)

# Spread the dataset to wide format
muacDF1 <- tidyr::spread(muacDF1, key = "observer", value = "muac1")
muacDF2 <- tidyr::spread(muacDF2, key = "observer", value = "muac2")
muacDF <- merge(muacDF1, muacDF2, by = "subject")
inter <- calculate_team_tem(n = 10, k = 22, m = muacDF[ , 2:23])

total_tem <- calculate_total_tem(intra = intra$tem, inter = inter)

test_that("calculate_total_tem works as expected", {
  expect_type(total_tem, "double")
})
