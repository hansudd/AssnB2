#'
#' Data Snapshot for Two Numeric Variables
#'
#' @description
#' Function provides snapshot of the linear relationship between two numeric variables, as well as some
#' summary statistics for numeric variables.
#'
#' @details
#' When given two numeric variables, x and y, this function produces summary statistics and a plot
#' that allows the user to get a quick snapshot of the data and in particular their linear relationship
#' (if any).
#'
#' @param data needs to be a data frame (for e.g., a tibble)
#' @param x This input is a numeric variable from a tibble or dataframe, for e.g. column with numeric values
#' @param y This input is a numeric variable from a tibble or dataframe, for e.g. column with numeric values
#'
#' @return This function returns summary tables for numeric variables, a scatterplot and adjusted R squared value
#'
#' @examples
#' data_snapshot(mtcars, hp, mpg)
#' data_snapshot(gapminder::gapminder, lifeExp, gdpPercap)
#'
#' @export
#'
#' @importFrom dplyr summarise
#' @importFrom ggplot2 ggplot aes geom_point labs theme_bw
#' @importFrom broom glance
#' @importFrom magrittr %>%
#'

data_snapshot <- function(data, x, y) {

  x <- eval(substitute(x), data)
  y <- eval(substitute(y), data)

  if(!(is.numeric(x) && is.numeric(y))){
    stop(" Both inputs need to be numeric variables. Please check. Column x is of class: ", class(x),
         " and Column y is of class: ", class(y))
  }

  summary_for_x <- data %>%
    summarise(max = max(x, na.rm = TRUE),
              min = min(x, na.rm = TRUE),
              mean = mean(x, na.rm = TRUE),
              median = stats::median(x, na.rm = TRUE))

  summary_for_y <- data %>%
    summarise(max = max(y, na.rm = TRUE),
              min = min(y, na.rm = TRUE),
              mean = mean(y, na.rm = TRUE),
              median = stats::median(y, na.rm = TRUE))

  quickplot_scatter <- ggplot(data, aes(x=x, y=y)) +
    geom_point() +
    labs( x = "Input X variable",
          y = "Input Y variable") +
    theme_bw()

  simple_linear_model <- stats::lm(y ~ x, data)
  summary_simplelm <- broom::glance(simple_linear_model)
  r_adj_value <- summary_simplelm$adj.r.squared

  ret_list <- list(summary_for_x, summary_for_y, quickplot_scatter, r_adj_value)

  return(ret_list)
}

?data_snapshot

