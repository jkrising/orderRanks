test_that('rankingToMatrix arguments are interpreted correctly', {
  ranking <- 1:3

  M <- rankingToMatrix(ranking, strict = TRUE, binary = TRUE)
  expect_equal(class(M[1, 1]), 'numeric')
  expect_equal(sum(diag(M)), 0)

  M <- rankingToMatrix(ranking, strict = TRUE, binary = FALSE)
  expect_equal(class(M[1, 1]), 'logical')
  expect_equal(sum(diag(M)), 0)

  M <- rankingToMatrix(ranking, strict = FALSE, binary = TRUE)
  expect_equal(class(M[1, 1]), 'numeric')
  expect_equal(sum(diag(M)), 3)

  M <- rankingToMatrix(ranking, strict = FALSE, binary = FALSE)
  expect_equal(class(M[1, 1]), 'logical')
  expect_equal(sum(diag(M)), 3)
})

test_that('rankingToMatrix works with example 1', {
  r <- rank(antiRetroviralIntervals()[2:8, 'left'],
            ties.method = 'min')
  M <- rankingToMatrix(r)
  expect_true('matrix' %in% class(M))

  expect_equal(nrow(M), 7)
  expect_equal(ncol(M), 7)
  expect_true(all(apply(M, 1, sum) == c(2, 1, 7, 5, 6, 3, 4)))
  expect_true(all(apply(M, 2, sum) == c(6, 7, 1, 3, 2, 5, 4)))
})

test_that('rankingToMatrix works with example 2', {
  r <- rank(antiRetroviralIntervals()[2:8, 'right'],
            ties.method = 'min')
  M <- rankingToMatrix(r)
  expect_true('matrix' %in% class(M))

  expect_equal(nrow(M), 7)
  expect_equal(ncol(M), 7)
  expect_true(all(apply(M, 1, sum) == c(1, 1, 1, 1, 1, 1, 7)))
  expect_true(all(apply(M, 2, sum) == c(2, 2, 2, 2, 2, 2, 1)))
})
