################################################################################
#
#'
#' Calculate relative TEM of measurements by multiple observers.
#'
#' @param tem A numeric vector or data frame of technical error of measurements
#'   produced from applying [calculate_tem_cohort()].
#' @param mean_value A numeric vector or data frame of mean of measurements
#'   produced from applying [summary_measure()].
#'
#' @return A vector or data frame of calculated relative TEM per observer and
#'   per measurement type.
#'
#' @examples
#' ## Calculate relative TEM for weight using the smartStd dataset
#'   tem <- calculate_tem_cohort(m1 = smartStd$muac1,
#'                               m2 = smartStd$muac2,
#'                               index = smartStd$observer,
#'                               n = 10)
#'
#'   mean_value <- summary_measure(x = c(smartStd$weight1, smartStd$weight2),
#'                                 index = rep(smartStd$observer, 2))$mean
#'
#'   rel_tem <- calculate_relative_tem(tem = tem, mean_value = mean_value)
#'   rel_tem
#'
#' # Calculate relative TEM using smartStdLong dataset
#'   x <- smartStdLong[smartStdLong$measure_round == 1, ]
#'   y <- smartStdLong[smartStdLong$measure_round == 2, ]
#'
#'   tem <- calculate_tem_cohort(m1 = x$measure_value,
#'                               m2 = y$measure_value,
#'                               index = x[ , c("observer", "measure_type")],
#'                               n = 10)
#'
#'   mean_value <- summary_measure(x = smartStdLong$measure_value,
#'     index = smartStdLong[ , c("observer", "measure_type")])$mean
#'
#'   rel_tem <- calculate_relative_tem(tem = tem, mean_value = mean_value)
#'
#'   rel_tem
#'
#' @export
#'
#
################################################################################

calculate_relative_tem <- function(tem, mean_value) {
  ## Calculate relative TEM
  relative_tem <- tem / mean_value * 100

  ## Return output
  return(relative_tem)
}





