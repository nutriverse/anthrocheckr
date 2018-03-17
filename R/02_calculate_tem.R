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
#' @param d Numeric vector of difference between two measurements made by same
#'     measurer or between two measurers.
#' @param n Numeric value of number of individuals measured.
#'
#' @return A numeric value of the technical error of measurement (TEM). Unit
#'     of TEM is the same as the unit of the measurements compared.
#'
#' @examples
#' # Apply calculate_tem to smartStd dataset to get TEM for weight for supervisor
#' difference <- smartStd$weight1[smartStd$observer == 0] - smartStd$weight2[smartStd$observer == 0]
#' tem <- calculate_tem(d = difference, n = length(difference))
#' tem
#'
#' # Apply calculate_tem
#'
#' @export
#'
#
################################################################################

calculate_tem <- function(d, n) {
  #
  # TEM formula
  #
  tem <- sqrt(sum(d ^ 2) / (2 * n))
  #
  # Return output
  #
  return(tem)
}
