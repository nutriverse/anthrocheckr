################################################################################
#
#'
#' Calculate intra-observer TEM for each observer
#'
#' Function to calculate intra-observer TEM for each observer using input
#' dataset containing multiple types of multiple measurements from multiple
#' observers.
#'
#' @param m1 A numeric vector of first round measurements made by multiple
#'     observers
#' @param m2 A numeric vector of second round measurements made by multiple
#'     observers
#' @param index A list of grouping factors
#' @param n Number of subjects
#'
#' @return A vector or data frame of calculated TEM per observer and per
#'     measurement type.
#'
#' @examples
#' # Get the TEM per observer for MUAC measurements in the smartStd dataset
#' calculate_tem_cohort(m1 = smartStd$muac1, m2 = smartStd$muac2,
#'                      index = smartStd$observer, n = 10)
#'
#' # Get the TEM per observer for all measurement types (height, weight, MUAC)
#' # in the smartStdLong dataset
#' x <- smartStdLong[smartStdLong$measure_round == 1, ]
#' y <- smartStdLong[smartStdLong$measure_round == 2, ]
#'
#' calculate_tem_cohort(m1 = x$measure_value, m2 = x$measure_value,
#'   index = x[ , c("observer", "measure_type")],
#'   n = 10)
#'
#' @export
#'
#
################################################################################

calculate_tem_cohort <- function(m1, m2, index, n) {
  ## Check that m1 is a numeric vector
  if(class(m1) == "character" | class(m1) == "factor") {
    stop("m1 must be numeric. Try again.")
  }

  ## Check that m2 is a numeric vector
  if(class(m2) == "character" | class(m2) == "factor") {
    stop("m2 must be numeric. Try again.")
  }

  ## get TEM
  tem <- tapply(X = m1 - m2, INDEX = index, FUN = calculate_tem, n = n)

  #return output
  return(tem)
}
