library(covidataR)

y <- get_cases_age_england(age = "20_24")
y
x <- get_vacc_coverage_england(age = "18_24")
x %>%
  select(date, contains("Coverage"))

p <- y %>%
  inner_join(x, by = "date") %>%
  ggplot(aes(date))

p <- p +
  geom_line(aes(date, rollingRate))

p <- p +
  geom_line(aes(date, 100*cumVaccinationCompleteCoverageByVaccinationDatePercentage), colour = "red")


p <- p +
  scale_y_continuous(sec.axis = sec_axis(~.*.01, name = "Coverage"))

p
