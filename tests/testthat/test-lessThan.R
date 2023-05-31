test_that('lessThan is correct for counter', {
  intervals <- counter()
  expect_true(lessThan(intervals, 1, 4))
  expect_true(lessThan(intervals, 1, 5))
  expect_true(lessThan(intervals, 2, 5))
})

test_that('lessThan is correct for empty', {
  intervals <- empty()
  n <- nrow(intervals)
  k <- 10
  lefts <- sample(n, k)
  rights <- sample(n, k)
  for (i in 1:k)
  {
    expect_false(lessThan(intervals, lefts[i], rights[i]))
  }
})

test_that('lessThan is correct for example', {
  intervals <- antiRetroviralIntervals()
  expect_false(lessThan(intervals, 2, 3))
  expect_true(lessThan(intervals, 1, 10))
})

test_that('lessThan is correct for improper', {
  intervals <- improper()

  expect_false(lessThan(intervals, 1, 2))
  expect_false(lessThan(intervals, 1, 3))
  expect_false(lessThan(intervals, 1, 4))
  expect_false(lessThan(intervals, 2, 1))
  expect_false(lessThan(intervals, 3, 1))
  expect_false(lessThan(intervals, 4, 1))

  expect_true(lessThan(intervals, 2, 3))
  expect_true(lessThan(intervals, 2, 4))
  expect_true(lessThan(intervals, 3, 4))
})

test_that('lessThan is correct for integers', {
  intervals <- integers()

  expect_false(lessThan(intervals, 1, 2))
  expect_false(lessThan(intervals, 2, 3))

  expect_true(lessThan(intervals, 1, 3))
  expect_true(lessThan(intervals, 1, 4))
  expect_true(lessThan(intervals, 2, 4))
  expect_true(lessThan(intervals, 3, 4))
})

test_that('lessThan is correct for linear', {
  intervals <- linear()

  p <- nrow(intervals)
  for (i in 1:p)
  {
    for (j in 1:p)
    {
      expect_equal(lessThan(intervals, i, j), i < j)
    }
  }
})

test_that('lessThan is correct for simple intervals', {
  intervals <- simple()

  expect_false(lessThan(intervals, 1, 1))
  expect_false(lessThan(intervals, 1, 2))
  expect_false(lessThan(intervals, 2, 1))
  expect_false(lessThan(intervals, 2, 2))
  expect_false(lessThan(intervals, 2, 3))
  expect_false(lessThan(intervals, 3, 1))
  expect_false(lessThan(intervals, 3, 2))
  expect_false(lessThan(intervals, 3, 3))

  expect_true(lessThan(intervals, 1, 3))
})

test_that('lessTank is correct for weak1', {
  intervals <- weak1()

  expect_false(lessThan(intervals, 1, 2))

  expect_true(lessThan(intervals, 1, 3))
  expect_true(lessThan(intervals, 2, 3))
})

test_that('lessThan is correct for weak2', {
  intervals <- weak2()

  expect_false(lessThan(intervals, 1, 2))
  expect_false(lessThan(intervals, 2, 1))
  expect_false(lessThan(intervals, 3, 1))
  expect_false(lessThan(intervals, 5, 2))

  expect_true(lessThan(intervals, 1, 3))
  expect_true(lessThan(intervals, 2, 5))
})
