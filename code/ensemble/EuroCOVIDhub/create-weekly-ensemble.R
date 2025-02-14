# Runs and formats EuroCOVIDhub ensemble
#  saved in data-processed/EuroCOVIDhub-ensemble
library(vroom)
library(dplyr)
library(lubridate)
library(here)
library(tibble)
library(EuroForecastHub)

# Set up ----------------------------------------------------------------
# Get method
method <- get_hub_config("ensemble")[["method"]]

# Set current submission date
forecast_date <- today()
wday(forecast_date) <- get_hub_config("forecast_week_day")

# Get model names for manual exclusion
exclude_models <-
  vroom(here("code", "ensemble", "EuroCOVIDhub", "manual-exclusions.csv")) %>%
  filter(forecast_date == !!forecast_date) %>%
  pull(model)

# Run weekly automated ensemble -----------------------------------------
hub_ensemble <- run_ensemble(
  method = method,
  forecast_date = forecast_date,
  exclude_models = c(exclude_models, "EuroCOVIDhub-baseline"),
  return_criteria = TRUE
)

# Save in data-processed
vroom_write(hub_ensemble$ensemble,
            here("data-processed",
                 paste0("EuroCOVIDhub-ensemble"),
                 paste0(hub_ensemble$forecast_date,
                        "-EuroCOVIDhub-ensemble.csv")),
            delim = ",")


# Save criteria + methods -------------------------------------------------
suppressWarnings(
  dir.create(here("code", "ensemble", "EuroCOVIDhub", "criteria"))
)
vroom_write(hub_ensemble$criteria,
            here("code", "ensemble", "EuroCOVIDhub",
                 "criteria",
                 paste0("criteria-", hub_ensemble$forecast_date, ".csv")),
            delim = ",")

# Add method to csv
methods_by_date_file <-
  here("code", "ensemble", "EuroCOVIDhub", "method-by-date.csv")
if (file.exists(methods_by_date_file)) {
  methods_by_date <- vroom(methods_by_date_file)
} else {
  methods_by_date <- tibble(forecast_date = as.Date(character(0)),
                            method = character(0))
}
methods_by_date %>%
  add_row(forecast_date = hub_ensemble$forecast_date,
          method = method) %>%
  ## remove all but last entry if dates are multiple
  group_by(forecast_date) %>%
  slice(n()) %>%
  ungroup() %>%
  vroom_write(here("code", "ensemble", "EuroCOVIDhub",
                 "method-by-date.csv"),
            delim = ",")
