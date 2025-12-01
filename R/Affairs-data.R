#' Extramarital Affairs Dataset
#'
#' A dataset on marital satisfaction, demographics, and number of reported
#' extramarital affairs in the past year.
#'
#' @format A data frame with 601 rows and 10 variables:
#' \describe{
#'   \item{affairs}{Number of extramarital affairs in the past year (integer)}
#'   \item{gender}{Factor with levels \code{"male"} and \code{"female"}}
#'   \item{age}{Age in years (numeric)}
#'   \item{yearsmarried}{Number of years married (numeric)}
#'   \item{children}{Factor with levels \code{"yes"} and \code{"no"}}
#'   \item{religiousness}{Self-reported religiousness, 1 (not) to 5 (very)}
#'   \item{education}{Years of education}
#'   \item{occupation}{Occupation rating, 1 (low) to 7 (high)}
#'   \item{rating}{Self-rated marriage quality, 1 (very unhappy) to 5 (very happy)}
#' }
#'
#' @source Originally from the \pkg{AER} package and Fair (1978).
"Affairs"
