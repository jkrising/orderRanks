// [[Rcpp::interfaces(r, cpp)]]
#ifndef METHODS_H
#define METHODS_H

#include <Rcpp.h>

// [[Rcpp::export]]
bool getCompatibility(const Rcpp::IntegerVector &ranking,
                      const Rcpp::NumericVector &left,
                      const Rcpp::NumericVector &right);

// [[Rcpp::export]]
double getRankDistance(const Rcpp::IntegerVector &r1,
                       const Rcpp::IntegerVector &r2);

// [[Rcpp::export]]
Rcpp::DataFrame getRankIntervals(const Rcpp::NumericVector &left,
                                 const Rcpp::NumericVector &right);

#endif
