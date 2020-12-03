################################################################################
#
#'
#' Calculate the Total TEM given individual intra-observer TEM.
#'
#' @param intra A numeric vector or data frame of individual intra-observer TEM.
#' @param inter A numeric value of inter-observer TEM.
#'
#' @return A numeric value of total TEM
#'
#' @examples
#' # Calculate total
#' intra <- calculate_tem_cohort(m1 = smartStd$muac1, m2 = smartStd$muac2,
#'   index = smartStd$observer, n = 11)
#' # Get inter
#' muacDF1 <- subset(smartStd, select = c(-muac2, -weight1, -weight2, -height1, -height2))
#' muacDF2 <- subset(smartStd, select = c(-muac1, -weight1, -weight2, -height1, -height2))
#'
#' # Spread the dataset to wide format
#' #library(tidyr)
#' muacDF1 <- tidyr::spread(muacDF1, key = "observer", value = "muac1")
#' muacDF2 <- tidyr::spread(muacDF2, key = "observer", value = "muac2")
#' muacDF <- merge(muacDF1, muacDF2, by = "subject")
#' inter <- calculate_team_tem(n = 10, k = 22, m = muacDF[ , 2:23])
#'
#' total_tem <- calculate_total_tem(intra = intra, inter = inter)
#'
#' @export
#'
#
################################################################################

calculate_total_tem <- function(intra, inter) {
  ## Get total TEM
  total_tem <- sqrt((sum(intra ^ 2) / length(intra)) + (inter ^ 2)  )

  ## Return output
  return(total_tem)
}
