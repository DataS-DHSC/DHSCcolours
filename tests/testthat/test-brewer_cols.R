# test examples ----------------------------------------------------------

test_that("brewer_dhsc colours for ohid", {
  set.seed(123)
  categories <- c("Car", "Bike", "Horse", "Running")
  df <- data.frame(category = categories,
                   value = runif(4))

  pal <- brewer_dhsc(theme = "ohid",
                     n = 4)

  p <- ggplot(df, aes(x = category, y = value)) +
          geom_col(aes(fill = category)) +
          labs(title = "Methods of transport") +
          theme_minimal() +
          scale_fill_manual(values = pal)

  expect_doppelganger("brewer_dhsc colours for ohid", p)
})


test_that("brewer_dhsc colours for dhsc with selected colours", {
  set.seed(123)
  categories <- c("Car", "Bike", "Horse", "Running")
  df <- data.frame(category = categories,
                   value = runif(4))

  pal <- brewer_dhsc(theme = "dhsc",
                     names = TRUE)
  pal <- pal[c("DHSC teal", "red", "maroon", "purple")]
  names(pal) <- categories
  p <- ggplot(df, aes(x = category, y = value)) +
    geom_col(aes(fill = category)) +
    labs(title = "Methods of transport") +
    theme_minimal() +
    scale_fill_manual(values = pal)
  expect_doppelganger("brewer_dhsc colours for dhsc with selected colours", p)
})

# test images -------------------------------------------------------------

test_that("brewer_dhsc colours for dhsc", {
  set.seed(123)
  categories <- c("Car", "Bike", "Horse", "Running")
  df <- data.frame(category = categories,
                   value = runif(4))

  pal <- brewer_dhsc(theme = "dhsc",
                     n = 4)

  p <- ggplot(df, aes(x = category, y = value)) +
    geom_col(aes(fill = category)) +
    labs(title = "Methods of transport") +
    theme_minimal() +
    scale_fill_manual(values = pal)

  expect_doppelganger("brewer_dhsc colours for dhsc", p)
})

test_that("brewer_dhsc colours for ohid with selected colours", {
  set.seed(123)
  categories <- c("Car", "Bike", "Horse", "Running")
  df <- data.frame(category = categories,
                   value = runif(4))

  pal <- brewer_dhsc(theme = "ohid",
                     names = TRUE)
  pal <- pal[c("DHSC teal", "red", "maroon", "purple")]
  names(pal) <- categories
  p <- ggplot(df, aes(x = category, y = value)) +
    geom_col(aes(fill = category)) +
    labs(title = "Methods of transport") +
    theme_minimal() +
    scale_fill_manual(values = pal)
  expect_doppelganger("brewer_dhsc colours for ohid with selected colours", p)
})


# test warnings -----------------------------------------------------------

test_that("warning for deprectated brewer_phe function", {
  expect_warning(brewer_phe(),
                 "brewer_phe\\(\\) will be deprecated soon and replaced by brewer_dhsc\\(theme = 'ohid'\\)")
})


# test errors -------------------------------------------------------------
test_that("error for brewer_dhsc for n < 1", {
  expect_error(brewer_dhsc(n = 0),
               "n must be positive")
})

