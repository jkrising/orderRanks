// [[Rcpp::depends(BH)]]
#include "methods.h"

#include <Rcpp.h>

#include <boost/range/irange.hpp>

#include "maxAccumulator.h"
#include "userInterruptChecker.h"
#include "valueMap.h"

bool getCompatibility(const Rcpp::IntegerVector &ranking,
                      const Rcpp::NumericVector &left,
                      const Rcpp::NumericVector &right) {
  userInterruptChecker checker;

  auto values = valueMap::makeValueMap(left, right);
  checker.check();

  maxAccumulator rStar;

  for (auto it : values.map()) {
    auto data = it.second;

    for (auto i : data.right()) {
      rStar.update((unsigned int)ranking[i]);
    }
    checker.check();

    for (auto i : data.left()) {
      if ((unsigned int)ranking[i] <= rStar.value()) {
        return false;
      }
    }
    checker.check();
  }

  return true;
}

double getRankDistance(const Rcpp::IntegerVector &r1,
                       const Rcpp::IntegerVector &r2) {
  userInterruptChecker checker;

  double dist = 0.0;
  const int p = r1.size();
  for (auto i : boost::irange(0, p)) {
    for (int j : boost::irange(0, p)) {
      dist += ((r1[i] < r1[j]) != (r2[i] < r2[j]));
    }
    checker.check();
  }
  return dist;
}

Rcpp::DataFrame getRankIntervals(const Rcpp::NumericVector &left,
                                 const Rcpp::NumericVector &right) {
  userInterruptChecker checker;

  const unsigned int p = left.size();
  Rcpp::IntegerVector riLeft(p);
  Rcpp::IntegerVector riRight(p);

  auto values = valueMap::makeValueMap(left, right);
  checker.check();

  unsigned int cl = 0;
  unsigned int cr = 1;

  for (auto it : values.map()) {
    auto data = it.second;

    cr += data.right().size();
    for (auto i : data.left()) {
      riLeft[i] = cr;
    }
    checker.check();

    for (auto i : data.right()) {
      riRight[i] = cl;
    }
    cl += data.left().size();
    checker.check();
  }

  return Rcpp::DataFrame::create(Rcpp::Named("left") = riLeft,
                                 Rcpp::Named("right") = riRight);
}
