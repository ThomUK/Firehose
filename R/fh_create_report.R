#' Create Report
#'
#' @param output_file The desired output filename (defaults to "report.html")
#' @param output_dir The desired output directory (defaults to "/output")
#'
#' @return TRUE when complete
#' @export
#'
fh_create_report <- function(
  output_file = "report.html",
  output_dir = file.path(getwd(), "output")
) {

  ## Get directory of report markdown template
  report_dir <- system.file("Rmd/report.rmd", package = "Firehose")

  ## Render report into html
  rmarkdown::render(
    input = report_dir,
    output_file = output_file,
    output_dir = output_dir,
    intermediates_dir = output_dir
  )

  ## Open report
  report_path <- path.expand(file.path(output_dir, output_file))
  browseURL(report_path)
  beepr::beep(1) # finished!

  return(TRUE)

}

