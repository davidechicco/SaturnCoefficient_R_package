# SaturnCoefficient

## Summary ##

R package that computes the Saturn coefficient of a matrix to assess the quality of its UMAP dimensionality reduction.

## Installation ##

To run `SaturnCoefficient`, you need to have the following programs and packages installed in your computer:

* R (version > 4.0)
* R packages: `dplyr` `MatrixCorrelation` `qpdf` `sdmpredictors` `stats` `umap`

You can install the `easyDifferentialGeneCoexpression` package and its dependencies from CRAN, and load it, with the following commands typed in the `R` terminal console:

    R
    install.packages("pacman", repos='http://cran.us.r-project.org')
    library("pacman")
    p_load("SaturnCoefficient")

## Execution instructions ##

To run `SaturnCoefficient`,  you need an input matrix and a dimensionality reduction layout generated through UMAP for that input matrix.
The last parameter allows you to decide if you want the function to print messages during its operations or not.

## An example ##
An example on a random matrix:

    this_nrows <- 200
    this_ncols <- 100
    this_min <- 0
    this_max <- 10000
    noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols, min = this_min, max = this_max), nrow = this_nrows)
    input_matrix <- as.matrix(noise_random_matrix)
    these_nearest_neighbors <- 15
    this_min_dist <- 0.05

    list.of.packages <- c("umap")
    new.packages <- list.of.packages[!(list.of.packages %in% installed.packages()[,"Package"])]
    if(length(new.packages)) install.packages(new.packages, repos='http://cran.us.r-project.org')

    custom.settings <- umap::umap.defaults
    custom.settings$"n_neighbors" <- these_nearest_neighbors
    custom.settings$"min_dist" <- this_min_dist

    x_umap <- umap::umap(input_matrix, config=custom.settings)

    this_verbose <- FALSE
    thisSaturn <- Saturn_coefficient(input_matrix, x_umap$"layout",  this_verbose)
    cat("Saturn coefficient = ", thisSaturn, "\n", sep="")

## Contacts ##

The `SaturnCoefficient` package was developed by [Davide Chicco](https://www.DavideChicco.it). Questions should be
addressed to davidechicco(AT)davidechicco.it
