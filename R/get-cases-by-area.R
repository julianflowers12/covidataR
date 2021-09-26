#' @title Get cases by age by area
#'
#' @description This function allows you extract age-specific case counts and rates for England in 5 year age bands as a timeseries.
#' @param null
#' @keywords cases
#' @export
#' @examples
#' get_cases_age_england()



## age-specific case data for areas

get_cases_by_area <- function(areatype = NULL){

  require(jsonlite)
  require(dplyr)
  require(tidyr)

  area <- areatype
  url <- paste0("https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=",areatype,"&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newCasesBySpecimenDateAgeDemographics%22:%22newCasesBySpecimenDateAgeDemographics%22%7D&format=json")

  data <- jsonlite::fromJSON(url, simplifyDataFrame = TRUE)
  data <- data$data %>%
    unnest(cols = 'newCasesBySpecimenDateAgeDemographics') %>%
    mutate(date = as.Date(date))

}


