################################################################################
#
#'
#' Example dataset from *Ulijaszek and Kerr (1999)* containing repeat
#' measurements of stature `m` carried out by four observers on ten subjects.
#'
#' @format A data frame with 8 columns and 10 rows:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | *subject* | Subject unique identification number |
#' | *m1* | Stature measurements of first observer |
#' | *m2* | Stature measurements of second observer |
#' | *m3* | Stature measurements of third observer |
#' | *m4* | Stature measurements of fourth observer |
#' | *f1* | Results of the first function in the group TEM equation |
#' | *f2* | Results of the second function in the group TEM equation |
#' | *diff* | Difference between `f2` and `f2` (`f2` - `f1`) |
#'
#' @examples
#' stature
#'
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
#' Standardisation test data - sample 1
#'
#' Example dataset from the Standardized Monitoring and Assessment of Relief
#' and Transitions (SMART) capacity building toolbox found at
#' <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#' The dataset has been restructured into a less wide format compared to the
#' original wide format.
#'
#' @format A data frame with 8 columns and 110 rows:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | *subject* | Unique identifier of subjects who were measured |
#' | *observer* | Unique identifier for those who performed the measurements |
#' | *weight1* | First weight measurement. Units in kilograms |
#' | *weight2* | Second weight measurement. Units in kilograms |
#' | *height1* | First height measurement. Units in centimetres |
#' | *height2* | Second height measurement. Units in centimetres |
#' | *muac1* | First mid-upper arm circumference measurement. Units in millimetres |
#' | *muac* | Second mid-upper arm circumference measurement. Units in millimetres |
#'
#' @examples
#' smartStd
#'
#' @source Standardized Monitoring and Assessment of Relief and Transitions
#'   (SMART) capacity building toolbox found at
#'   <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#'
#
################################################################################
"smartStd"


################################################################################
#
#'
#' Standardisation test data - sample 2
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
#'
#' @examples
#' smartStdLong
#'
#' @source Standardized Monitoring and Assessment of Relief and Transitions
#'     (SMART) capacity building toolbox found at
#'     <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#'
#
################################################################################
"smartStdLong"


################################################################################
#
#'
#' Standardisation test data - sample 3
#'
#' Example dataset from the Standardized Monitoring and Assessment of Relief
#' and Transitions (SMART) capacity building toolbox found at
#' <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#' This dataset is the same as the \code{smartStd} dataset but has been kept in
#' the original wide format.
#'
#' @format A data frame with 67 columns and 10 rows
#'
#' @examples
#' smartWide
#'
#' @source Standardized Monitoring and Assessment of Relief and Transitions
#'     (SMART) capacity building toolbox found at
#'     <http://smartmethodology.org/survey-planning-tools/smart-capacity-building-toolbox/>.
#'
#
################################################################################
"smartWide"


################################################################################
#
#'
#' Dataset from a standardisation exercise done in Liberia in preparation for
#' a coverage survey.
#'
#' @format A data frame with 7 columns and 744 rows:
#'
#' | **Variable** | **Description** |
#' | :--- | :--- |
#' | *eid* | Enumerator ID |
#' | *cid* | Child ID |
#' | *round* | Standardisation test round |
#' | *weight* | Weight measurement |
#' | *height* | Height measurement |
#' | *muac* | Mid-upper arm circumference measurement |
#' | *oedema* | Bilateral pitting oedema |
#'
#' @examples
#' liberiaStdData
#'
#'
#
################################################################################
"liberiaStdData"
