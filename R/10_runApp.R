################################################################################
#
#' run_anthrocheckr
#'
#' @return NULL
#' @examples
#' #
#'
#' @export
#'
#
################################################################################

run_anthrocheckr <- function() {
  appDir <- system.file("anthrocheckr", package = "anthrocheckr")

  if (appDir == "") {
    stop("Could not find Shiny directory. Try re-installing `anthrocheckr`.",
         call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
