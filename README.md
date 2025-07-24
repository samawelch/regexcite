
<!-- README.md is generated from README.Rmd. Please edit that file -->

# regexcite

<!-- badges: start -->

<!-- badges: end -->

This is a toy package that is being uploaded while I work through
\[Chapter 1\] (<https://r-pkgs.org/whole-game.html#use_mit_license>) of
the textbook R Packages (2nd ed.).

## Installation

You can install the development version of regexcite from
[GitHub](https://github.com/) with:

``` r
# install.packages("pak")
pak::pak("samawelch/regexcite")
```

## Usage

This is a basic example which shows you how to solve a common problem:

``` r
library(regexcite)
## basic example code
str_split_one(string = "a, b, c", pattern = ", ", n = Inf) # n constraints number of returned elements
#> [1] "a" "b" "c"
```
