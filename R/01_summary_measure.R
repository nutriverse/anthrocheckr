################################################################################
#
#'
#' Get the mean, standard deviation and maximum value of the observations/
#' measurements made by a single observer across multiple subjects
#'
#' @param x A numeric vector of measurements made by multiple observers on
#'     multiple subjects.
#' @param index A list of factors to be used to group the summary results into.
#'     If multiple observers, then this list should include at least the
#'     observer identifiers. Any other grouping factor should then be added to
#'     the list.
#'
#' @return A numeric vector or data frame with calculated summary measures.
#'
#' @examples
#' # Apply summary_measure on smartStd dataset that has a row for each subject
#' # measurement and multiple columns of different measurement types
#' # (i.e, height, weight, muac) taken at different times (repeat measurements).
#' # The grouping variable is the observer column. This can be used to get the
#' # summary measure for one measurement type only but can be used to summarise
#' # repeat measurements
#' # Get mean of weight measure taken by each observer at 2 separate occasions
#'   x <- smartStd[ , c("observer", "weight1")]
#'   y <- smartStd[ , c("observer", "weight2")]
#'   names(x) <- names(y) <- c("observer", "weight")
#'   temp <- data.frame(rbind(x, y))
#'   mean_measure <- summary_measure(x = temp$weight, index = temp$observer)
#'   mean_measure
#'
#' # Apply summary_measure on smartStdLong dataset that has a row for each
#' # subject for each measure type and for each repeat measurement. Get mean,
#' # sd and max of height, weight and MUAC in one specification
#' summary_measure(x = smartStdLong$measure_value,
#'                 index = smartStdLong[ , c("observer", "measure_type")])
#'
#' @export
#'
#
################################################################################

summary_measure <- function(x, index) {
  ## Get mean of measurements
  sm_mean <- tapply(X = x, INDEX = index, FUN = mean, na.rm = TRUE)

  ## Get SD of measurements
  sm_sd <- tapply(X = x, INDEX = index, FUN = sd, na.rm = TRUE)

  ## Get max value of measurements
  sm_max <- tapply(X = x, INDEX = index, FUN = max, na.rm = TRUE)

  ## If index is a list...
  if (is.list(index)) {
    sm <- list(data.frame(sm_mean), data.frame(sm_sd), data.frame(sm_max))
    names(sm) <- c("mean", "sd", "max")
  } else {
    sm <- data.frame(sm_mean, sm_sd, sm_max)
    names(sm) <- c("mean", "sd", "max")
  }

  ## Return output
  return(sm)
}
