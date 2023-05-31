#include <Rcpp.h>
#include <testthat.h>
#include <vector>

#include "misc.h"
#include "valueMap.h"

context("cpp: join") {
  test_that("join works 1") {
    std::vector<unsigned int> args = {1, 2, 3};
    auto s = join(args, " ");
    expect_true(s.compare("1 2 3") == 0);
  }

  test_that("join works 2") {
    std::vector<unsigned int> args = {1};
    auto s = join(args, " ");
    expect_true(s.compare("1") == 0);
  }

  test_that("join works 3") {
    std::vector<unsigned int> args = {};
    auto s = join(args, " ");
    expect_true(s.compare("") == 0);
  }
}

context("cpp: ValueMap") {
  Rcpp::NumericVector left = {1.333333, 1.166667, 0.250000};
  Rcpp::NumericVector right = {1.666667, 1.833333, 0.750000};

  test_that("ValueMap::makeValueMap works") {
    Rcpp::NumericVector left = {0, 0, 1, 2};
    Rcpp::NumericVector right = {1, 2, 2, 3};

    valueMap vmap = valueMap::makeValueMap(left, right);
    expect_true(vmap.map().size() == 4);

    auto iter = vmap.map().begin();
    expect_true(iter->first == 0);
    expect_true(iter->second.left().size() == 2);
    expect_true(iter->second.left()[0] == 0);
    expect_true(iter->second.left()[1] == 1);
    expect_true(iter->second.right().size() == 0);

    iter++;
    expect_true(iter->first == 1);
    expect_true(iter->second.left().size() == 1);
    expect_true(iter->second.left()[0] == 2);
    expect_true(iter->second.right().size() == 1);
    expect_true(iter->second.right()[0] == 0);

    iter++;
    expect_true(iter->first == 2);
    expect_true(iter->second.left().size() == 1);
    expect_true(iter->second.left()[0] == 3);
    expect_true(iter->second.right().size() == 2);
    expect_true(iter->second.right()[0] == 1);
    expect_true(iter->second.right()[1] == 2);

    iter++;
    expect_true(iter->first == 3);
    expect_true(iter->second.left().size() == 0);
    expect_true(iter->second.right().size() == 1);
    expect_true(iter->second.right()[0] == 3);
  }
}
