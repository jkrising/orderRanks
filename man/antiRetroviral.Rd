% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data.R
\docType{data}
\name{antiRetroviral}
\alias{antiRetroviral}
\title{Anti-Retroviral Access Data}
\format{
A data frame with 25 rows and 5 columns:
\describe{
\item{Country.Name}{Country name}
\item{Country.Code}{Standard country identifier}
\item{YR2021.pe}{Point estimate}
\item{YR2021.lb}{Lower limit of plausible values}
\item{YR2021.ub}{Upper limit of plausible values}
}
}
\source{
\url{https://databank.worldbank.org/source/gender-statistics}
}
\usage{
antiRetroviral
}
\description{
A data set from the World Bank repository of Gender Statistics describing
what percentage of the female population in
\href{https://www.worldbank.org/en/region/afr/eastern-and-southern-africa}{Southern and Eastern Africa}
had access to anti-retroviral drugs in 2021 (series code SH.HIV.ARTC.FE.ZS).
For each country the data set provides a point estimate as well as a range
of plausible values.  Countries with missing data are excluded.  This data
was analyzed in \insertCite{rising2023orderRanks;textual}{orderRanks} to
illustrate the methods made available in this package.  The data is made
available under the terms described at
\url{https://www.worldbank.org/en/about/legal/terms-of-use-for-datasets}.
}
\references{
\insertAllCited{}
}
\keyword{datasets}
