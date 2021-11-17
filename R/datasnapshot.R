

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
