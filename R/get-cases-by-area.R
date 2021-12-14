#' @title Get cases by area type
#'
#' @description This function allows you extract the full time series of daily cases for an area type e.g. utla or region
#' @param null
#' @keywords cases
#' @export
#' @examples
#' get_cases_by_area_type()



## Daily cases for area types

get_cases_by_area_type <- function(areatype = "overview"){

  require(jsonlite)
  require(dplyr)
  require(tidyr)
  require(tidyverse)

  area <- areatype
  csv <- glue::glue("https://api.coronavirus.data.gov.uk/v2/data?areaType=", area, "&metric=newCasesBySpecimenDate&format=csv")
  df <- read_csv(csv, show_col_types = F)
}




