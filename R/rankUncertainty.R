#' Compute the conditional uncertainty in a set of rankings
#'
#' Computes a measure of the uncertainty in the estimated ranks of a set of
#' parameters based on the uncertainty in the parameter estimates as represented
#' by a set of interval estimates.
#'
#' See section 7 of \insertCite{rising2023orderRanks;textual}{orderRanks}.
#'
#' @param intervals data frame (see [orderRanks::orderRanks] for
#' the required format)
#' @param symmetrize if true, compute the symmetrized uncertainty
#' @param normalize if true, compute the normalized uncertainty
#' @param rankIntervals true if the intervals are rank intervals and false
#' otherwise
#'
#' @return Numeric value measuring the conditional uncertainty in the ranks
#' @export
#'
#' @references
#' \insertAllCited{}
#'
#' @examples
#' intervals <- antiRetroviralIntervals()
#' rankUncertainty(intervals)
rankUncertainty <- function(intervals, symmetrize = TRUE, normalize = TRUE,
                            rankIntervals = FALSE)
{
  calculateExcess <- function(cards)
  {
    p <- length(cards)
    excess <- rep(0, p)

    tab <- table(cards)
    excess[as.integer(names(tab))] <- tab

    cumsum(excess) - 1:p
  }

  errorCheckIntervals(intervals, !rankIntervals)

  p <- nrow(intervals)
  if (p == 1)
  {
    return(0)
  }

  if (!rankIntervals)
  {
    intervals <- rankIntervals(intervals)
  }

  excess <- calculateExcess(intervals[, 'left'])
  if (symmetrize)
  {
    excess <- c(excess, calculateExcess(p + 1 - intervals[, 'right']))
  }

  u <- mean(excess)
  if (normalize)
  {
    u <- u * 2 / (p - 1)
  }
  u
}
