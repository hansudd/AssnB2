library(gapminder)
data(gapminder)

test_that("Function returns list of objects", {
  foo <- data_snapshot(gapminder::gapminder, x = lifeExp, y = gdpPercap)
  expect_is(foo, "list")
})

# test_that("Objects returned by function are Correct", {
#   foobar <- data_snapshot(df, lifeExp, gdpPercap)
#   expect_is(foobar[[1]], "tbl_df")
#   expect_is(foobar[[2]], "tbl_df")
#   expect_is(foobar[[3]], "ggplot")
#   expect_is(foobar[[4]], "numeric")
# })
#
# test_that("The plot uses the correct data", {
#   plot_check1 <- data_snapshot(df, lifeExp, gdpPercap)
#   plot_check2 <- plot_check1[[3]]
#   expect_that(df, equals(plot_check2$data))
# })
#
# test_that("correct geom layer for ggplot returned", {
#   plot_check1 <- data_snapshot(df, lifeExp, gdpPercap)
#   plot_check2 <- plot_check1[[3]]
#   expect_identical(class(plot_check2$layers[[1]]$geom), c("GeomPoint", "Geom", "ggproto", "gg"))
# })
#
# test_that("check that regression output is correct", {
#   numbers_check <- data_snapshot(df, lifeExp, gdpPercap)
#   numbers_check2 <- data_snapshot(df2, area_mean, perimeter_mean)
#   expect_equal(numbers_check[[4]], 0.3403256, tolerance = 1e-4)
#   expect_equal(numbers_check2[[4]], 0.9731484, tolerance = 1e-4)
# })
#
# test_that("error when inputs not numeric variables", {
#   expect_error(data_snapshot(gapminder, country, lifeExp))
#   expect_error(data_snapshot(gapminder, lifeExp, country))
#   expect_error(data_snapshit(gapminder, continent, country))
# })
