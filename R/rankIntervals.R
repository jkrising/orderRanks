#' Generate rank intervals for a set of intervals
#'
#' Given a set of interval estimates, this method generates a set of intervals
#' that describe which ranks the estimated parameters can have if they are
#' contained in the interval estimates.
#'
#' See section 4 of \insertCite{rising2023orderRanks;textual}{orderRanks}.
#'
#' @param intervals data frame (see [orderRanks::orderRanks] for
#' the required format)
#'
#' @return data frame
#' @export
#'
#' @references
#' \insertAllCited{}
#'
#' @examples
#' intervals <- antiRetroviralIntervals()
#' rankIntervals(intervals)
rankIntervals <- function(intervals)
{
  errorCheckIntervals(intervals)

  getRankIntervals(intervals[, 'left'], intervals[, 'right'])
}
