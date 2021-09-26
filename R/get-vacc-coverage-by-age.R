#' @title Get vaccination coverage by age
#'
#' @description This function allows you extract age-specific vaccination coverage for England in 5 year age bands as a timeseries.
#' @param null
#' @keywords cases
#' @export
#' @examples
#' get_vacc_coverage_age_england()



## Vaccination coverage for England

get_vacc_coverage_england <- function(age = NULL){

  require(jsonlite)
  require(dplyr)
  require(tidyr)

  age1 <- age
  url <- "https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=nation;areaName=England&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22vaccinationsAgeDemographics%22:%22vaccinationsAgeDemographics%22%7D&format=json"
  data <- jsonlite::fromJSON(url, simplifyDataFrame = TRUE)
  data <- data$data %>%
    unnest(cols = 'vaccinationsAgeDemographics') %>%
    mutate(date = as.Date(date)) %>%
    filter(age == age1)

}

