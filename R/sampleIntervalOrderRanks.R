#' Compute the sample interval order ranks
#'
#' Computes the sample interval order ranks for a set of unknown parameters
#' from a collection of interval estimates for those parameters.
#'
#' See section 6 of \insertCite{rising2023orderRanks;textual}{orderRanks}.
#'
#' @param intervals data frame (see [orderRanks::orderRanks] for
#' the required format)
#' @param rankIntervals true if the intervals are rank intervals and false
#' otherwise
#'
#' @return ranking vector (see [orderRanks::orderRanks] for format)
#' @export
#'
#' @references
#' \insertAllCited{}
#'
#' @examples
#' intervals <- antiRetroviralIntervals()
#' sampleIntervalOrderRanks(intervals)
sampleIntervalOrderRanks <- function(intervals, rankIntervals = FALSE)
{
  errorCheckIntervals(intervals, !rankIntervals)
  if (!rankIntervals)
  {
    intervals <- rankIntervals(intervals)
  }
  intervals[, 'left'] |> rank(ties.method = 'min')
}
