% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scaler.R
\name{scaler}
\alias{scaler}
\title{Scale multiple columns at once}
\usage{
scaler(data, ..., center = TRUE, scale = TRUE)
}
\arguments{
\item{data}{Dataframe, tibble, etc.}

\item{...}{Variables to include/exclude.
You can use same specifications as in dplyr's \link[dplyr]{select}.
If missing, defaults to all non-grouping variables.}

\item{center}{Logical.}

\item{scale}{Logical.}
}
\value{
Tibble where selected columns have been scaled.
}
\description{
Center and/or scale multiple columns of a dataframe.
 Can be used in \link[magrittr]{\%>\%} pipelines.
}
\examples{
# Attach package
library(LRO.utilities)

# Create dataframe
df <- data.frame('a' = c(1,2,3,4,5,6,7),
                 'b' = c(2,3,4,5,6,7,8))

# Scale and center both columns
scaler(df)

# Scale and center 'b'
scaler(df, b)

# Scale but not center 'a'
scaler(df, a, center = FALSE)

}