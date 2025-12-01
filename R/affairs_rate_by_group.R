#' Affair rates by group
#'
#' Computes the proportion of individuals with at least one affair
#' for each level of a grouping variable (e.g., gender, children, rating).
#'
#' @param data A data frame like \code{Affairs}.
#' @param group_var A string giving the column name to group by.
#'
#' @return A data frame with one row per group and the proportion
#'   of individuals with at least one affair.
#'
#' @examples
#' affairs_rate_by_group(Affairs, "gender")
#' affairs_rate_by_group(Affairs, "rating")
#'
#' @export
affairs_rate_by_group <- function(data = Affairs, group_var) {
  check_affairs_data(data)

  if (missing(group_var) || !is.character(group_var) || length(group_var) != 1) {
    stop("'group_var' must be a single character string naming a column.", call. = FALSE)
  }

  if (!group_var %in% names(data)) {
    stop("Column '", group_var, "' not found in data.", call. = FALSE)
  }

  dplyr::group_by(data, .data[[group_var]]) |>
    dplyr::summarise(
      n = dplyr::n(),
      prop_any_affair = mean(affairs > 0, na.rm = TRUE),
      .groups = "drop"
    )
}
