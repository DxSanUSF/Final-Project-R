#' Internal helper to validate the Affairs data
#'
#' @keywords internal
check_affairs_data <- function(data) {
  required_cols <- c(
    "affairs", "gender", "age", "yearsmarried",
    "children", "religiousness", "education",
    "occupation", "rating"
  )

  missing <- setdiff(required_cols, names(data))
  if (length(missing) > 0) {
    stop(
      "Data is missing required columns: ",
      paste(missing, collapse = ", "),
      call. = FALSE
    )
  }

  if (!is.numeric(data$affairs)) {
    stop("Column 'affairs' must be numeric.", call. = FALSE)
  }

  invisible(TRUE)
}
