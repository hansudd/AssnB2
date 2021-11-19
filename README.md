
<!-- README.md is generated from README.Rmd. Please edit that file -->

# B2package

<!-- badges: start -->
<!-- badges: end -->

The goal of B2package is to provide a package that contains a function
that helps provide a snapshot of one’s data. Specifically, this package
provides a data snapshot of two numeric variables. It contains a
function which returns summary statistics for the numeric variables, as
well as a scatterplot and the adjusted R squared value to provide a
sense of the linear relationship between the variables (if any).

## Installation

B2package is not yet on CRAN. But, you can download it from this
repository using the following R command:

``` r
devtools::install_github("hansudd/AssnB2")
```

And the development version from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("hansudd/AssnB2", ref = "0.1.0")
```

## Example

This is a basic example which shows you how to quickly visualize and
assess the relationship between two numeric variables:

``` r
library(B2package)
## basic example code
data_snapshot(mtcars, hp, mpg)
#> [[1]]
#>   max min     mean median
#> 1 335  52 146.6875    123
#> 
#> [[2]]
#>    max  min     mean median
#> 1 33.9 10.4 20.09062   19.2
#> 
#> [[3]]
```

<img src="man/figures/README-example-1.png" width="100%" />

    #> 
    #> [[4]]
    #> [1] 0.5891853

This package is helpful if you frequently work on datasets with two
numeric variables, and you want to quickly determine if there is a
linear relationship between the variables.
