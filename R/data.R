################################################################################
#
#'
#' Example dataset from Ulijaszek and Kerr (1999) containing repeat measurements
#' of stature \code{m} carried out by four observers on ten subjects.
#'
#' @format A data frame with 8 columns and 10 rows:
#' \describe{
#' \item{\code{subject}}{Subject unique identification number}
#' \item{\code{m1}}{Stature measurements of first observer}
#' \item{\code{m2}}{Stature measurements of second observer}
#' \item{\code{m3}}{Stature measurements of third observer}
#' \item{\code{m4}}{Stature measurements of fourth observer}
#' \item{\code{f1}}{Results of the first function in the group TEM equation}
#' \item{\code{f2}}{Results of the second function in the group TEM equation}
#' \item{\code{diff}}{Difference between \code{f2} and \code{f2} (\code{f2} - \code{f1})}
#' }
#' @source Ulijaszek SJ, Kerr DA. Anthropometric measurement error and the
#'   assessment of nutritional status. Br J Nutr. 2007;82: 165–13.
#'   doi:10.1017/S0007114599001348
#'
#
################################################################################
"stature"


################################################################################
#
#'
#' Example dataset from the Standardized Monitoring and Assessment of Relief
#' and Transitions (SMART) capacity building toolbox found at
#' <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#' The dataset has been restructured into a less wide format compared to the
#' original wide format.
#'
#' @format A data frame with 8 columns and 110 rows:
#' \describe{
#' \item{\code{subject}}{Unique identifier of subjects who were measured}
#' \item{\code{observer}}{Unique identifier for those who performed the measurements.
#'     A unique identifier of \code{0} is given to the supervisor or the gold
#'     standard}
#' \item{\code{weight1}}{First weight measurement. Units in kilograms}
#' \item{\code{weight2}}{Second weight measurement. Units in kilograms}
#' \item{\code{height1}}{First height measurement. Units in centimetres}
#' \item{\code{height2}}{Second height measurement. Units in centimetres}
#' \item{\code{muac1}}{First mid-upper arm circumference measurement. Units in millimetres}
#' \item{\code{muac2}}{Second mid-upper arm circumference measurement. Units in millimetres}
#' }
#' @source Standardized Monitoring and Assessment of Relief and Transitions
#'     (SMART) capacity building toolbox found at
#'     <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#'
#
################################################################################
"smartStd"


################################################################################
#
#'
#' Example dataset from the Standardized Monitoring and Assessment of Relief
#' and Transitions (SMART) capacity building toolbox found at
#' <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#' This dataset is the same as the \code{smartStd} dataset but has been restructured
#' into a long format (as per tidyverse specifications) compared to original
#' format.
#'
#' @format A data frame with 5 columns and 660 rows:
#' \describe{
#' \item{\code{subject}}{Subject unique identifier}
#' \item{\code{observer}}{Observer unique identifier}
#' \item{\code{measure_type}}{Type of measurement. Can be \code{height},
#'     \code{weight}, or \code{muac}}
#' \item{\code{measure_round}}{Measurement round. Can be 1 or 2 for first and
#'     second round of measurement respectively}
#' \item{\code{measure_value}}{Measurement}
#' }
#' @source 1.	Ulijaszek SJ, Kerr DA. Anthropometric measurement error and the
#'     assessment of nutritional status. Br J Nutr. 2007;82: 165–13.
#'     doi:10.1017/S0007114599001348
#'
#
################################################################################
"smartStdLong"


################################################################################
#
#'
#' Dataset from a standardisation exercise done in Liberia in preparation for
#' a coverage survey.
#'
#' @format A data frame with 7 columns and 744 rows:
#' \describe{
#' \item{\code{eid}}{Enumerator ID}
#' \item{\code{cid}}{Child ID}
#' \item{\code{round}}{Standardisation test round}
#' \item{\code{weight}}{Weight measurement}
#' \item{\code{height}}{Height measurement}
#' \item{\code{muac}}{Mid-upper arm circumference measurement}
#' \item{\code{oedema}}{Bilateral pitting oedema}
#' }
#'
#
################################################################################
"liberiaStdData"