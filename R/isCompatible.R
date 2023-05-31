#' Test whether a ranking is compatible with a set of intervals
#'
#' This method determines whether there is some set of points contained in a set
#' of intervals whose ranking is equal to a given ranking.
#'
#' See section 8 of \insertCite{rising2023orderRanks;textual}{orderRanks}.
#'
#' @param ranking ranking vector (see [orderRanks::orderRanks] for format)
#' @param intervals data frame (see [orderRanks::orderRanks] for
#' the required format)
#'
#' @return boolean
#' @export
#'
#' @references
#' \insertAllCited{}
#'
#' @examples
#' intervals <- antiRetroviralIntervals()[2:8, ]
#' isCompatible(1:7, intervals)
#' isCompatible(7:1, intervals)
isCompatible <- function(ranking, intervals)
{
  errorCheckBoth(ranking, intervals)

  getCompatibility(ranking, intervals[, 'left'], intervals[, 'right'])
}
