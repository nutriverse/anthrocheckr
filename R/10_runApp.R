################################################################################
#
#' Run the anthrocheckr Shiny app
#'
#' @return NULL
#'
#' @examples
#' if (interactive()) run_anthrocheckr()
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
