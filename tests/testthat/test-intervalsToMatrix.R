test_that('intervalsToMatrix works with counter', {
  intervals <- counter()

  M <- intervalsToMatrix(intervals, strict = TRUE, binary = TRUE)
  expect_true('matrix' %in% class(M))
  expect_equal(class(M[1, 1]), 'numeric')
  expect_equal(sum(diag(M)), 0)

  M <- intervalsToMatrix(intervals, strict = TRUE, binary = FALSE)
  expect_true('matrix' %in% class(M))
  expect_equal(class(M[1, 1]), 'logical')
  expect_equal(sum(diag(M)), 0)
})

test_that('intervalsToMatrix works with empty', {
  intervals <- empty()
  M <- intervalsToMatrix(intervals)

  p <- nrow(intervals)
  expect_equal(nrow(M), p)
  expect_equal(ncol(M), p)

  for (i in 1:nrow(M))
  {
    for (j in 1:ncol(M))
    {
      expect_equal(M[i, j], i == j)
    }
  }
})

test_that('intervalsToMatrix works with examples', {
  intervals <- antiRetroviralIntervals()[2:8, ]
  p <- nrow(intervals)

  M <- intervalsToMatrix(intervals)
  expect_equal(nrow(M), p)
  expect_equal(nrow(M), p)
  expect_true(all(apply(M, 1, sum) == c(1, 1, 1, 1, 1, 1, 4)))
  expect_true(all(apply(M, 2, sum) == c(2, 2, 1, 1, 1, 2, 1)))

  M <- intervalsToMatrix(intervals, strict = TRUE)
  expect_equal(nrow(M), p)
  expect_equal(nrow(M), p)
  expect_true(all(apply(M, 1, sum) == c(0, 0, 0, 0, 0, 0, 3)))
  expect_true(all(apply(M, 2, sum) == c(1, 1, 0, 0, 0, 1, 0)))

  M <- intervalsToMatrix(intervals, binary = TRUE)
  expect_equal(nrow(M), p)
  expect_equal(nrow(M), p)
  expect_true(all(apply(M, 1, sum) == c(1, 1, 1, 1, 1, 1, 4)))
  expect_true(all(apply(M, 2, sum) == c(2, 2, 1, 1, 1, 2, 1)))
})

test_that('intervalsToMatrix works with improper', {
  intervals <- improper()
  M <- intervalsToMatrix(intervals)

  p <- nrow(intervals)
  expect_equal(nrow(M), p)
  expect_equal(ncol(M), p)
  expect_true(all(apply(M, 1, sum) == c(1, 3, 2, 1)))
  expect_true(all(apply(M, 2, sum) == c(1, 1, 2, 3)))
})

test_that('intervalsToMatrix works with integers', {
  intervals <- integers()
  M <- intervalsToMatrix(intervals, strict = FALSE)

  p <- nrow(intervals)
  expect_equal(nrow(M), p)
  expect_equal(ncol(M), p)
  expect_true(all(apply(M, 1, sum) == c(3, 2, 2, 1)))
  expect_true(all(apply(M, 2, sum) == c(1, 1, 2, 4)))
})

test_that('intervalsToMatrix works with linear', {
  intervals <- linear()
  M <- intervalsToMatrix(intervals, strict = FALSE)

  p <- nrow(intervals)
  expect_equal(nrow(M), p)
  expect_equal(ncol(M), p)
  for (i in 1:p)
  {
    for (j in 1:p)
    {
      expect_equal(M[i, j], i <= j)
    }
  }
})

test_that('intervalsToMatrix works with simple', {
  intervals <- simple()
  M <- intervalsToMatrix(intervals, binary = TRUE)

  p <- nrow(intervals)
  expect_equal(nrow(M), p)
  expect_equal(ncol(M), p)
  expect_true(all(apply(M, 1, sum) == c(2, 1, 1)))
  expect_true(all(apply(M, 2, sum) == c(1, 1, 2)))
})

test_that('intervalsToMatrix works with weak1', {
  intervals <- weak1()

  M <- intervalsToMatrix(intervals, strict = FALSE, binary = TRUE)
  expect_true('matrix' %in% class(M))
  expect_equal(class(M[1, 1]), 'numeric')
  expect_equal(sum(diag(M)), 3)

  M <- intervalsToMatrix(intervals, strict = FALSE, binary = FALSE)
  expect_true('matrix' %in% class(M))
  expect_equal(class(M[1, 1]), 'logical')
  expect_equal(sum(diag(M)), 3)
})

test_that('intervalsToMatrix works with weak2', {
  intervals <- weak2()
  M <- intervalsToMatrix(intervals, strict = TRUE)

  p <- nrow(intervals)
  expect_equal(nrow(M), p)
  expect_equal(ncol(M), p)
  expect_true(all(apply(M, 1, sum) == c(4, 4, 2, 2, 0, 0)))
  expect_true(all(apply(M, 2, sum) == c(0, 0, 2, 2, 4, 4)))
})
