# install and load packages
install.packages('dplyr')
install.packages('knitr')
install.packages('plotrix')
library(plotrix)
library(dplyr)
library(knitr)

# Read in files
setwd('~/Desktop/a7-GroupX')
data <- read.csv('data/intro_survey_data.csv')

# Write a function to find the total number of countries they visited for different class standing
number_of_countries <- function(my_data){
  outcome <- data %>% 
   filter(What.is.your.current.class.standing. == my_data) %>%
    select(How.many.countries.have.you.visited.in.your.life.)
  return(sum(outcome$How.many.countries.have.you.visited.in.your.life.))
}

# Find the total number of countries vistied for Freshmen
freshman <- number_of_countries('Freshman')

# Find the total number of countries vistied for Sophomore
sophomore <- number_of_countries('Sophomore')

# Find the total number of countries vistied for Junior
junior <- number_of_countries('Junior')

# Find the total number of countries vistied for Senior
senior <- number_of_countries('Senior')

# Draw a pie chart that show total countried visited corresponding by different class standings
slices <- c(freshman, sophomore, junior, senior) 
lbls <- c('Freshman', 'Sophomore', 'Junior', 'Senior')
pie3D(slices,labels=lbls,explode=0.1,
      main="Pie Chart of Countries Visited")