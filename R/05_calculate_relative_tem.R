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
#'   tem <- calculate_tem_cohort(df = smartStd,
#'                               m1 = "weight1",
#'                               m2 = "weight2",
#'                               index = "observer",
#'                               n = 10)
#'
#'   x <- smartStd[ , c("observer", "weight1")]
#'   y <- smartStd[ , c("observer", "weight2")]
#'   names(x) <- names(y) <- c("observer", "weight")
#'   temp <- data.frame(rbind(x, y))
#'
#'   mean_value <- summary_measure(df = temp, measures = "weight",
#'                                 index = "observer")$mean
#'
#'   rel_tem <- calculate_relative_tem(tem = tem, mean_value = mean_value)
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





