#' @title Get cases by age
#'
#' @description This function allows you to plot age-specific case counts and rates for England in 5 year age bands as a timeseries.
#' @param age
#' @keywords cases
#' @export
#' @examples
#' get_cases_age_england()

plot_cases_age_england(age = "00_59")


## age-specific case data for England

plot_cases_age_england <- function(age = "60+"){

  require(jsonlite)
  require(dplyr)
  require(tidyr)
  require(ggplot2)
  require(zoo)


  url <- "https://coronavirus.data.gov.uk/api/v1/data?filters=areaType=nation;areaName=England&structure=%7B%22areaType%22:%22areaType%22,%22areaName%22:%22areaName%22,%22areaCode%22:%22areaCode%22,%22date%22:%22date%22,%22newCasesBySpecimenDateAgeDemographics%22:%22newCasesBySpecimenDateAgeDemographics%22%7D&format=json"

  data <- jsonlite::fromJSON(url, simplifyDataFrame = TRUE)
  data <- data$data %>%
    unnest(cols = 'newCasesBySpecimenDateAgeDemographics')
  #age <- enquo(age)
  age1 <- age
  plot <- data %>%
    filter(age == age1, date >= "2020-08-01") %>%
    #group_by(age) %>%
    mutate(date = as.Date(date),
           year_month = zoo::as.yearmon(date),
           rollmean = zoo::rollmean(rollingRate, k = 7, align = "center", fill = NA)
           ) %>%
    ggplot(aes(date, rollingRate)) +
    geom_col(fill = "blue", alpha = 0.3) +
    geom_line(aes(date, rollmean), colour = "red") +
    #geom_smooth(se = FALSE, method = "loess", span = 0.5) +
    scale_x_date(breaks = "months") +
    theme_minimal() +
    theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
    labs(title = paste("Case rates in England \nAge: ", age),
         y = "7-day rate per 100,000 population")

  print(plot)

}


