# Calculate relative TEM of measurements by multiple observers.

Calculate relative TEM of measurements by multiple observers.

## Usage

``` r
calculate_relative_tem(tem, mean_value)
```

## Arguments

- tem:

  A numeric vector or data frame of technical error of measurements
  produced from applying \[calculate_tem_cohort()\].

- mean_value:

  A numeric vector or data frame of mean of measurements produced from
  applying \[calculate_mean()\].

## Value

A vector or data frame of calculated relative TEM per observer and per
measurement type.

## Examples

``` r
## Calculate relative TEM for weight using the smartStd dataset
  tem <- calculate_tem_cohort(df = smartStd,
                              m1 = "weight1",
                              m2 = "weight2",
                              index = "observer",
                              n = 10)

  x <- smartStdLong[smartStdLong$measure_type == "weight", ]

  mean_value <- calculate_mean(
    measures = x$measure_value, index = x[ , "observer"]
  )

  rel_tem <- calculate_relative_tem(
    tem = tem$tem, mean_value = mean_value$mean
  )
  
  rel_tem
#>  [1] 0.5501370 2.3430872 0.8126483 0.4337829 1.1606699 9.7163749 0.9408907
#>  [8] 0.6987351 0.7782767 0.7477441 2.0123765
```
