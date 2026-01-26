# Calculate the mean, sd and maximum difference value of measurements/observations

Get the mean, sd and maximum difference value of the
measurements/observations made by a single observer across multiple
subjects

## Usage

``` r
calculate_mean(measures, index = NULL)

calculate_sd(measures, index = NULL)

calculate_max(measures, index = NULL)
```

## Arguments

- measures:

  A vector of measurements/observations made by a single observer across
  multiple subjects

- index:

  A character vector with length equal to \`measures\` specifying the
  factors to be used to group the measurements/values into before
  applying the summary function. For a single observer, this will tend
  to be the type of measurement made if \`measures\` is a vector of
  measurements/observations of different types e.g., weight and height.
  This is \*optional\* and is set to NULL by default. This would
  indicate that the summary metrics will be made for the values in
  \`measures\` without any grouping.

## Value

A numeric value for the summary measure of measurements/observations if
\`index\` is NULL. A named numeric vector for the summary measure of
measurements/observations grouped by the factor specified by \`index\`

## Examples

``` r
## Get the mean of weight measurements by observer 0 (supervisor) from the
## smartStd dataset
x <- smartStd[smartStd$observer == 0, ]
calculate_mean(c(x$weight1, x$weight2))
#> [1] 14.655

## Get the mean weight, height and muac measurements by observer 0 from the
## smartStdLong dataset
x <- smartStdLong[smartStdLong$observer == 0, ]
calculate_mean(x$measure_value, x$measure_type)
#>    index    mean
#> 1 height  95.495
#> 2   muac 164.350
#> 3 weight  14.655

## Get the sd of weight measurements by observer 0 (supervisor) from the
## smartStd dataset
x <- smartStd[smartStd$observer == 0, ]
calculate_sd(c(x$weight1, x$weight2))
#> [1] 1.793988

## Get the sd of weight, height and muac measurements by observer 0 from the
## smartStdLong dataset
x <- smartStdLong[smartStdLong$observer == 0, ]
calculate_sd(x$measure_value, x$measure_type)
#>    index       sd
#> 1 height 4.953306
#> 2   muac 9.626034
#> 3 weight 1.793988

## Get the max difference of weight measurements by observer 0 (supervisor)
## from the smartStd dataset
x <- smartStd[smartStd$observer == 0, ]
calculate_max(abs(x$weight1 - x$weight2))
#> [1] 0.07378648

## Get the max difference of weight, height and muac measurements by observer
## 0 from the smartStd dataset
x <- smartStd[smartStd$observer == 0, ]
calculate_max(c(abs(x$weight1 - x$weight2),
                abs(x$height1 - x$height2),
                abs(x$muac1 - x$muac2)),
              c(rep("weight", 10), rep("height", 10), rep("muac", 10)))
#>    index max_diff
#> 1 height      2.2
#> 2   muac     11.0
#> 3 weight      0.2
```
