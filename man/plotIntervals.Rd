% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plotIntervals.R
\name{plotIntervals}
\alias{plotIntervals}
\title{Plot intervals}
\usage{
plotIntervals(intervals, pts = NULL, labels = NULL, blank.x = TRUE, asc = TRUE)
}
\arguments{
\item{intervals}{data frame (see \link{orderRanks} for
the required format)}

\item{pts}{vector of numeric values to plot along with the intervals}

\item{labels}{vector of strings to use as y-axis labels}

\item{blank.x}{boolean if TRUE, omit x-axis data}

\item{asc}{boolean if TRUE, plot intervals in ascending order}
}
\value{
ggplot object
}
\description{
Generates a plot of a set of intervals.  This is intended for simple
visualizations and does not offer any significant degree of customization.
}
\examples{
intervals <- antiRetroviralIntervals()
plotIntervals(intervals)
plotIntervals(intervals, blank.x = FALSE)
plotIntervals(intervals, blank.x = FALSE, asc = FALSE)
plotIntervals(intervals, labels = 1:nrow(intervals), blank.x = FALSE, asc = FALSE)

m <- (intervals[, 'left'] + intervals[, 'right']) / 2
plotIntervals(intervals, pts = m, labels = 1:nrow(intervals), blank.x = FALSE, asc = FALSE)
}
