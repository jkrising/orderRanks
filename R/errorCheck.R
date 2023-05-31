errorCheckIntervals <- function(intervals, endpoints = FALSE)
{

  if ('left' %notin% names(intervals))
  {
    stop('names(intervals) does not contain \'left\'')
  }
  if ('right' %notin% names(intervals))
  {
    stop('names(intervals) does not contain \'right\'')
  }
  if (!checkNumericClass(intervals[, 'left']))
  {
    stop('intervals[, \'left\'] is not integer or numeric')
  }
  if (!checkNumericClass(intervals[, 'right']))
  {
    stop('intervals[, \'right\'] is not integer or numeric')
  }
  if (endpoints)
  {
    if (any(intervals[, 'right'] <= intervals[, 'left']))
    {
      stop('intervals[, \'left\'] must be less than intervals[, \'right\']')
    }
  }
}

errorCheckRanking <- function(r)
{
  if (!all(rank(r, ties.method = 'min') == r))
  {
    stop('invalid ranking')
  }
}

errorCheckRankings <- function(r1, r2)
{
  errorCheckRanking(r1)
  errorCheckRanking(r2)

  if (length(r1) != length(r2))
  {
    stop('r1 and r2 must be the same length')
  }
}

errorCheckBoth <- function(r, intervals)
{
  errorCheckRanking(r)
  errorCheckIntervals(intervals)

  if (length(r) != nrow(intervals))
  {
    stop('ranking/interval length mismatch')
  }
}

`%notin%` <- Negate(`%in%`)

checkNumericClass <- function(x)
{
  class(x) %in% c('integer', 'numeric')
}

