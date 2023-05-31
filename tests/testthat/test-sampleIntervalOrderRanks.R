test_that('sampleIntervalOrderRanks is correct for counter', {
  intervals <- counter()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(1, 1, 1, 4, 5)))
})

test_that('sampleIntervalOrderRanks is correct for empty', {
  intervals <- empty()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == rep(1, nrow(intervals))))
})

test_that('sampleIntervalOrderRanks is correct for examples', {
  intervals <- antiRetroviralIntervals()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(5, 15, 22, 3, 8, 6, 15, 8, 8, 8, 1, 15, 1, 15, 15,
                         23, 6, 8, 3, 15, 8, 15, 14)))
})

test_that('sampleIntervalOrderRanks is correct for improper', {
  intervals <- improper()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(1, 1, 3, 4)))
})

test_that('sampleIntervalOrderRanks is correct for integers', {
  intervals <- integers()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(1, 1, 3, 4)))
})

test_that('sampleIntervalOrderRanks is correct for linear', {
  intervals <- linear()
  r <- sampleIntervalOrderRanks(intervals)
  expect_true(all(r == 1:nrow(intervals)))
})

test_that('sampleIntervalOrderRanks is correct for simple', {
  intervals <- simple()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(1, 1, 3)))
})

test_that('sampleIntervalOrderRanks is correct for weak1', {
  intervals <- weak1()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(1, 1, 3)))
})

test_that('sampleIntervalOrderRanks is correct for weak2', {
  intervals <- weak2()
  ris <- rankIntervals(intervals)
  r <- sampleIntervalOrderRanks(ris, TRUE)
  expect_true(all(r == c(1, 1, 3, 3, 5, 5)))
})
