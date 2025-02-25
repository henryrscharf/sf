% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/sfc.R
\name{st_coordinates}
\alias{st_coordinates}
\title{retrieve coordinates in matrix form}
\usage{
st_coordinates(x, ...)
}
\arguments{
\item{x}{object of class sf, sfc or sfg}

\item{...}{ignored}
}
\value{
matrix with coordinates (X, Y, possibly Z and/or M) in rows, possibly followed by integer indicators \code{L1},...,\code{L3} that point out to which structure the coordinate belongs; for \code{POINT} this is absent (each coordinate is a feature), for \code{LINESTRING} \code{L1} refers to the feature, for \code{MULTILINESTRING} \code{L1} refers to the part and \code{L2} to the simple feature, for \code{POLYGON} \code{L1} refers to the main ring or holes and \code{L2} to the simple feature, for \code{MULTIPOLYGON} \code{L1} refers to the main ring or holes, \code{L2} to the ring id in the \code{MULTIPOLYGON}, and \code{L3} to the simple feature.

For \code{POLYGONS}, \code{L1} can be used to identify exterior rings and inner holes. 
The exterior ring is when \code{L1} is equal to 1. Interior rings are identified 
when \code{L1} is greater than 1. \code{L2} can be used to differentiate between the 
feature. Whereas for \code{MULTIPOLYGON}, \code{L3} refers to the \code{MULTIPOLYGON}
feature and \code{L2} refers to the component \code{POLYGON}.
}
\description{
retrieve coordinates in matrix form
}
