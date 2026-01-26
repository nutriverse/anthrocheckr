# Calculate the coefficient of reliability (R).

Calculate the coefficient of reliability (R).

## Usage

``` r
calculate_coeff_r(total_tem, sd)
```

## Arguments

- total_tem:

  A numeric value for total TEM

- sd:

  A numeric vector for standard deviation of measurements

## Value

A numeric vector of coefficient of reliability values per observer

## Examples

``` r
# Calculate intra-observer TEM
intra <- calculate_tem_cohort(df = smartStd,
                              m1 = "muac1",
                              m2 = "muac2",
                              index = "observer",
                              n = 11)

# Get inter-observer TEM
muacDF1 <- subset(smartStd,
                  select = c(-muac2, -weight1, -weight2, -height1, -height2))
muacDF2 <- subset(smartStd,
                  select = c(-muac1, -weight1, -weight2, -height1, -height2))

# Spread the dataset to wide format
library(tidyr)
muacDF1 <- tidyr::spread(muacDF1, key = "observer", value = "muac1")
muacDF2 <- tidyr::spread(muacDF2, key = "observer", value = "muac2")
muacDF <- merge(muacDF1, muacDF2, by = "subject")
inter <- calculate_team_tem(n = 10, k = 22, m = muacDF[ , 2:23])

total_tem <- calculate_total_tem(intra = intra, inter = inter)
#> Warning: ‘^’ not meaningful for factors

# Calculate sd
stdev <- calculate_sd(
  measures = subset(smartStdLong, measure_type == "muac")$measure_value,
  index = subset(smartStdLong, measure_type == "muac")$observer
)

calculate_coeff_r(total_tem = total_tem, sd = stdev)
#> Warning: ‘/’ not meaningful for factors
#>    index sd
#> 1     NA NA
#> 2     NA NA
#> 3     NA NA
#> 4     NA NA
#> 5     NA NA
#> 6     NA NA
#> 7     NA NA
#> 8     NA NA
#> 9     NA NA
#> 10    NA NA
#> 11    NA NA
```
