#'
#' Calculate relative TEM of measurements by multiple observers.
#'
#' @param tem A numeric vector or data frame of technical error of measurements
#'   produced from applying [calculate_tem_cohort()].
#' @param mean_value A numeric vector or data frame of mean of measurements
#'   produced from applying [calculate_mean()].
#'
#' @return A vector or data frame of calculated relative TEM per observer and
#'   per measurement type.
#'
#' @examples
#' ## Calculate relative TEM for weight using the smartStd dataset
#'   tem <- calculate_tem_cohort(df = smartStd,
#'                               m1 = "weight1",
#'                               m2 = "weight2",
#'                               index = "observer",
#'                               n = 10)
#'
#'   x <- smartStdLong[smartStdLong$measure_type == "weight", ]
#'
#'   mean_value <- calculate_mean(measures = x$measure_value,
#'                                index = x[ , "observer"])
#'
#'   rel_tem <- calculate_relative_tem(tem = tem, mean_value = mean_value)
#'   rel_tem
#'
#' @export
#'

calculate_relative_tem <- function(tem, mean_value) {
  ## Calculate relative TEM
  relative_tem <- tem / mean_value * 100

  ## Return output
  relative_tem
}
