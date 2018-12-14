
<!-- README.md is generated from README.Rmd. Please edit that file -->

# anthrocheckr: An Implementation of Anthropometric Measurement Standardisation Tests in R

[![Project Status: Active – The project has reached a stable, usable
state and is being actively
developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![lifecycle](https://img.shields.io/badge/lifecycle-maturing-blue.svg)](https://www.tidyverse.org/lifecycle/#maturing)
[![CRAN
status](https://www.r-pkg.org/badges/version/anthrocheckr)](https://cran.r-project.org/package=anthrocheckr)
[![Travis build
status](https://travis-ci.org/nutriverse/anthrocheckr.svg?branch=master)](https://travis-ci.org/nutriverse/anthrocheckr)
[![AppVeyor build
status](https://ci.appveyor.com/api/projects/status/github/nutriverse/anthrocheckr?branch=master&svg=true)](https://ci.appveyor.com/project/nutriverse/anthrocheckr)

Ensuring the precision and accuracy of measurements is critical when
collecting anthropometric data. Anthropometrists are usually tested for
precision and accuracy of measurement through standardisation tests
performed prior to anthropometric data collection. This package provides
functions to calculate inter- and intra-observer technical error of
measurement (TEM) to assess precision of measurements.

## Installation

You can install the development version of `anthrocheckr` from
[GitHub](https://github.com/nutriverse/anthrocheckr) with:

``` r
if(!require(devtools)) install.packages("devtools")
devtools::install_github("nutriverse/anthrocheckr")
```
