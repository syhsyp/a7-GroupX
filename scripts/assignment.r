library(dplyr)
library(plotly)
library(knitr)

data <- read.csv('data/intro_survey_data.csv')
data_by_class <- group_by(data, What.is.your.current.class.standing.) %>%
                  summarise(total = n())
