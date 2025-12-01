#' Fit a logistic regression model for having any affair
#'
#' Creates a binary outcome (any affair vs none) and fits a logistic
#' regression using demographic and marital variables.
#'
#' @param data A data frame like \code{Affairs}.
#' @param formula An optional model formula. By default:
#'   \code{any_affair ~ gender + age + yearsmarried + children +
#'   religiousness + education + occupation + rating}.
#'
#' @return An object of class \code{"affairs_model"} containing:
#' \itemize{
#'   \item \code{model}: the fitted \code{glm} object
#'   \item \code{data_info}: a list summarizing the dataset used
#' }
#'
#' @examples
#' mod <- fit_affairs_model()
#' mod
#'
#' @export
fit_affairs_model <- function(
    data = Affairs,
    formula = any_affair ~ gender + age + yearsmarried +
      children + religiousness + education + occupation + rating) {

  check_affairs_data(data)

  data <- data |> dplyr::mutate(any_affair = as.integer(affairs > 0))

  if (!inherits(formula, "formula")) {
    stop("'formula' must be a valid model formula.", call. = FALSE)
  }

  m <- stats::glm(formula, data = data, family = stats::binomial())

  res <- list(
    model = m,
    data_info = list(
      n = nrow(data),
      prop_any_affair = mean(data$any_affair, na.rm = TRUE)
    )
  )

  class(res) <- "affairs_model"
  res
}

#' @export
print.affairs_model <- function(x, ...) {
  cat("Affairs logistic regression model\n")
  cat("Number of observations:", x$data_info$n, "\n")
  cat("Proportion with any affair:",
      round(x$data_info$prop_any_affair, 3), "\n\n")
  cat("Coefficients (log-odds):\n")
  print(stats::coef(summary(x$model)))
  invisible(x)
}
