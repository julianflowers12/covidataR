
<!-- README.md is generated from README.Rmd. Please edit that file -->

# covidataR

<!-- badges: start -->
<!-- badges: end -->

The goal of covidataR is to facilitate rapid access of UK COVID data
into R for visualisation and further analysis.

## Installation

You can install the released version of covidataR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("julianflowers12/covidataR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(covidataR)

df <- covidataR::get_cases_age_england()
#> Loading required package: jsonlite
#> Loading required package: dplyr
#> 
#> Attaching package: 'dplyr'
#> The following objects are masked from 'package:stats':
#> 
#>     filter, lag
#> The following objects are masked from 'package:base':
#> 
#>     intersect, setdiff, setequal, union
#> Loading required package: tidyr
head(df)
#> # A tibble: 6 × 8
#>   areaType areaName areaCode  date       age   cases rollingSum rollingRate
#>   <chr>    <chr>    <chr>     <chr>      <chr> <int>      <int>       <dbl>
#> 1 nation   England  E92000001 2021-09-15 00_04   558       4064        126.
#> 2 nation   England  E92000001 2021-09-15 00_59 19519     129230        301.
#> 3 nation   England  E92000001 2021-09-15 05_09  2397      14732        416.
#> 4 nation   England  E92000001 2021-09-15 10_14  4360      25127        731.
#> 5 nation   England  E92000001 2021-09-15 15_19  2077      14482        465.
#> 6 nation   England  E92000001 2021-09-15 20_24   963       7346        212.
```
