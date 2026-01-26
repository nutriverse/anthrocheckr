# Calculate technical error of measurement (TEM)

Function to calculate \*\*technical error of measurement (TEM)\*\* based
on formula created by \*Ulijaszek and Kerr (1999)\* as an indicator of
measurement precision as described by \*Mueller and Mortorell (1998)\*.
This function is specific for intra-observer TEM for two measurements,
and for inter-observer TEM involving two measurers.

## Usage

``` r
calculate_tem(d, n)
```

## Arguments

- d:

  Numeric vector of difference between two measurements made by same
  measurer or between two measurers.

- n:

  Numeric value of number of individuals measured.

## Value

A numeric value of the technical error of measurement (TEM). Unit of TEM
is the same as the unit of the measurements compared.

## Examples

``` r
## Apply calculate_tem to smartStd dataset to get TEM for weight for
## supervisor
x <- smartStd[smartStd$observer == 0, ]
difference <- x$weight1 - x$weight2
tem <- calculate_tem(d = difference, n = length(difference))
tem
#> [1] 0.08062258
```
