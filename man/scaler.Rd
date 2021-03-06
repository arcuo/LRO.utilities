% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scaler.R
\name{scaler}
\alias{scaler}
\alias{scaler_,}
\alias{scaler_fit,}
\alias{scaler_fit_,}
\alias{scaler_transform,}
\alias{scaler_invert}
\alias{scaler_}
\alias{scaler_fit}
\alias{scaler_fit_}
\alias{scaler_transform}
\alias{scaler_invert}
\title{Scale multiple columns at once}
\usage{
scaler(data, ..., center = TRUE, scale = TRUE)

scaler_(data, cols = NULL, center = TRUE, scale = TRUE)

scaler_fit(data, ..., center = TRUE, scale = TRUE)

scaler_fit_(data, cols = NULL, center = TRUE, scale = TRUE)

scaler_transform(data, fit_object)

scaler_invert(data, fit_object)
}
\arguments{
\item{data}{Dataframe, tbl, vector}

\item{..., cols}{Variables to include/exclude.

 ... :
 You can use same specifications as in dplyr's \link[dplyr]{select}.

 cols :
 character vector

 If missing, defaults to all non-grouping variables.}

\item{center}{Logical or logical vector with element for each included column.}

\item{scale}{Logical or logical vector with element for each included column.}

\item{fit_object}{Object from scaler_fit used to transform data}
}
\value{
Tibble where selected columns have been scaled.
}
\description{
Center and/or scale multiple columns of a dataframe.

 \strong{scaler} is designed to work with \link[magrittr]{\%>\%} pipelines.

 \strong{scaler_fit} returns fit_object with information used to
 transform data.

 \strong{scaler_transform} scales data based on the information
 in the fit_object.

 \strong{scaler_invert} inverts scaling based on the information
 in the fit_object.

 \strong{scaler_} and \strong{scaler_fit_} are standard evalution versions.
}
\details{
Scales each specified column and converts to tibble.
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

# Scaling multiple columns
scaler(df, a, b)
scaler(df, 1:2)
scaler(df, c(a,b))

# Scaling all but 'a'
scaler(df, -a)

## Fit / Transform / Invert

# Fit scaler
fitted_scaler <- scaler_fit(df, 1:2)

# Transform data
scaled_df <- scaler_transform(df, fitted_scaler)

# Invert scaling
scaler_invert(scaled_df, fitted_scaler)

## Setting scale and center for each column

scaler(df, center = c(TRUE, FALSE),
       scale = c(FALSE, TRUE))

## Standard evalutation versions

scaler_(df, cols = c('b'))
scaler_fit_(df, cols = c('a'))

}
