test_that("seed not changed", {
  expect_equal({set.seed(34)
    rnorm(1)},
    {set.seed(34)
      invisible(z <- get_me_a_new_password())
      rnorm(1)
    }
      )
})


test_that("runs not equal",
  expect_false(get_me_a_new_password() == get_me_a_new_password()
  ) )
