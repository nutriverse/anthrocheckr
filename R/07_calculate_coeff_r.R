################################################################################
#
#'
#' Calculate the coefficient of reliability (R).
#'
#' @param total_tem A numeric value for total TEM
#' @param sd A numeric vector for standard deviation of measurements
#'
#' @return A numeric vector of coefficient of reliability values per observer
#'
#' @examples
#' #
#'
#'
#' @export
#'
#
################################################################################

calculate_coeff_r <- function(total_tem, sd) {

  coeff_r <- (total_tem ^ 2) / sd

  return(coeff_r)
}
