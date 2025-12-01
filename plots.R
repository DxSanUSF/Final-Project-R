#' Plot affair rates by marital rating
#'
#' @param data A data frame like \code{Affairs}.
#'
#' @return A ggplot object.
#'
#' @examples
#' plot_affairs_by_rating()
#'
#' @export
plot_affairs_by_rating <- function(data = Affairs) {
  check_affairs_data(data)

  summary_df <- affairs_rate_by_group(data, "rating")

  ggplot2::ggplot(summary_df, ggplot2::aes(x = factor(rating), y = prop_any_affair)) +
    ggplot2::geom_col() +
    ggplot2::labs(
      x = "Marital satisfaction rating",
      y = "Proportion with any affair",
      title = "Affair rates by self-rated marital satisfaction"
    )
}

#' Plot number of affairs vs age and years married
#'
#' @param data A data frame like \code{Affairs}.
#'
#' @return A ggplot object.
#'
#' @examples
#' plot_affairs_by_age_years()
#'
#' @export
plot_affairs_by_age_years <- function(data = Affairs) {
  check_affairs_data(data)

  ggplot2::ggplot(
    data,
    ggplot2::aes(x = age, y = yearsmarried, size = affairs)
  ) +
    ggplot2::geom_point(alpha = 0.6) +
    ggplot2::scale_size_continuous(name = "Number of affairs") +
    ggplot2::labs(
      x = "Age",
      y = "Years married",
      title = "Number of affairs by age and years married"
    )
}
