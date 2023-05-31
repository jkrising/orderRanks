test_that('dual is correct for counter', {
  intervals <- counter()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for empty', {
  intervals <- empty()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for improper', {
  intervals <- improper()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for integers', {
  intervals <- integers()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for linear', {
  intervals <- linear()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for simple', {
  intervals <- simple()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for weak1', {
  intervals <- weak1()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})

test_that('dual is correct for weak2', {
  intervals <- weak2()

  intervals.dual <- dual(intervals)
  expect_true(all(intervals[, 'left'] + intervals.dual[, 'right'] == 0))
  expect_true(all(intervals[, 'right'] + intervals.dual[, 'left'] == 0))
})
