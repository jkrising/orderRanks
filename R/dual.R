#' Generate the dual of an interval order
#'
#' Given a representation of an interval order, this function generates a
#' representation of the dual order.
#'
#' See section 2 of \insertCite{rising2023orderRanks;textual}{orderRanks}.
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
#' dual(intervals)
dual <- function(intervals)
{
  errorCheckIntervals(intervals)
  data.frame(left = -intervals[, 'right'], right = -intervals[, 'left'])
}
