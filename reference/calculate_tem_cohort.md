# Calculate intra-observer TEM for each observer

Function to calculate \*intra-observer TEM\* for each observer using
input dataset containing multiple types of multiple measurements from
multiple observers.

## Usage

``` r
calculate_tem_cohort(df, m1, m2, index = NULL, n)
```

## Arguments

- df:

  A data.frame containing data on multiple measurements made by multiple
  observers on multiple subjects

- m1:

  A character value for variable in \`df\` containing initial round
  measurements made by multiple observers

- m2:

  A character value for variable in \`df\` containing subsequent round
  measurements made by multiple observers

- index:

  A character value or vector specifying the variable name/s in \`df\`
  containing the factors to be used to group the results into. If
  multiple observers, at least two variable names should be provided as
  observer identifiers. Any other variable in \`df\` that should be used
  as grouping factor should be included. This is \*optional\* and is set
  to NULL by default. This would indicate that the summary metrics will
  be made for the values in \`measures\` without any grouping

- n:

  Number of subjects measured

## Value

A data frame of calculated TEM per observer and per measurement type.

## Examples

``` r
# Get the TEM per observer for MUAC measurements in the smartStd dataset
calculate_tem_cohort(df = smartStd,
                     m1 = "muac1", m2 = "muac2",
                     index = "observer", n = 10)
#>    observer       tem
#> 1         0  3.694591
#> 2         1  2.428992
#> 3         2  2.819574
#> 4         3 29.631908
#> 5         4  3.674235
#> 6         5  8.941476
#> 7         6  3.008322
#> 8         7  7.641989
#> 9         8  3.232646
#> 10        9  2.313007
#> 11       10  2.037155
```
