library(gapminder)
## running tests for data_snapshot() function using test_that()

# testing that the function returns a list
test_that("Function returns list of objects", {
  foo <- data_snapshot(gapminder::gapminder, x = lifeExp, y = gdpPercap)
  expect_type(foo, "list")
})

# testing that the function returns a list containing the correct objects
 test_that("Objects returned by function are Correct", {
    foobar <- data_snapshot(gapminder::gapminder, lifeExp, gdpPercap)
    expect_is(foobar[[1]], "tbl_df")
    expect_is(foobar[[2]], "tbl_df")
    expect_is(foobar[[3]], "ggplot")
    expect_is(foobar[[4]], "character")
  })

 # testing that the function uses and plots the correct data
 test_that("The plot uses the correct data", {
   plot_check1 <- data_snapshot(gapminder::gapminder, lifeExp, gdpPercap)
   plot_check2 <- plot_check1[[3]]
   expect_that(gapminder::gapminder, equals(plot_check2$data))
 })

 # testing that the function is plotting the correct geom layer (geom_point)
 test_that("correct geom layer for ggplot returned", {
   plot_check1 <- data_snapshot(gapminder::gapminder, lifeExp, gdpPercap)
   plot_check2 <- plot_check1[[3]]
   expect_identical(class(plot_check2$layers[[1]]$geom), c("GeomPoint", "Geom", "ggproto", "gg"))
 })
 # testing that the function returns the correct regression coefficient, as a percentage
 test_that("check that regression output is correct", {
   numbers_check <- data_snapshot(gapminder::gapminder, lifeExp, gdpPercap)
   expect_identical(numbers_check[[4]], "Adjusted R-square is 34.03 %")
})
 # testing that the function throws errors when given non-numeric variables (3 cases tested)
 test_that("error when inputs not numeric variables", {
   expect_error(data_snapshot(gapminder::gapminder, country, lifeExp))
   expect_error(data_snapshot(gapminder::gapminder, lifeExp, country))
   expect_error(data_snapshit(gapminder::gapminder, continent, country))
 })
