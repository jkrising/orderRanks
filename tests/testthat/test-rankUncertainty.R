test_that('rankUncertainty is correct for counter', {
  intervals <- counter()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 7 / 10, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 7 / 5, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 7 / 10, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 7 / 5, tolerance = eps)
})

test_that('rankUncertainty is correct for empty', {
  intervals <- empty()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 1, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 4.5, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 1, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 4.5, tolerance = eps)
})

test_that('rankUncertainty is correct for examples', {
  intervals <- antiRetroviralIntervals()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 0.53359683794, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 5.869565217, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 0.5335968379, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 5.869565217, tolerance = eps)
})

test_that('rankUncertainty is correct for improper', {
  intervals <- improper()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 1 / 2, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 3 / 4, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 1 / 2, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 3 / 4, tolerance = eps)
})

test_that('rankUncertainty is correct for integers', {
  intervals <- integers()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 1 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 1 / 2, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 1 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 1 / 2, tolerance = eps)
})

test_that('rankUncertainty is correct for linear', {
  intervals <- linear()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 0, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 0, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 0, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 0, tolerance = eps)
})

test_that('rankUncertainty is correct for simple', {
  intervals <- simple()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 2 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 2 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 2 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 2 / 3, tolerance = eps)
})

test_that('rankUncertainty is correct for weak1', {
  intervals <- weak1()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 1 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 1 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 1 / 3, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 1 / 3, tolerance = eps)
})

test_that('rankUncertainty is correct for weak2', {
  intervals <- weak2()

  u <- rankUncertainty(intervals, TRUE, TRUE)
  expect_equal(u, 1 / 5, tolerance = eps)

  u <- rankUncertainty(intervals, TRUE, FALSE)
  expect_equal(u, 1 / 2, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, TRUE)
  expect_equal(u, 1 / 5, tolerance = eps)

  u <- rankUncertainty(intervals, FALSE, FALSE)
  expect_equal(u, 1 / 2, tolerance = eps)
})
