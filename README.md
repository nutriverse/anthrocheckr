
<!-- README.md is generated from README.Rmd. Please edit that file -->

# anthrocheckr: An Implementation of Anthropometric Measurement Standardisation Tests in R <img src="man/figures/logo.png" width="200" align="right" />

<!-- badges: start -->

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Lifecycle:
maturing](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN
status](https://www.r-pkg.org/badges/version/anthrocheckr)](https://cran.r-project.org/package=anthrocheckr)
[![CRAN](https://img.shields.io/cran/l/anhtrocheckr.svg)](https://CRAN.R-project.org/package=anhtrocheckr)
[![CRAN](http://cranlogs.r-pkg.org/badges/anhtrocheckr)](https://CRAN.R-project.org/package=anhtrocheckr)
[![CRAN](http://cranlogs.r-pkg.org/badges/grand-total/anhtrocheckr)](https://CRAN.R-project.org/package=anhtrocheckr)
[![R build
status](https://github.com/nutriverse/anthrocheckr/workflows/R-CMD-check/badge.svg)](https://github.com/nutriverse/anthrocheckr/actions)
[![R build
status](https://github.com/nutriverse/anthrocheckr/workflows/test-coverage/badge.svg)](https://github.com/nutriverse/anthrocheckr/actions)
[![Codecov test
coverage](https://codecov.io/gh/nutriverse/anthrocheckr/branch/main/graph/badge.svg)](https://app.codecov.io/gh/nutriverse/anthrocheckr?branch=main)
[![CodeFactor](https://www.codefactor.io/repository/github/nutriverse/anthrocheckr/badge)](https://www.codefactor.io/repository/github/nutriverse/anthrocheckr)
[![R-CMD-check](https://github.com/nutriverse/anthrocheckr/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/nutriverse/anthrocheckr/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

Ensuring the precision and accuracy of measurements is critical when
collecting anthropometric data. Anthropometrists are usually tested for
precision and accuracy of measurement through standardisation tests
performed prior to anthropometric data collection. This package provides
functions to calculate inter- and intra-observer technical error of
measurement (TEM) to assess precision of measurements.

## Installation

`anthrocheckr` is still in active development and is not available on
[CRAN](https://cran.r-project.org/) yet.

You can install the development version of `anthrocheckr` from
[GitHub](https://github.com/nutriverse/anthrocheckr) with:

``` r
if(!require(remotes)) install.packages("remotes")
remotes::install_github("nutriverse/anthrocheckr")
```

## Usage

## Community guidelines

Feedback, bug reports and feature requests are welcome; file issues or
seek support [here](https://github.com/nutriverse/anthrocheckr/issues).
If you would like to contribute to the package, please see our
[contributing
guidelines](https://nutriverse.io/anthrocheckr/CONTRIBUTING.html).

Please note that the `ennet` project is released with a [Contributor
Code of
Conduct](https://nutriverse.io/anthrocheckr/CODE_OF_CONDUCT.html). By
contributing to this project, you agree to abide by its terms.
