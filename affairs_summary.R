#' Summarize extramarital affairs in the dataset
#'
#' Provides basic summaries of the number of affairs and the proportion
#' of individuals with at least one affair.
#'
#' @param data A data frame with the same structure as \code{Affairs}.
#'   Defaults to the \code{Affairs} dataset included with the package.
#'
#' @return A list with elements:
#' \itemize{
#'   \item \code{overall}: a data frame with mean, median, and max number of affairs
#'   \item \code{any_affair}: proportion of individuals with at least one affair
#' }
#'
#' @examples
#' affairs_summary()
#' affairs_summary(Affairs)
#'
#' @export
affairs_summary <- function(data = Affairs) {
  check_affairs_data(data)

  any_affair <- mean(data$affairs > 0, na.rm = TRUE)

  overall <- data.frame(
    mean_affairs   = mean(data$affairs, na.rm = TRUE),
    median_affairs = stats::median(data$affairs, na.rm = TRUE),
    max_affairs    = max(data$affairs, na.rm = TRUE)
  )

  list(
    overall = overall,
    any_affair = any_affair
  )
}
