#'
#' Calculate technical error of measurement (TEM) for two or more observers
#'
#' Function to calculate technical error of measurement (TEM) when there are
#' more than two observers involved.
#'
#' @param n A numeric value specifying number of subjects
#' @param k A numeric value specifying number of observers
#' @param m A data frame of of measurements with number of columns equal to
#'   `k` and number of rows equal to `n`
#'
#' @return A numeric value of the technical error of measurement (TEM). Unit
#'     of TEM is the same as the unit of the measurements compared.
#'
#' @examples
#' # calculate team TEM from stature dataset
#' calculate_team_tem(n = 10, k = 4, m = stature[ , c("m1", "m2", "m3", "m4")])
#'
#' @export
#'

calculate_team_tem <- function(n, k, m) {

  if (!methods::is(m, "data.frame")) {
    stop(
      paste(
        strwrap("Measurements should be supplied as a data frame.
                Please check and try again.",
                width = 80),
        "\n",
        collapse = "\n"
      )
    )
  }

  if(ncol(m) != k | nrow(m) != n) {
    stop(
      paste(
        strwrap("Measurements data frame should have rows equal to number of
                subjects and columns equal to number of observers.
                Please check and try again.",
                width = 80),
        "\n",
        collapse = "\n"
      )
    )
  }

  ## Function to square a value
  fun_squared <- function(x) { x ^ 2 }

  ## Square of all measurements and sum per subject measurement squares
  firstPart <- rowSums(sapply(m, FUN = fun_squared))

  ## Sum per subject measurements and then squared divided by number of
  ## observers
  secondPart <- (rowSums(m) ^ 2) / k

  ## Calculate TEM
  tem <- sqrt(sum(firstPart - secondPart) / (n * (k - 1)))

  ## Return output
  tem
}
