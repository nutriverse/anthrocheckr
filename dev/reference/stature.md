# Example dataset from \*Ulijaszek and Kerr (1999)\* containing repeat measurements of stature \`m\` carried out by four observers on ten subjects.

Example dataset from \*Ulijaszek and Kerr (1999)\* containing repeat
measurements of stature \`m\` carried out by four observers on ten
subjects.

## Usage

``` r
stature
```

## Format

A data frame with 8 columns and 10 rows:

\| \*\*Variable\*\* \| \*\*Description\*\* \| \| :— \| :— \| \|
\*subject\* \| Subject unique identification number \| \| \*m1\* \|
Stature measurements of first observer \| \| \*m2\* \| Stature
measurements of second observer \| \| \*m3\* \| Stature measurements of
third observer \| \| \*m4\* \| Stature measurements of fourth observer
\| \| \*f1\* \| Results of the first function in the group TEM equation
\| \| \*f2\* \| Results of the second function in the group TEM equation
\| \| \*diff\* \| Difference between \`f2\` and \`f2\` (\`f2\` - \`f1\`)
\|

## Source

Ulijaszek SJ, Kerr DA. Anthropometric measurement error and the
assessment of nutritional status. Br J Nutr. 2007;82: 165–13.
doi:10.1017/S0007114599001348

## Examples

``` r
stature
#>    subject    m1    m2    m3    m4       f1       f2   diff
#> 1        1 0.865 0.863 0.863 0.864 298.4259 298.4256 0.0003
#> 2        2 1.023 1.023 1.027 1.025 419.8412 419.8401 0.0011
#> 3        3 0.982 0.980 0.989 0.985 387.3070 387.3024 0.0046
#> 4        4 0.817 0.816 0.812 0.817 266.0178 266.0161 0.0017
#> 5        5 0.901 0.894 0.900 0.903 323.6446 323.6401 0.0045
#> 6        6 0.880 0.876 0.881 0.881 309.4098 309.4081 0.0017
#> 7        7 0.948 0.947 0.947 0.946 358.7238 358.7236 0.0002
#> 8        8 0.906 0.905 0.907 0.908 328.6974 328.6969 0.0005
#> 9        9 0.924 0.924 0.926 0.924 341.8804 341.8801 0.0003
#> 10      10 0.989 0.987 1.002 0.993 394.2343 394.2210 0.0133
```
