library(purrr)

metadata <- fs::dir_ls(
  here::here("data-processed"),
  regexp = "([a-zA-Z0-9_+]+\\-[a-zA-Z0-9_+]+)/metadata\\-\\1\\.txt$",
  type = "file",
  recurse = TRUE
) %>%
  # sort with radix method ensures locale-independent output
  sort(method = "radix") %>%
  map(yaml::read_yaml) %>%
  set_names(map(., ~ pluck(.x, "model_abbr"))) %>%
  map(function(e) {
    e$methods_long <- ifelse(is.null(e$methods_long), e$methods, e$methods_long)
    return(e)
  }) %>%
  # delete double spaces in all fields because they don't play nice with json
  rapply(function(x) gsub("\\s+", " ", x), how = "replace")

metadata_json <- metadata %>%
  jsonlite::toJSON(auto_unbox = TRUE, pretty = TRUE)

metadata_json %>%
  write(here::here("viz", "metadata.json"))

