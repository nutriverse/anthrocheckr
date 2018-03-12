################################################################################
#
#' calculate_tem
#'
#' Function to calculate technical error of measurement (TEM) based on formula
#' created by Ulijaszek and Kerr (1999) as an indicator of measurement
#' precision as described by Mueller and Mortorell (1998). This function is
#' specific for intra-observer TEM for two measurements, and for inter-observer
#' TEM involving two measurers.
#'
#' @param m1 Numeric vector for first measurement made (if comparing repeated
#'     measures) or numeric value for measurement made by first measurer (if
#'     comparing two measurers).
#' @param m2 Numeric vector for second measurement made (if comparing repeated
#'     measures) or numeric value for measurement made by second measurer (if
#'     comparing two measurers).
#' @param d Numeric vector of difference between two measurements made by same
#'     measurer or between two measurers. Not required if \code{m1} and
#'     \code{m2} are specified.
#'
#' @param n Numeric value of number of individuals measured.
#'
#' @return A numeric value of the technical error of measurement (TEM). Unit
#'     of TEM is the same as the unit of the measurements compared.
#'
#' @examples
#' #
#'
#
################################################################################

calculate_tem <- function(m1, m2, d = NULL, n) {
  #
  # If d is specified
  #
  if(!is.null(d)) {
    tem <- sqrt(sum(d) ^ 2 / 2 * n)
  }
  #
  # Get difference of measures
  #
  D <- m1 - m2
  #
  # Calculate TEM
  #
  tem <- sqrt(sum(D) ^ 2 / 2 * n)
  #
  # Return output
  #
  return(tem)
}
