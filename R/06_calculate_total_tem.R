################################################################################
#
#' calculate_total_tem
#'
#' Calculate the Total TEM given individual intra-observer TEM.
#'
#' @param intra A numeric vector or data frame of individual intra-observer TEM.
#' @param inter A numeric value of inter-observer TEM.
#'
#' @return A numeric value of total TEM
#'
#' @examples
#' # Calculate total
#' intra <- calculate_tem_cohort(m1 = smartStd$muac1, m2 = smartStd$muac2,
#'   index = smartStd$observer, n = 11)
#' inter <- calculate_team_tem(n = 10, k = 11, m = stature[ , c("m1", "m2", "m3", "m4")])
#'
#'
#'
#' @export
#'
#
################################################################################

calculate_total_tem <- function(intra, inter) {
  #
  # Get total TEM
  #
  total_tem <- sqrt((sum(intra ^ 2) / length(intra)) + (inter ^ 2)  )
  #
  # Return output
  #
  return(total_tem)
}
