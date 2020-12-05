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
#' # Calculate intra-observer TEM
#' intra <- calculate_tem_cohort(df = smartStd,
#'                               m1 = "muac1",
#'                               m2 = "muac2",
#'                               index = "observer",
#'                               n = 11)
#'
#' # Get inter-observer TEM
#' muacDF1 <- subset(smartStd,
#'                   select = c(-muac2, -weight1, -weight2, -height1, -height2))
#' muacDF2 <- subset(smartStd,
#'                   select = c(-muac1, -weight1, -weight2, -height1, -height2))
#'
#' # Spread the dataset to wide format
#' library(tidyr)
#' muacDF1 <- tidyr::spread(muacDF1, key = "observer", value = "muac1")
#' muacDF2 <- tidyr::spread(muacDF2, key = "observer", value = "muac2")
#' muacDF <- merge(muacDF1, muacDF2, by = "subject")
#' inter <- calculate_team_tem(n = 10, k = 22, m = muacDF[ , 2:23])
#'
#' total_tem <- calculate_total_tem(intra = intra, inter = inter)
#'
#' # Calculate sd
#' stdev <- summary_measure(df = smartStdLong[smartStdLong$measure_type == "muac", ],
#'                          measures = "measure_value",
#'                          index = "observer")
#'
#' calculate_coeff_r(total_tem = total_tem, sd = stdev)
#'
#' @export
#'
#
################################################################################

calculate_coeff_r <- function(total_tem, sd) {

  coeff_r <- (total_tem ^ 2) / sd

  return(coeff_r)
}
