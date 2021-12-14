devtools::install_github("julianflowers12/covidataR")

cases <- covidataR::get_cases_by_area()


test <- get_cases_age_area(age = "00_04", areatype = "region")


plot <- function(df, var, areaName = NULL, smooth = NULL){

  require(tidyverse)

  smooth <- smooth
  var <- enquo(var)
  areaName <- areaName

  df %>%
    filter(areaName == areaName) %>%
    ggplot() +
    geom_line(aes(date, !!var, colour = areaName))+
    geom_smooth(aes(date, !!var), method = smooth, se = FALSE)


}


p <- plot(test, cases, areaName = "London")

p + facet_wrap(~areaName)





