pkgname <- "SaturnCoefficient"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
base::assign(".ExTimings", "SaturnCoefficient-Ex.timings", pos = 'CheckExEnv')
base::cat("name\tuser\tsystem\telapsed\n", file=base::get(".ExTimings", pos = 'CheckExEnv'))
base::assign(".format_ptime",
function(x) {
  if(!is.na(x[4L])) x[1L] <- x[1L] + x[4L]
  if(!is.na(x[5L])) x[2L] <- x[2L] + x[5L]
  options(OutDec = '.')
  format(x[1L:3L], digits = 7L)
},
pos = 'CheckExEnv')

### * </HEADER>
library('SaturnCoefficient')

base::assign(".oldSearch", base::search(), pos = 'CheckExEnv')
base::assign(".old_wd", base::getwd(), pos = 'CheckExEnv')
cleanEx()
nameEx("Saturn_coefficient")
### * Saturn_coefficient

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: Saturn_coefficient
### Title: Function that calculates the Saturn coefficient to quantify the
###   quality of a UMAP dimensionality reduction
### Aliases: Saturn_coefficient

### ** Examples


this_nrows <- 200
this_ncols <- 100
this_min <- 0
this_max <- 10000
noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
     min = this_min, max = this_max), nrow = this_nrows)
input_matrix <- as.matrix(noise_random_matrix)
these_nearest_neighbors <- 15
this_min_dist <- 0.05

library("umap")
custom.settings <- umap::umap.defaults
custom.settings$"n_neighbors" <- these_nearest_neighbors
custom.settings$"min_dist" <- this_min_dist

x_umap <- umap::umap(input_matrix, config=custom.settings)

this_verbose <- FALSE
thisSaturn <- Saturn_coefficient(input_matrix, x_umap$"layout",  this_verbose)
cat("Saturn coefficient = ", thisSaturn, "\n", sep="")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("Saturn_coefficient", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("calculatesSaturnContinuityTrustworthiness")
### * calculatesSaturnContinuityTrustworthiness

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: calculatesSaturnContinuityTrustworthiness
### Title: Function that calculates the Saturn coefficient, trustworthiness
###   score, and the continuity score of a UMAP dimensionality reduction
### Aliases: calculatesSaturnContinuityTrustworthiness

### ** Examples


this_nrows <- 200
this_ncols <- 100
this_min <- 0
this_max <- 10000
noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
     min = this_min, max = this_max), nrow = this_nrows)
input_matrix <- as.matrix(noise_random_matrix)
these_nearest_neighbors <- 15
this_min_dist <- 0.05

library("umap")
custom.settings <- umap::umap.defaults
custom.settings$"n_neighbors" <- these_nearest_neighbors
custom.settings$"min_dist" <- this_min_dist

x_umap <- umap::umap(input_matrix, config=custom.settings)

this_verbose <- FALSE
theseThreeMetrics <- calculatesSaturnContinuityTrustworthiness(input_matrix,
     x_umap$"layout",  this_verbose)
print(theseThreeMetrics)



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("calculatesSaturnContinuityTrustworthiness", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("continuity_score")
### * continuity_score

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: continuity_score
### Title: Function that calculates the continuity score of a UMAP
###   dimensionality reduction
### Aliases: continuity_score

### ** Examples


this_nrows <- 200
this_ncols <- 100
this_min <- 0
this_max <- 10000
noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
     min = this_min, max = this_max), nrow = this_nrows)
input_matrix <- as.matrix(noise_random_matrix)
these_nearest_neighbors <- 15
this_min_dist <- 0.05

library("umap")
custom.settings <- umap::umap.defaults
custom.settings$"n_neighbors" <- these_nearest_neighbors
custom.settings$"min_dist" <- this_min_dist

x_umap <- umap::umap(input_matrix, config=custom.settings)

this_verbose <- FALSE
thisCon <- continuity_score(input_matrix, x_umap$"layout",  this_verbose)
cat("continuity = ", thisCon, "\n", sep="")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("continuity_score", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
cleanEx()
nameEx("trustworthiness_score")
### * trustworthiness_score

flush(stderr()); flush(stdout())

base::assign(".ptime", proc.time(), pos = "CheckExEnv")
### Name: trustworthiness_score
### Title: Function that calculates the trustworthiness score of a UMAP
###   dimensionality reduction
### Aliases: trustworthiness_score

### ** Examples


this_nrows <- 200
this_ncols <- 100
this_min <- 0
this_max <- 10000
noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
     min = this_min, max = this_max), nrow = this_nrows)
input_matrix <- as.matrix(noise_random_matrix)
these_nearest_neighbors <- 15
this_min_dist <- 0.05

library("umap")
custom.settings <- umap::umap.defaults
custom.settings$"n_neighbors" <- these_nearest_neighbors
custom.settings$"min_dist" <- this_min_dist

x_umap <- umap(input_matrix, config=custom.settings)

this_verbose <- FALSE
thisTW <- trustworthiness_score(input_matrix, x_umap$"layout",  this_verbose)
cat("trustworthiness = ", thisTW, "\n", sep="")



base::assign(".dptime", (proc.time() - get(".ptime", pos = "CheckExEnv")), pos = "CheckExEnv")
base::cat("trustworthiness_score", base::get(".format_ptime", pos = 'CheckExEnv')(get(".dptime", pos = "CheckExEnv")), "\n", file=base::get(".ExTimings", pos = 'CheckExEnv'), append=TRUE, sep="\t")
### * <FOOTER>
###
cleanEx()
options(digits = 7L)
base::cat("Time elapsed: ", proc.time() - base::get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
