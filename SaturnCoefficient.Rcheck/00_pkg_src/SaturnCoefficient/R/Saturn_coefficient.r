#' Function that calculates the Saturn coefficient to quantify the quality of a UMAP dimensionality reduction
#'
#' @param original_matrix input matrix
#' @param umap_output_layout output matrix of UMAP applied to original_matrix
#' @param VERBOSE prints some intermediate message to standard output or not
#' @export
#' @import MatrixCorrelation stats umap
#' @return a real value containing the Saturn coefficient
#' @examples
#'
#' this_nrows <- 200
#' this_ncols <- 100
#' this_min <- 0
#' this_max <- 10000
#' noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
#'      min = this_min, max = this_max), nrow = this_nrows)
#' input_matrix <- as.matrix(noise_random_matrix)
#' these_nearest_neighbors <- 15
#' this_min_dist <- 0.05
#'
#' library("umap")
#' custom.settings <- umap::umap.defaults
#' custom.settings$"n_neighbors" <- these_nearest_neighbors
#' custom.settings$"min_dist" <- this_min_dist
#'
#' x_umap <- umap::umap(input_matrix, config=custom.settings)
#'
#' this_verbose <- FALSE
#' thisSaturn <- Saturn_coefficient(input_matrix, x_umap$"layout",  this_verbose)
#' cat("Saturn coefficient = ", thisSaturn, "\n", sep="")
Saturn_coefficient <- function(original_matrix, umap_output_layout, VERBOSE) {

        # we scale the values into the [0;1] interval
        original_matrix_norm <- original_matrix / max(original_matrix) ## to double check

        # we compute the distance matrix of the input matrix and the distance matrix of the output matrix
        original_matrix_norm_dist <- stats::dist(as.matrix(original_matrix_norm))
        umap_output_layout_dist <- stats::dist(as.matrix(umap_output_layout))

        # we compute the Adjusted RV coefficient
        Saturn <- MatrixCorrelation::RVadjMaye(original_matrix_norm_dist, umap_output_layout_dist, center = TRUE)

        if(VERBOSE) cat("Saturn score = ", Saturn, "\n", sep ="")

        return(Saturn)
}



#' Function that calculates the trustworthiness score of a UMAP dimensionality reduction
#'
#' @param original_matrix input matrix
#' @param umap_output_layout output matrix of UMAP applied to original_matrix
#' @param VERBOSE prints some intermediate message to standard output or not
#' @export
#' @import ProjectionBasedClustering stats umap
#' @return a real value containing the trustworthiness score
#' @examples
#'
#' this_nrows <- 200
#' this_ncols <- 100
#' this_min <- 0
#' this_max <- 10000
#' noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
#'      min = this_min, max = this_max), nrow = this_nrows)
#' input_matrix <- as.matrix(noise_random_matrix)
#' these_nearest_neighbors <- 15
#' this_min_dist <- 0.05
#'
#' library("umap")
#' custom.settings <- umap::umap.defaults
#' custom.settings$"n_neighbors" <- these_nearest_neighbors
#' custom.settings$"min_dist" <- this_min_dist
#'
#' x_umap <- umap(input_matrix, config=custom.settings)
#'
#' this_verbose <- FALSE
#' thisTW <- trustworthiness_score(input_matrix, x_umap$"layout",  this_verbose)
#' cat("trustworthiness = ", thisTW, "\n", sep="")
trustworthiness_score <- function(original_matrix, umap_output_layout, VERBOSE) {

        ContTrustMeasureOutput <- as.data.frame(ProjectionBasedClustering::ContTrustMeasure(original_matrix, umap_output_layout, ncol(original_matrix)))
        colnames(ContTrustMeasureOutput) <- c("neighboorhoodSize", "worstCaseTW", "aveTW", "bestCaseTW", "worstCaseCon", "aveCon", "bestCaseCon")

        if(VERBOSE) cat("\n == trustworthiness == \n")
        if(VERBOSE) cat("average trustworthiness for ", ncol(original_matrix), " neighbors = ", sep="")
        if(VERBOSE) cat(ContTrustMeasureOutput[ncol(original_matrix),]$"aveTW", "\n", sep="")

        return(ContTrustMeasureOutput[ncol(original_matrix),]$"aveTW")
}

#' Function that calculates the continuity score of a UMAP dimensionality reduction
#'
#' @param original_matrix input matrix
#' @param umap_output_layout output matrix of UMAP applied to original_matrix
#' @param VERBOSE prints some intermediate message to standard output or not
#' @export
#' @import ProjectionBasedClustering stats umap
#' @return a real value containing the continuity score
#' @examples
#'
#' this_nrows <- 200
#' this_ncols <- 100
#' this_min <- 0
#' this_max <- 10000
#' noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
#'      min = this_min, max = this_max), nrow = this_nrows)
#' input_matrix <- as.matrix(noise_random_matrix)
#' these_nearest_neighbors <- 15
#' this_min_dist <- 0.05
#'
#' library("umap")
#' custom.settings <- umap::umap.defaults
#' custom.settings$"n_neighbors" <- these_nearest_neighbors
#' custom.settings$"min_dist" <- this_min_dist
#'
#' x_umap <- umap::umap(input_matrix, config=custom.settings)
#'
#' this_verbose <- FALSE
#' thisCon <- continuity_score(input_matrix, x_umap$"layout",  this_verbose)
#' cat("continuity = ", thisCon, "\n", sep="")
continuity_score <- function(original_matrix, umap_output_layout, VERBOSE) {

        ContTrustMeasureOutput <- as.data.frame(ProjectionBasedClustering::ContTrustMeasure(original_matrix, umap_output_layout, ncol(original_matrix)))
        colnames(ContTrustMeasureOutput) <- c("neighboorhoodSize", "worstCaseTW", "aveTW", "bestCaseTW", "worstCaseCon", "aveCon", "bestCaseCon")

        if(VERBOSE) cat("\n == continuity == \n")
        if(VERBOSE) cat("average continuity for ", ncol(original_matrix), " neighbors = ", sep="")
#         if(VERBOSE) cat(ContTrustMeasureOutput[ncol(original_matrix),]$"aveCon", "\n", sep="")

        return(ContTrustMeasureOutput[ncol(original_matrix),]$"aveCon")
}

#' Function that calculates the Saturn coefficient, trustworthiness score, and the continuity score of a UMAP dimensionality reduction
#'
#' @param original_matrix input matrix
#' @param umap_output_layout output matrix of UMAP applied to original_matrix
#' @param VERBOSE prints some intermediate message to standard output or not
#' @export
#' @import stats umap
#' @return a dataframe containing the Saturn coefficient, the trustworthiness score, and the continuity score
#' @examples
#'
#' this_nrows <- 200
#' this_ncols <- 100
#' this_min <- 0
#' this_max <- 10000
#' noise_random_matrix <- matrix(runif(n = this_nrows * this_ncols,
#'      min = this_min, max = this_max), nrow = this_nrows)
#' input_matrix <- as.matrix(noise_random_matrix)
#' these_nearest_neighbors <- 15
#' this_min_dist <- 0.05
#'
#' library("umap")
#' custom.settings <- umap::umap.defaults
#' custom.settings$"n_neighbors" <- these_nearest_neighbors
#' custom.settings$"min_dist" <- this_min_dist
#'
#' x_umap <- umap::umap(input_matrix, config=custom.settings)
#'
#' this_verbose <- FALSE
#' theseThreeMetrics <- calculatesSaturnContinuityTrustworthiness(input_matrix,
#'      x_umap$"layout",  this_verbose)
#' print(theseThreeMetrics)
calculatesSaturnContinuityTrustworthiness <- function(original_matrix, umap_output_layout, VERBOSE) {

        this_Saturn_score <- Saturn_coefficient(original_matrix, umap_output_layout, VERBOSE)
        this_continuity <- continuity_score(original_matrix, umap_output_layout, VERBOSE)
        this_trustworthiness <- trustworthiness_score(original_matrix, umap_output_layout, VERBOSE)

        result <- data.frame(this_Saturn_score, this_continuity, this_trustworthiness)
        colnames(result)[1] <- "Saturn_coefficient"
        colnames(result)[2] <- "trustworthiness"
        colnames(result)[3] <- "continuity"

        return(result)
}
