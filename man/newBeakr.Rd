% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/utils.R
\name{newBeakr}
\alias{newBeakr}
\title{Create a new Beakr instance}
\usage{
newBeakr(name = NULL)
}
\arguments{
\item{name}{Optional name assigned to the \code{Beakr} instance.}
}
\value{
A new and empty \code{Beakr} instance.
}
\description{
Create a \code{Beakr} instance by calling the top-level
\code{newBeakr()} function. If \code{name} is not supplied, a random name
will be assigned.

This \code{Beakr} instance will then begin a pipeline of separate middleware
steps for routing, serving files and handling errors. The pipeline will
end with the \code{listen()} function.
}
\examples{
\donttest{
# Create an new Beakr instance
beakr <- newBeakr()

# Create a pipeline of hanldlers
beakr \%>\%
  httpGET(path = "/route_A", function(res, req, err) {
    print("This is route 'A'.")
  }) \%>\%
  httpGET(path = "/route_B", function(res, req, err) {
    print("This is route 'B'.")
  }) \%>\%
  handleErrors() \%>\%
  listen(host = '127.0.0.1', port = 25118, daemon = TRUE)

# ------------------------------------------------------------
# POINT YOUR BROWSER AT:
# * http://127.0.0.1:25118/route_A
# * http://127.0.0.1:25118/route_B
# ------------------------------------------------------------

# Stop the beakr instance server
stopServer(beakr)
}
}
