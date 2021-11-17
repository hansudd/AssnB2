#' @title
#' Data Snapshot for Two Numeric Variables
#'
#' @description
#' Function provides snapshot of the linear relationship between two numeric variables, as well as some
#' summary statistics for numeric variables.
#'
#' @usage data_snapshot(data, x, y)
#'
#' @details
#' When given two numeric variables, x and y, this function produces summary statistics and a plot
#' that allows the user to get a quick snapshot of the data and in particular their linear relationship
#' (if any).
#'
#' @params `data` needs to be a data frame (for e.g., a tibble)
#' @params `x` This input is a numeric variable from a tibble or dataframe, for e.g. column with numeric values
#' @params `y` This input is a numeric variable from a tibble or dataframe, for e.g. column with numeric values
#'
#' @return If both x and y inputs are numeric and data is a data frame or tibble,
#'            then the function returns a list object.
#'            The list contains 4 objects:
#'            - summary table for y numeric variable (max, min, mean, median)
#'            - summary table for x numeric variable (max, min, mean, median)
#'            - scatter plot for x and y
#'            - adjusted r squared coefficient to indicate linear relationship of x vs y variables
#' @examples
#' data_snapshot(mtcars, hp, mpg)
#'
#' @export

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
              median = median(x, na.rm = TRUE))

  summary_for_y <- data %>%
    summarise(max = max(y, na.rm = TRUE),
              min = min(y, na.rm = TRUE),
              mean = mean(y, na.rm = TRUE),
              median = median(y, na.rm = TRUE))

  quickplot_scatter <- ggplot(data, aes(x=x, y=y)) +
    geom_point() +
    labs( x = "Input X variable",
          y = "Input Y variable") +
    theme_bw()

  simple_linear_model <- lm(y ~ x, data)
  summary_simplelm <- broom::glance(simple_linear_model)
  r_adj_value <- summary_simplelm$adj.r.squared

  ret_list <- list(summary_for_x, summary_for_y, quickplot_scatter, r_adj_value)

  return(ret_list)
}
