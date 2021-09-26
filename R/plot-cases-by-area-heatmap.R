#' @title Get cases by age by area
#'
#' @description This function allows you extract age-specific case counts and rates for England in 5 year age bands as a timeseries.
#' @param null
#' @keywords cases
#' @export
#' @examples
#' get_cases_age_england()



## age-specific case data for areas

get_cases_by_area_heatmap <- function(areatype = NULL, areaname = NULL){

  require(jsonlite)
  require(dplyr)
  require(tidyr)
  require(viridis)

  area <- areatype
  area_name <- areaname
  url <- paste0("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=",area,"&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newCasesBySpecimenDateAgeDemographics%22:%22newCasesBySpecimenDateAgeDemographics%22%7D&format=json")

  data <- jsonlite::fromJSON(url, simplifyDataFrame = TRUE)
  data <- data$data %>%
    unnest(cols = 'newCasesBySpecimenDateAgeDemographics') %>%
    mutate(date = as.Date(date))

  plot <- data %>%
    filter(areaName == area_name,
           !age %in% c("00_59", "60+", "unassigned")) %>%
    ggplot(aes(date, age, fill = rollingRate)) +
    geom_tile() +
    scale_x_date(breaks = "months") +
    viridis::scale_fill_viridis(option = "inferno", direction = 1) +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(title = paste("Case rates in: ", area_name),
         subtitle = paste("Created on: ", Sys.Date()),
         y = "age",
         caption = "Source: https://api.coronavirus.data.gov.uk")

  print(plot)
}



