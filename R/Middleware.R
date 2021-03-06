#' @export
#' @title Middleware class
#'
#' @description
#' A \code{Middleware} object represents middleware functions that have access
#' to the request (\code{req}), response (\code{res}) and error (\code{err})
#' objects in request-response cycle via the \code{Router}.
#'
#' @usage NULL
#'
#' @format NULL
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{path}}{
#'   Returns the path for the specified middleware.
#'   }
#'   \item{\code{FUN}}{
#'   Returns the function response.
#'   }
#'   \item{\code{method}}{
#'   Returns the HTTP method for the middleware, i.e. "GET", "POST", etc.
#'   }
#'   \item{\code{protocol}}{
#'   Returns the protocol, "http" or "websocket".
#'   }
#' }
#'
#' @section Methods:
#'
#' \describe{
#'   \item{\code{initialize(FUN, path, method, websocket)}}{
#'   Initializes the state of new middleware.
#'   }
#' }
#'
#' @seealso \code{\link{Router}} and \code{\link{Middleware}}
#'
Middleware <-
  R6::R6Class(
    classname = "Middleware",
    public = list(
      path = NULL,
      FUN = NULL,
      method = NULL,
      protocol = NULL,
      initialize = function(FUN, path, method, websocket) {
        self$FUN = FUN
        self$path = path
        self$method = method
        self$protocol = if ( websocket )  {
            return("websocket")
          } else {
            return("http")
          }
      }
    )
  )
