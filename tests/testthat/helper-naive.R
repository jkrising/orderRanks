isCompatible.naive <- function(ranking, intervals)
{
  Mi <- intervalsToMatrix(intervals)
  Mr <- rankingToMatrix(ranking)
  all(Mi <= Mr)
}

rankIntervals.naive <- function(intervals)
{
  M <- intervalsToMatrix(intervals)

  left <- apply(M, 2, sum)

  p <- nrow(intervals)
  right <- p + 1 - apply(M, 1, sum)

  data.frame(left = left, right = right)
}
