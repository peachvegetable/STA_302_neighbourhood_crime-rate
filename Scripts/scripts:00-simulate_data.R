library(tidyverse)

set.seed(123)

start_year <- 2014
duration <- 10

# Simulate data for neighborhoods and crime types
simulated_data <-
  tibble(
    "Year" = start_year:(start_year + duration),
    "Crime_types" = sample(
      x = c("Assault", "Burglary", "Robbery", "Theft"),
      size = duration + 1,
      replace = TRUE
    ),
    "Crime_rates" = runif(n = duration + 1, min = 0, max = 100) 
  )


simulated_data
simulated_data$Crime_types |> unique()


# Tests
simulated_data$Year |> min() == 2014
simulated_data$Year |> max() == 2024
simulated_data$Crime_rates |> class() == "numeric"
setequal(unique(simulated_data$Crime_types), c("Assault", "Burglary", 
                                               "Robbery", "Theft")) == TRUE
simulated_data$Crime_types |> unique() |> length() == 4
