test_that('isCompatible is correct for counter', {
  intervals <- counter()
  expect_false(isCompatible(c(3, 4, 1, 2, 5), intervals))
})

test_that('isCompatible is correct for empty', {
  intervals <- empty()

  for (i in 1:10)
  {
    r1 <- sample(10, replace = TRUE) |> rank(ties.method = 'min')
    expect_true(isCompatible(r1, intervals))

    r2 <- sample(10) |> rank(ties.method = 'min')
    expect_true(isCompatible(r2, intervals))
  }
})

test_that('isCompatible is correct for examples', {
  intervals <- antiRetroviralIntervals()[2:8, ]
  expect_false(isCompatible(1:7, intervals))
  expect_true(isCompatible(7:1, intervals))
})

test_that('isCompatible is correct for improper', {
  intervals <- improper()

  expect_true(isCompatible(c(1, 2, 3, 4), intervals))
  expect_true(isCompatible(c(2, 1, 3, 4), intervals))
  expect_true(isCompatible(c(3, 1, 2, 4), intervals))
  expect_true(isCompatible(c(4, 1, 2, 3), intervals))

  expect_false(isCompatible(c(1, 4, 3, 2), intervals))
  expect_false(isCompatible(c(2, 4, 3, 1), intervals))
  expect_false(isCompatible(c(3, 4, 2, 1), intervals))
  expect_false(isCompatible(c(4, 3, 2, 1), intervals))

  expect_true(isCompatible(c(2, 1, 2, 4), intervals))
  expect_true(isCompatible(c(1, 1, 3, 4), intervals))
  expect_true(isCompatible(c(3, 1, 2, 3), intervals))

  expect_false(isCompatible.naive(c(1, 1, 1, 1), intervals))
  expect_false(isCompatible.naive(c(3, 1, 1, 4), intervals))
})

test_that('isCompatible is correct for integers', {
  intervals <- integers()

  perms <- arrangements::permutations(nrow(intervals))
  for (i in 1:nrow(perms))
  {
    expect_equal(isCompatible(perms[i, ], intervals),
                 isCompatible.naive(perms[i, ], intervals))
  }
})

test_that('isCompatible is correct for linear', {
  intervals <- linear()

  expect_true(isCompatible(1:5, intervals))
  expect_false(isCompatible(5:1, intervals))
})

test_that('isCompatible is correct for simple intervals', {
  intervals <- simple()

  perms <- arrangements::permutations(nrow(intervals))
  for (i in 1:nrow(perms))
  {
    expect_equal(isCompatible(perms[i, ], intervals),
                 isCompatible.naive(perms[i, ], intervals))
  }
})

test_that('isCompatible is correct for weak1', {
  intervals <- weak1()

  rankings <- data.frame(c1 = c(1, 1, 2, 2, 3, 3),
                         c2 = c(2, 3, 1, 3, 1, 2),
                         c3 = c(3, 2, 3, 1, 2, 1))
  for (i in 1:nrow(rankings))
  {
    r <- rankings[i, ] |> as.integer()
    expect_equal(isCompatible(r, intervals),
                 isCompatible.naive(r, intervals))
  }
})

test_that('isCompatible is correct for weak2', {
  intervals <- weak2()

  expect_true(isCompatible(c(1, 2, 3, 4, 5, 6), intervals))
  expect_true(isCompatible(c(1, 2, 3, 4, 6, 5), intervals))
  expect_true(isCompatible(c(2, 1, 3, 4, 5, 6), intervals))
  expect_true(isCompatible(c(1, 2, 4, 3, 5, 6), intervals))

  expect_false(isCompatible(c(1, 3, 2, 4, 5, 6), intervals))
  expect_false(isCompatible(c(1, 2, 3, 5, 4, 6), intervals))
  expect_false(isCompatible(c(6, 2, 3, 4, 5, 1), intervals))
  expect_false(isCompatible(c(6, 5, 4, 3, 2, 1), intervals))
})
