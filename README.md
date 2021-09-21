
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
#> Downloading GitHub repo julianflowers12/covidataR@HEAD
#>      checking for file ‘/private/var/folders/bk/jrqs03tx5mq9s28mhml5xzhm0000gn/T/RtmpP9Ru0P/remotes1228b6cb5e262/julianflowers12-covidataR-bb87d0e/DESCRIPTION’ ...  ✓  checking for file ‘/private/var/folders/bk/jrqs03tx5mq9s28mhml5xzhm0000gn/T/RtmpP9Ru0P/remotes1228b6cb5e262/julianflowers12-covidataR-bb87d0e/DESCRIPTION’
#>   ─  preparing ‘covidataR’:
#>    checking DESCRIPTION meta-information ...  ✓  checking DESCRIPTION meta-information
#>   ─  checking for LF line-endings in source and make files and shell scripts
#>   ─  checking for empty or unneeded directories
#>    Omitted ‘LazyData’ from DESCRIPTION
#>   ─  building ‘covidataR_0.1.0.tar.gz’
#>      
#> 
#> Installing package into '/Users/julianflowers/Dropbox/Mac (2)/Desktop/covidataR/renv/library/R-4.1/aarch64-apple-darwin20'
#> (as 'lib' is unspecified)
#> Warning in i.p(...): installation of package '/var/folders/bk/
#> jrqs03tx5mq9s28mhml5xzhm0000gn/T//RtmpP9Ru0P/file1228b1921c7b0/
#> covidataR_0.1.0.tar.gz' had non-zero exit status
```

## Example

Extract data…

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

Plot…

``` r
library(covidataR)

covidataR::plot_cases_age_england(age = "10_14")
#> Loading required package: ggplot2
#> Loading required package: zoo
#> 
#> Attaching package: 'zoo'
#> The following objects are masked from 'package:base':
#> 
#>     as.Date, as.Date.numeric
#> Warning: Removed 6 row(s) containing missing values (geom_path).
```

<img src="man/figures/README-example1-1.png" width="100%" />
