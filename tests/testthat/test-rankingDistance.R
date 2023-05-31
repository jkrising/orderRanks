test_that('rankingDistance is correct for examples', {
  expect_equal(rankingDistance(1:7, 1:7), 0)
  expect_equal(rankingDistance(1:7, 7:1, TRUE), 1)
  expect_equal(rankingDistance(1:7, 7:1), 42)
  expect_equal(rankingDistance(1:7, c(7, 1:6)), 12)
  expect_equal(rankingDistance(1:7, c(2, 1, 3:7)), 2)
})
