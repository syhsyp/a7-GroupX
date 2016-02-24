library(dplyr)
library(plotly)
library(knitr)

data <- read.csv('../data/intro_survey_data.csv')
total_students <- nrow(data)

data_by_class <- group_by(data, What.is.your.current.class.standing.) %>%
                  summarise(total = n())
most_class_standing <- as.character(arrange(data_by_class, desc(total))$What.is.your.current.class.standing.[1])

num_apply_info <- nrow(filter(data, Are.you.interested.in.applying.to.the.Informatics.major. == "Yes"))

num_country_more_than_ten <- nrow(filter(data, How.many.countries.have.you.visited.in.your.life. > 10))

# A function that takes in a dataset and returns a list of info about it:
info_function <- function(dataset) {
  ret <- list()
  ret$length <- length(dataset)
  ret$total_students <- nrow(dataset)
  ret$total_questions <- ncol(dataset)
  return (ret)
}