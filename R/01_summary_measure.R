################################################################################
#
#'
#' Calculate the summary measures of observations
#'
#' Get the mean, standard deviation and maximum value of the observations/
#' measurements made by an observer across multiple subjects
#'
#' @param df A data.frame containing observations/measurements made by
#'   a single observer or multiple observers across multiple subjects
#' @param measures A character value specifying the variable name in `df`
#'   containing vector of measurements made by an observer or multiple
#'   observers on multiple subjects.
#' @param index A character value or vector specifying the variable name/s in
#'   `df` containing the list of factors to be used to group the summary results
#'   into. If multiple observers, at least two variable  names should be
#'   provided as observer identifiers. Any other variable in `df` that should
#'   be used as grouping factor should be included. This is *optional* and is
#'   set to NULL by default. This would indicate that the summary metrics
#'   will be made for the values in `measures` without any grouping.
#'
#' @return A data frame containing calculated summary metrics of the
#'   specified `measures` grouped by specified `index`.
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
#'   mean_measure <- summary_measure(df = temp,
#'                                   measures = "weight",
#'                                   index = "observer")
#'   mean_measure
#'
#' # Apply summary_measure on smartStdLong dataset that has a row for each
#' # subject for each measure type and for each repeat measurement. Get mean,
#' # sd and max of height, weight and MUAC in one specification
#' summary_measure(df = smartStdLong,
#'                 measures = "measure_value",
#'                 index = c("observer", "measure_type"))
#'
#' @export
#'
#
################################################################################

summary_measure <- function(df, measures, index = NULL) {
  if (is.null(index)) {
    sm_mean <- mean(df[[measures]], na.rm = TRUE)
    sm_sd <- sd(df[[measures]], na.rm = TRUE)
    sm_max <- max(df[[measures]], na.rm = TRUE)
    sm <- c(sm_mean, sm_sd, sm_max)
    names(sm) <- c("mean", "sd", "max")
  } else {
    ## Get mean of measurements
    sm_mean <- tapply(X = df[[measures]],
                      INDEX = df[ , index],
                      FUN = mean, na.rm = TRUE)
    sm_mean <- as.data.frame.table(sm_mean)
    names(sm_mean)[names(sm_mean) == "Freq"] <- "mean"

    ## Get SD of measurements
    sm_sd <- tapply(X = df[[measures]],
                    INDEX = df[ , index],
                    FUN = sd, na.rm = TRUE)
    sm_sd <- as.data.frame.table(sm_sd)
    names(sm_sd)[names(sm_sd) == "Freq"] <- "sd"

    ## Get max value of measurements
    sm_max <- tapply(X = df[[measures]],
                     INDEX = df[ , index],
                     FUN = max, na.rm = TRUE)
    sm_max <- as.data.frame.table(sm_max)
    names(sm_max)[names(sm_max) == "Freq"] <- "max"

    if (length(index) > 1) {
      sm <- merge(sm_mean, sm_sd, by = index)
      sm <- merge(sm, sm_max, by = index)
    } else {
      sm <- merge(sm_mean, sm_sd)
      sm <- merge(sm, sm_max)
      names(sm)[1] <- index
    }
  }

  ## Return output
  return(sm)
}
