test_that('intervals[, \'left\'] must be numeric', {
  left <- c('a', 'b', 'c', 'd')
  right <- 1:4
  intervals <- data.frame(left = left, right = right)
  expect_error(errorCheckIntervals(intervals))
})

test_that('intervals[, \'right\'] must be numeric', {
  left <- 1:4
  right <- c('b', 'c', 'd', 'e')
  intervals <- data.frame(left = left, right = right)
  expect_error(errorCheckIntervals(intervals))
})

test_that('left must be in interval names', {
  left <- 1:4
  right <- left + 0.5
  intervals <- data.frame(x = left, y = right)
  expect_error(errorCheckIntervals(intervals))
})

test_that('right must be in interval names', {
  left <- 1:4
  right <- left + 0.5
  intervals <- data.frame(left = left, y = right)
  expect_error(errorCheckIntervals(intervals))
})

test_that('left must be less than right', {
  right <- 1:4
  left <- right + 0.5
  intervals <- data.frame(left = left, right = right)
  expect_no_error(errorCheckIntervals(intervals))
  expect_error(errorCheckIntervals(intervals, TRUE))

  intervals <- data.frame(left = left, right = left)
  expect_no_error(errorCheckIntervals(intervals))
  expect_error(errorCheckIntervals(intervals, TRUE))
})

test_that('rankings are validated', {
  r <- rank(c(1:5, 1), ties.method = 'max')
  expect_error(errorCheckRanking(r))
})

