
<!-- README.md is generated from README.Rmd. Please edit that file -->

# anthrocheckr: An Implementation of Anthropometric Measurement Standardisation Tests <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![R-CMD-check](https://github.com/nutriverse/anthrocheckr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nutriverse/anthrocheckr/actions/workflows/R-CMD-check.yaml)
[![R build
status](https://github.com/nutriverse/anthrocheckr/workflows/test-coverage/badge.svg)](https://github.com/nutriverse/anthrocheckr/actions)
[![Codecov test
coverage](https://codecov.io/gh/nutriverse/anthrocheckr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/nutriverse/anthrocheckr?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/nutriverse/anthrocheckr/badge)](https://www.codefactor.io/repository/github/nutriverse/anthrocheckr)
<!-- badges: end -->

Ensuring the precision and accuracy of measurements is critical when
collecting anthropometric data. Anthropometrists are usually tested for
precision and accuracy of measurement through standardisation tests
performed prior to anthropometric data collection. This package provides
functions to calculate inter- and intra-observer technical error of
measurement (TEM) to assess precision of measurements.

## What does `anthrocheckr` do?

## Installation

`anthrocheckr` is not yet on [CRAN](https://cran.r-project.org) but can
be installed from the [nutriverse R
universe](https://nutriverse.r-universe.dev) as follows:

``` r
install.packages(
  "anthrocheckr",
  repos = c('https://nutriverse.r-universe.dev', 'https://cloud.r-project.org')
)
```

## Usage

## Citation

If you find the `anthrocheckr` package useful please cite using the
suggested citation provided by a call to the `citation()` function as
follows:

``` r
citation("anthrocheckr")
#> To cite anthrocheckr in publications use:
#> 
#>   Ernest Guevarra (2024). _anthrocheckr: An Implementation of
#>   Anthropometric Measurement Standardisation Tests_. R package
#>   version 0.0.9000, <https://nutriverse.io/anthrocheckr/>.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {anthrocheckr: An Implementation of Anthropometric Measurement Standardisation Tests},
#>     author = {{Ernest Guevarra}},
#>     year = {2024},
#>     note = {R package version 0.0.9000},
#>     url = {https://nutriverse.io/anthrocheckr/},
#>   }
```

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/nutriverse/anthrocheckr/issues).
If you would like to contribute to the package, please see our
[contributing
guidelines](https://nutriverse.io/anthrocheckr/CONTRIBUTING.html).

Please note that the `anthrocheckr` project is released with a
[Contributor Code of
Conduct](https://nutriverse.io/anthrocheckr/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
