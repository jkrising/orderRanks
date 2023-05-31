test_that('rankIntervals is correct for counter', {
  intervals <- counter()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == c(1, 1, 1, 2, 3)))
  expect_true(all(ris[, 'right'] == c(3, 4, 5, 5, 5)))
})

test_that('rankIntervals is correct for empty', {
  intervals <- empty()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == rep(1, 10)))
  expect_true(all(ris[, 'right'] == rep(10, 10)))
})

test_that('rankIntervals is correct for examples', {
  intervals <- antiRetroviralIntervals()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] ==
    c(4, 8, 9, 3, 6, 5, 8, 6, 6, 6, 1, 8, 1, 8, 8, 11, 5, 6, 3, 8, 6, 8, 7)))
  expect_true(all(ris[, 'right'] ==
    c(5, 23, 23, 23, 23, 23, 23, 14, 22, 21, 2, 23, 2, 23, 23, 23, 7, 13, 4,
      23, 22, 23, 23)))
})

test_that('rankIntervals is correct for improper', {
  intervals <- improper()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == c(1, 1, 2, 3)))
  expect_true(all(ris[, 'right'] == c(4, 2, 3, 4)))
})

test_that('rankIntervals is correct for integers', {
  intervals <- integers()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == c(1, 1, 2, 4)))
  expect_true(all(ris[, 'right'] == c(2, 3, 3, 4)))
})

test_that('rankIntervals is correct for linear', {
  intervals <- linear()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == 1:nrow(intervals)))
  expect_true(all(ris[, 'right'] == 1:nrow(intervals)))
})

test_that('rankIntervals is correct for simple intervals', {
  intervals <- simple()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == c(1, 1, 2)))
  expect_true(all(ris[, 'right'] == c(2, 3, 3)))
})

test_that('rankIntervals is correct for weak1', {
  intervals <- weak1()

  expect_equal(rankIntervals(intervals), rankIntervals.naive(intervals))
})

test_that('rankIntervals is correct for weak2', {
  intervals <- weak2()

  ris <- rankIntervals(intervals)
  expect_true(all(ris[, 'left'] == c(1, 1, 3, 3, 5, 5)))
  expect_true(all(ris[, 'right'] == c(2, 2, 4, 4, 6, 6)))
})
