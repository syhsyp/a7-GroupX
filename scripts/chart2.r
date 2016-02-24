# install and load packages
<<<<<<< f0ae8e323edaa1abcd0d38159a150a6b065bd17b
=======
install.packages('plotrix')
>>>>>>> changed chart2
library(plotrix)
library(dplyr)

# Read in files
data <- read.csv('../data/intro_survey_data.csv')

# Create a new dataset that contains the total number of countries they visited corresponding by
# different class standing
number_of_countries <- data %>%
                         group_by(What.is.your.current.class.standing.) %>%
                           select(How.many.countries.have.you.visited.in.your.life.) %>%
                              summarise(total_countries = sum(How.many.countries.have.you.visited.in.your.life.))

# Draw a pie chart that show total countried visited corresponding by different class standings
build_chart2 <- function(my_data){
  slices <- my_data$total_countries 
  lbls <- paste(my_data$What.is.your.current.class.standing., '\n', my_data$total_countries, sep = '')
  chart2 <- pie3D(slices, labels=lbls, explode=0.1,
                  main="Pie Chart of Countries Visited")
  return(chart2)
}