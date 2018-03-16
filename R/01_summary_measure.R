################################################################################
#
#' summary_measure
#'
#' Get the mean, standard deviation and maximum value of the observations/
#' measurements made by a single observer across multiple subjects
#'
#' @param x A numeric vector of measurements made by multiple observers on
#'     multiple subjects.
#' @param index A list of factors to be used to group the summary results into.
#'     If multiple observers, then this list should include at least the observer
#'     identifiers. Any other grouping factor should then be added to the list.
#'
#' @return A numeric vector or data frame with calculated summary measures.
#'
#' @examples
#' # Apply summary_measure on smartStd dataset that has a row for each subject
#' # measurement and multiple columns of different measurement types (i.e, height,
#' # weight, muac) taken at different times (repeat measurements). The grouping
#' # variable is the observer column. This can be used to get the summary
#' # measure for one measurement type only but can be used to summarise repeat
#' # measurements
#'
#' # Get mean of weight measure taken by each observer at 2 separate occasions
#'   x <- smartStd[ , c("observer", "weight1")]
#'   y <- smartStd[ , c("observer", "weight2")]
#'   names(x) <- names(y) <- c("observer", "weight")
#'   temp <- data.frame(rbind(x, y))
#'   mean_measure <- summary_measure(x = temp$weight, index = temp$observer)
#'
#' @export
#'
#'
#'
#'
#'
#'
#'
#
################################################################################

summary_measure <- function(x, index) {

  sm_mean <- tapply(X = x, INDEX = index, FUN = mean, na.rm = TRUE)

  sm_sd <- tapply(X = x, INDEX = index, FUN = sd, na.rm = FALSE)

  sm_max <- tapply(X = x, INDEX = index, FUN = max, na.rm = FALSE)

  if(is.list(index) | is.data.frame(index)) {
    sm <- as.list(sm_mean, sm_sd, sm_max)
    names(sm) <- c("mean", "sd", "max")
  }
  sm <- data.frame(sm_mean, sm_sd, sm_max)
  names(sm) <- c("mean", "sd", "max")
  #
  # Return output
  #
  return(sm)
}
