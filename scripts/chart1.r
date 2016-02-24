## install and load the necessary package
library(dplyr)
library(plotly)

## import the .csv file
original <- read.csv("../data/intro_survey_data.csv")

## change the data to a more observed form
survey <- group_by(original, What.is.your.current.class.standing.) %>% summarise(number = n())
colnames(survey) <- c("Grade", "Number")

## plot the bar chart based on the grade and the students distrubution
plot_ly(survey,
        x = Grade,
        y = Number,
        name = "Number",
        type = "bar"
        ) %>% layout(title = "The Grade Distribution of INFO498F")
