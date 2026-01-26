# Calculate technical error of measurement (TEM) for two or more observers

Function to calculate technical error of measurement (TEM) when there
are more than two observers involved.

## Usage

``` r
calculate_team_tem(n, k, m)
```

## Arguments

- n:

  A numeric value specifying number of subjects

- k:

  A numeric value specifying number of observers

- m:

  A data frame of of measurements with number of columns equal to \`k\`
  and number of rows equal to \`n\`

## Value

A numeric value of the technical error of measurement (TEM). Unit of TEM
is the same as the unit of the measurements compared.

## Examples

``` r
# calculate team TEM from stature dataset
calculate_team_tem(n = 10, k = 4, m = stature[ , c("m1", "m2", "m3", "m4")])
#> [1] 0.003063223
```
