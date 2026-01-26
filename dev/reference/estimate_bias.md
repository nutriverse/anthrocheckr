# Calculate bias of a measurement

Calculate the bias of a measurement against a gold standard. Two gold
standards are used in this function: 1) measurements made by a
supervisor or a known expert; and, 2) median of all measurements made by
the observers.

## Usage

``` r
estimate_bias(msur, msup, mall)
```

## Arguments

- msur:

  A numeric value or vector of mean measurements from observers

- msup:

  A numeric value or vector of mean measurements from supervisor

- mall:

  A numeric value or vector of the median of measurements from observers

## Value

A numeric value or vector signifying bias

## Examples

``` r
x <- subset(smartStdLong, measure_type == "height")

y <- calculate_mean(measures = x$measure_value, index = x$observer)

z <- calculate_mean(x$measure_value)

estimate_bias(
  msur = y$mean[y$index != 0],
  msup = y$mean[y$index == 0],
  mall = z
)
#>     bias_super    bias_med
#> 1  0.079847112 0.073962655
#> 2  0.023247290 0.029791046
#> 3  0.001151893 0.007554346
#> 4  0.001727839 0.004656198
#> 5  0.009162783 0.002826293
#> 6  0.007644379 0.001298179
#> 7  0.003193884 0.003180777
#> 8  0.000209435 0.006605861
#> 9  0.009005707 0.015458386
#> 10 0.001937274 0.004445424
```
