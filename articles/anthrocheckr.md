# Anthropometric measurement standardisation tests

Ensuring the precision and accuracy of measurements is critical when
collecting anthropometric data. Anthropometrists are usually tested for
precision and accuracy of measurement through standardisation tests
performed prior to anthropometric data collection. This package provides
functions to calculate inter- and intra-observer technical error of
measurement (TEM) to assess precision of measurements.

## What does anthrocheckr do?

[anthrocheckr](https://nutriverse.io/anthrocheckr/) provides functions
for:

1.  Calculating standard summaries for intra-observer or inter-observer
    measurements;

2.  Calculating intra-observer or inter-observer technical error of
    measurement (TEM) for multiple subjects and for multiple
    measurers/observers;

3.  Calculating multiple measurers/observers relative technical error of
    measurement (relative TEM);

4.  Calculating intra-observer total technical error of measurement
    (total TEM);

5.  Calculating coefficient of reliability; and,

6.  Calculating bias in measurements/observation against a gold
    standard.

## Installation

[anthrocheckr](https://nutriverse.io/anthrocheckr/) is not yet on
[CRAN](https://cran.r-project.org) but can be installed from the
[nutriverse R Universe](https://nutriverse.r-universe.dev) as follows:

``` r
install.packages(
  "anthrocheckr",
  repos = c('https://nutriverse.r-universe.dev', 'https://cloud.r-project.org')
)
```

## Usage
