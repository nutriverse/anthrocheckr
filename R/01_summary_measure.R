#'
#' Calculate the mean, sd and maximum difference value of
#' measurements/observations
#'
#' Get the mean, sd and maximum difference value of the
#' measurements/observations made by a single observer across multiple subjects
#'
#' @param measures A vector of measurements/observations made by a single
#'   observer across multiple subjects
#' @param index A character vector with length equal to `measures` specifying
#'   the factors to be used to group the measurements/values into before
#'   applying the summary function. For a single observer, this will tend to be
#'   the type of measurement made if `measures` is a vector of
#'   measurements/observations of different types e.g., weight and height.
#'   This is *optional* and is set to NULL by default. This would indicate that
#'   the summary metrics will be made for the values in `measures` without any
#'   grouping.
#'
#' @return A numeric value for the summary measure of measurements/observations
#'   if `index` is NULL. A named numeric vector for the summary measure of
#'   measurements/observations grouped by the factor specified by `index`
#'
#' @examples
#' ## Get the mean of weight measurements by observer 0 (supervisor) from the
#' ## smartStd dataset
#' x <- smartStd[smartStd$observer == 0, ]
#' calculate_mean(c(x$weight1, x$weight2))
#'
#' ## Get the mean weight, height and muac measurements by observer 0 from the
#' ## smartStdLong dataset
#' x <- smartStdLong[smartStdLong$observer == 0, ]
#' calculate_mean(x$measure_value, x$measure_type)
#'
#' ## Get the sd of weight measurements by observer 0 (supervisor) from the
#' ## smartStd dataset
#' x <- smartStd[smartStd$observer == 0, ]
#' calculate_sd(c(x$weight1, x$weight2))
#'
#' ## Get the sd of weight, height and muac measurements by observer 0 from the
#' ## smartStdLong dataset
#' x <- smartStdLong[smartStdLong$observer == 0, ]
#' calculate_sd(x$measure_value, x$measure_type)
#'
#' ## Get the max difference of weight measurements by observer 0 (supervisor)
#' ## from the smartStd dataset
#' x <- smartStd[smartStd$observer == 0, ]
#' calculate_max(abs(x$weight1 - x$weight2))
#'
#' ## Get the max difference of weight, height and muac measurements by observer
#' ## 0 from the smartStd dataset
#' x <- smartStd[smartStd$observer == 0, ]
#' calculate_max(c(abs(x$weight1 - x$weight2),
#'                 abs(x$height1 - x$height2),
#'                 abs(x$muac1 - x$muac2)),
#'               c(rep("weight", 10), rep("height", 10), rep("muac", 10)))
#'
#' @rdname calculate_summary
#' @export
#'

calculate_mean <- function(measures, index = NULL) {
  if (is.null(index)) {
    sm_mean <- mean(measures, na.rm = TRUE)
  } else {
    sm_mean <- tapply(X = measures, INDEX = index, FUN = mean, na.rm = TRUE)
    sm_mean <- as.data.frame.table(sm_mean)
  }

  ## return sm_mean
  return(sm_mean)
}


#'
#' @rdname calculate_summary
#' @export
#'

calculate_sd <- function(measures, index = NULL) {
  if (is.null(index)) {
    sm_sd <- sd(measures, na.rm = TRUE)
  } else {
    sm_sd <- tapply(X = measures, INDEX = index, FUN = sd, na.rm = TRUE)
  }

  ## return sm_sd
  return(sm_sd)
}


#'
#' @rdname calculate_summary
#' @export
#'

calculate_max <- function(measures, index = NULL) {
  if (is.null(index)) {
    sm_max_diff <- sd(measures, na.rm = TRUE)
  } else {
    sm_max_diff <- tapply(X = measures, INDEX = index, FUN = max, na.rm = TRUE)
  }

  ## return sm_max_diff
  return(sm_max_diff)
}
