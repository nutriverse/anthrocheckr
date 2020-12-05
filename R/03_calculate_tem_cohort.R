################################################################################
#
#'
#' Calculate intra-observer TEM for each observer
#'
#' Function to calculate *intra-observer TEM* for each observer using input
#' dataset containing multiple types of multiple measurements from multiple
#' observers.
#'
#' @param df A data.frame containing data on multiple measurements made by
#'   multiple observers on multiple subjects
#' @param m1 A character value for variable in `df` containing initial round
#'   measurements made by multiple observers
#' @param m2 A character value for variable in `df` containing subsequent round
#'   measurements made by multiple observers
#' @param index A character value or vector specifying the variable name/s in
#'   `df` containing the factors to be used to group the results into. If
#'   multiple observers, at least two variable  names should be
#'   provided as observer identifiers. Any other variable in `df` that should
#'   be used as grouping factor should be included. This is *optional* and is
#'   set to NULL by default. This would indicate that the summary metrics
#'   will be made for the values in `measures` without any grouping
#' @param n Number of subjects measured
#'
#' @return A data frame of calculated TEM per observer and per
#'     measurement type.
#'
#' @examples
#' # Get the TEM per observer for MUAC measurements in the smartStd dataset
#' calculate_tem_cohort(df = smartStd,
#'                      m1 = "muac1", m2 = "muac2",
#'                      index = "observer", n = 10)
#'
#' @export
#'
#
################################################################################

calculate_tem_cohort <- function(df, m1, m2, index = NULL, n) {
  ## Check that m1 is a numeric vector
  if(class(df[[m1]]) == "character" | class(df[[m1]]) == "factor") {
    stop("m1 must be numeric. Try again.")
  }

  ## Check that m2 is a numeric vector
  if(class(df[[m2]]) == "character" | class(df[[m2]]) == "factor") {
    stop("m2 must be numeric. Try again.")
  }

  ## get TEM
  tem <- tapply(X = df[[m1]] - df[[m2]],
                INDEX = df[ , index],
                FUN = calculate_tem,
                n = n)

  #return output
  return(tem)
}
