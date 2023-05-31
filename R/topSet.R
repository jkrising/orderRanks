#' Compute the k-bottom set for a set of intervals
#'
#' Suppose that we select one point from each of a set of n intervals and rank
#' them.  The k-bottom set is the set of intervals whose points can have a rank
#' of k or lower.
#'
#' See section 7 of \insertCite{rising2023orderRanks;textual}{orderRanks}.
#'
#' @param intervals data frame (see [orderRanks::orderRanks] for
#' the required format)
#' @param k cutoff for inclusion
#' @param rankIntervals true if the intervals are rank intervals and false
#' otherwise
#'
#' @return Indices of intervals in the k-bottom set.
#' @export
#'
#' @references
#' \insertAllCited{}
#'
#' @examples
#' intervals <- antiRetroviralIntervals()
#' topSet(intervals, 2)
topSet <- function(intervals, k, rankIntervals = FALSE)
{
  errorCheckIntervals(intervals, !rankIntervals)

  if (!rankIntervals)
  {
    intervals <- rankIntervals(intervals)
  }

  p <- nrow(intervals)
  which(intervals[, 'left'] <= k)
}
