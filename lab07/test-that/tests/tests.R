source("../functions/functions.R")


context("Test for range value")
test_that("range works as expected", {
  x <- c(1, 2, 3, 4, 5)

  expect_equal(range_value(x), 4)
  expect_length(range_value(x), 1)
  expect_type(range_value(x), 'double')
  
  y <- c(1, 2, 3, 4, NA)
  
  expect_equal(length(range_value(y)), 1)
  expect_type(range_value(y), "double")

  z <- c(TRUE, FALSE, TRUE)
  
  expect_equal(length(range_value(z)), 1)
  expect_is(class(range_value(z)), "character")
  expect_equal(range_value(z), 1L)
  
  w <- letters[1:5]
  
  expect_error(range_value(w))
})


context("Test for missing values")
test_that("missing values works as expected", {
  x <- c(1,5,NA)
  expect_equal(length(missing_values(x)), 1)
  expect_type(missing_values(x), "integer")
  expect_gt(missing_values(x), 0)
})
