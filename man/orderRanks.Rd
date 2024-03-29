% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/orderRanks-package.R
\docType{package}
\name{orderRanks}
\alias{orderRanks}
\title{orderRanks: Order-Theoretic Methods for Ranking}
\description{
This package provides implementations of methods detailed in
\insertCite{rising2023orderRanks;textual}{orderRanks} and other functions
necessary to support them.  This page provides documentation on topics that
do not pertain to any single method.
}
\section{Data Types}{


There are two data types that are used in this package: ranking vectors and
collections of intervals.  A ranking vector corresponds to the ranks of some
numerical values and is produced by \link[base:rank]{base::rank} with \code{ties.method = 'min'}.

A collection of intervals is a data frame with two columns named \code{'left'} and
\code{'right'}.  Each row corresponds to a nonempty interval estimate of some
unknown parameter so we require that these be numerical values with \code{'left'}
strictly less than \code{'right'}.
}

\references{
\insertAllCited{}
}
