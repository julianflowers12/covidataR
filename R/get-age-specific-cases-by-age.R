## age-specific case data for Engand

get_cases_age_england <- function(){

  require(jsonlite)
  require(dplyr)
  require(tidyr)


  url <- "https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=nation;areaName=England&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newCasesBySpecimenDateAgeDemographics%22:%22newCasesBySpecimenDateAgeDemographics%22%7D&format=json"

  data <- jsonlite::fromJSON(url, simplifyDataFrame = TRUE)
  data <- data$data %>%
    unnest(cols = 'newCasesBySpecimenDateAgeDemographics')

}


