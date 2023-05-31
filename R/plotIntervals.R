#' Plot intervals
#'
#' Generates a plot of a set of intervals.  This is intended for simple
#' visualizations and does not offer any significant degree of customization.
#'
#' @param intervals data frame (see [orderRanks::orderRanks] for
#' the required format)
#' @param pts vector of numeric values to plot along with the intervals
#' @param labels vector of strings to use as y-axis labels
#' @param blank.x boolean if TRUE, omit x-axis data
#' @param asc boolean if TRUE, plot intervals in ascending order
#'
#' @return ggplot object
#' @export
#'
#' @examples
#' intervals <- antiRetroviralIntervals()
#' plotIntervals(intervals)
#' plotIntervals(intervals, blank.x = FALSE)
#' plotIntervals(intervals, blank.x = FALSE, asc = FALSE)
#' plotIntervals(intervals, labels = 1:nrow(intervals), blank.x = FALSE, asc = FALSE)
#'
#' m <- (intervals[, 'left'] + intervals[, 'right']) / 2
#' plotIntervals(intervals, pts = m, labels = 1:nrow(intervals), blank.x = FALSE, asc = FALSE)
plotIntervals <- function(intervals, pts = NULL, labels = NULL, blank.x = TRUE,
                          asc = TRUE)
{
  errorCheckIntervals(intervals)

  intervals[, 'idx'] <- 1:nrow(intervals)
  if (!asc)
  {
    intervals[, 'idx'] <- rev(intervals[, 'idx'])
  }

  # devtools::check() doesn't understand that the arguments to aes are
  # evaluated as names of the data frame, so we need to declare them here
  # in order to pass.
  idx <- NULL
  left <- NULL
  pt <- NULL
  right <- NULL

  p <- ggplot2::ggplot()
  p <- p + ggplot2::theme(panel.border = ggplot2::element_blank())
  p <- p + ggplot2::theme(panel.grid.major = ggplot2::element_blank(),
                          panel.grid.minor = ggplot2::element_blank())
  p <- p + ggplot2::geom_segment(data = intervals, ggplot2::aes(x = left,
                                 y = idx, xend = right, yend = idx))
  if (!is.null(pts))
  {
    intervals[, 'pt'] <- pts
    p <- p + ggplot2::geom_point(data = intervals, ggplot2::aes(x = pt,
                                 y = idx))
  }

  p <- p + ggplot2::theme(axis.title.x = ggplot2::element_blank(),
                          axis.title.y = ggplot2::element_blank())
  if (blank.x)
  {
    p <- p + ggplot2::theme(axis.text.x = ggplot2::element_blank(),
                            axis.ticks.x = ggplot2::element_blank(),
                            axis.title.x = ggplot2::element_blank())
  }
  if (is.null(labels))
  {
    p <- p + ggplot2::theme(axis.text.y = ggplot2::element_blank(),
                            axis.ticks.y = ggplot2::element_blank())
  }
  else
  {
    p <- p + ggplot2::scale_y_continuous(labels = labels,
                                         breaks = intervals[, 'idx'])
  }
  p
}
