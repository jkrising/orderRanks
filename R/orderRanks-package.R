#' orderRanks: Order-Theoretic Methods for Ranking
#'
#' This package provides implementations of methods detailed in
#' \insertCite{rising2023orderRanks;textual}{orderRanks} and other functions
#' necessary to support them.  This page provides documentation on topics that
#' do not pertain to any single method.
#'
#' @section Data Types:
#'
#' There are two data types that are used in this package: ranking vectors and
#' collections of intervals.  A ranking vector corresponds to the ranks of some
#' numerical values and is produced by [base::rank] with `ties.method = 'min'`.
#'
#' A collection of intervals is a data frame with two columns named `'left'` and
#' `'right'`.  Each row corresponds to a nonempty interval estimate of some
#' unknown parameter so we require that these be numerical values with `'left'`
#' strictly less than `'right'`.
#'
#' @references
#' \insertAllCited{}
#'
#' @docType package
#' @name orderRanks
#'
#' @importFrom Rdpack reprompt
#'
## usethis namespace: start
#' @useDynLib orderRanks, .registration = TRUE
#' @importFrom Rcpp sourceCpp
## usethis namespace: end
NULL
