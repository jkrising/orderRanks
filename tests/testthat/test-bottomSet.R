test_that('bottomSet is correct for counter', {
  intervals <- counter()
  ris <- rankIntervals(intervals)

  expect_equal(length(bottomSet(ris, 1, TRUE)), 3)
  expect_equal(length(bottomSet(ris, 2, TRUE)), 4)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 5)
  expect_equal(length(bottomSet(ris, 4, TRUE)), 5)
  expect_equal(length(bottomSet(ris, 5, TRUE)), 5)
})

test_that('bottomSet is correct for empty', {
  intervals <- empty()
  ris <- rankIntervals(intervals)

  for (k in 1:10)
  {
    expect_equal(length(bottomSet(ris, k, TRUE)), 10)
  }
})

test_that('bottomSet is correct for examples', {
  intervals <- antiRetroviralIntervals()
  expect_true(all(bottomSet(intervals, 2) ==
    c(2, 3, 4, 5, 6, 7, 9, 12, 14, 15, 16, 20, 21, 22, 23)))

  ris <- rankIntervals(intervals)
  expect_equal(length(bottomSet(intervals, 2)), length(bottomSet(ris, 2, TRUE)))
})

test_that('bottomSet is correct for improper', {
  intervals <- improper()
  ris <- rankIntervals(intervals)

  expect_equal(length(bottomSet(ris, 1, TRUE)), 2)
  expect_equal(length(bottomSet(ris, 2, TRUE)), 3)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 4)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 4)
})

test_that('bottomSet is correct for integers', {
  intervals <- integers()
  ris <- rankIntervals(intervals)

  expect_equal(length(bottomSet(ris, 1, TRUE)), 1)
  expect_equal(length(bottomSet(ris, 2, TRUE)), 3)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 4)
  expect_equal(length(bottomSet(ris, 4, TRUE)), 4)
})

test_that('bottomSet is correct for linear', {
  intervals <- linear()
  ris <- rankIntervals(intervals)

  for (k in 1:nrow(intervals))
  {
    expect_equal(length(bottomSet(ris, k, TRUE)), k)
  }
})

test_that('bottomSet is correct for simple intervals', {
  intervals <- simple()
  ris <- rankIntervals(intervals)

  expect_equal(length(bottomSet(ris, 1, TRUE)), 2)
  expect_equal(length(bottomSet(ris, 2, TRUE)), 3)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 3)
})

test_that('bottomSet is correct for weak1', {
  intervals <- weak1()
  ris <- rankIntervals(intervals)

  expect_equal(length(bottomSet(ris, 1, TRUE)), 1)
  expect_equal(length(bottomSet(ris, 2, TRUE)), 3)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 3)
})

test_that('bottomSet is correct for weak2', {
  intervals <- weak2()
  ris <- rankIntervals(intervals)

  expect_equal(length(bottomSet(ris, 1, TRUE)), 2)
  expect_equal(length(bottomSet(ris, 2, TRUE)), 2)
  expect_equal(length(bottomSet(ris, 3, TRUE)), 4)
  expect_equal(length(bottomSet(ris, 4, TRUE)), 4)
  expect_equal(length(bottomSet(ris, 5, TRUE)), 6)
  expect_equal(length(bottomSet(ris, 6, TRUE)), 6)
})
