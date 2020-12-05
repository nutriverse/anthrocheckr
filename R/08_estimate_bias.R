################################################################################
#
#'
#' Calculate bias of a measurement
#'
#' Calculate the bias of a measurement against a gold standard. Two gold
#' standards are used in this function: 1) measurements made by a supervisor or
#' a known expert; and, 2) median of all measurements made by the observers.
#'
#' @param msur A numeric value or vector of mean measurements from observers
#' @param msup A numeric value or vector of mean measurements from supervisor
#' @param mall A numeric value or vector of the median of measurements from
#'     observers
#'
#' @return A numeric value or vector signifying bias
#'
#' @examples
#' x <- summary_measure(df = smartStdLong,
#'                      measures = "measure_value",
#'                      index = c("observer", "measure_type"))
#' y <- summary_measure(df = smartStdLong,
#'                      measures = "measure_value",
#'                      index = "measure_type")
#' estimate_bias(msur = x$mean[x$observer != 0 & x$measure_type == "height"],
#'               msup = x$mean[x$observer == 0 & x$measure_type == "height"],
#'               mall = y$mean[y$measure_type == "height"])
#'
#' @export
#'
#
################################################################################

estimate_bias <- function(msur, msup, mall) {
  ## Bias from supervisor
  bias_super <- abs(msur - msup) / msup

  ## Bias from median
  bias_med <- abs(msur - mall) / mall

  ## Concatenate into a data frame
  bias <- data.frame(bias_super, bias_med)

  ## Return output
  return(bias)
}
