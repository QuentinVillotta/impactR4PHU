#' Create a project folder for fsl quality report
#'
#' @param folder_path Path for the new folder
#' @param ... Extra information collected from the RStudio wizard
#'
#' @return Folder with a copy of the fsl_quality_report
#'
#' @export
#'
#' @examples
#' \dontrun{
#' create_fsl_quality_report_template("path/to/folder")
#' }
#' Create a project folder for fsl quality report
#'
#' @param folder_path Path for the new folder
#' @param ... Extra information collected from the RStudio wizard
#'
#' @return Folder with a copy of the fsl_quality_report
#'
#' @export
#'
#' @examples
#' \dontrun{
#' create_fsl_quality_report_template("path/to/folder")
#' }
create_fsl_quality_report_template <- function(folder_path, ...) {
  from <- system.file("fsl_quality_report", package = "impactR4PHU")
  fs::dir_copy(from, folder_path, overwrite = FALSE)
  # Try both possible locations for Rprofile.R
  orig1 <- file.path("Rprofile.R")
  # orig1 <- file.path(folder_path, "fsl_quality_report", "Rprofile.R")
  # orig2 <- file.path(getwd(), "Rprofile.R")
  dest1 <- file.path(".Rprofile")
  # dest1 <- file.path(folder_path, "fsl_quality_report", ".Rprofile")
  # dest2 <- file.path(getwd(), ".Rprofile")
  if (fs::file_exists(orig1)) {
    fs::file_move(orig1, dest1)
  } else {
    warning(paste0("Actual wd : ", getwd()))
    stop(paste0("Expected activation file Rprofile.R not found in template. folder_path=", folder_path))
  }
  invisible(folder_path)
}

