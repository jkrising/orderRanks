#' Intervals from anti-retroviral access data
#'
#' Generates a data frame with the interval estimates from
#' [orderRanks::antiRetroviral] in the format described in
#' [orderRanks::orderRanks].
#'
#' @return Data frame
#' @export
#'
#' @examples
#' intervals <- antiRetroviralIntervals()
antiRetroviralIntervals <- function()
{
  idx <- stats::complete.cases(orderRanks::antiRetroviral)
  data.frame(left = orderRanks::antiRetroviral[idx, 'YR2021.lb'],
             right = orderRanks::antiRetroviral[idx, 'YR2021.ub'])
}
