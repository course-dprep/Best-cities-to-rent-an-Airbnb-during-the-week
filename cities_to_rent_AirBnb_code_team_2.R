# Install packages:

library(tidyverse)
library(readr)

# 1) download data
# We want to import data from airbnbwebsite --> csv.gz file of calender data

# We want to do this for 31 cities which are all cities listed in US

# 31 cities in url 

# --> so we have to make a loop which downloads all of the data url's 

urls = c('http://data.insideairbnb.com/united-states/nc/asheville/2022-06-11/data/calendar.csv.gz','http://data.insideairbnb.com/united-states/tx/austin/2022-06-08/data/calendar.csv.gz')

for (url in urls) {
  filename = paste(gsub('[^a-zA-Z]', '', url), '.csv') # keep only letter, removing the //:, etc.
  filename = gsub('httpdatainsideairbnbcom', '', filename) # wipe httpdatainsideairbnbcom from filename
  download.file(url, destfile = filename) # download file
}

# 2) Load the CSV.GZ files which we have just download (20 observations per city to check the code)

airbnb_team2 <- lapply(urls, function(url) {
  ds = read_csv(url, n_max = 200)
  city_name = strsplit(url, '/')[[1]][6]
  ds = ds %>% mutate(city = city_name)
  ds
})


# We bind all the rows to create 1 dataframe with all observations
airbnb_team2 <- airbnb_team2 %>% bind_rows()

# We omit all na's which would give us trouble during analysis
airbnb_team2_without_na <- na.omit(airbnb_team2)

# outcome --> dataset with 31 cities and all variables of the insidearibnb data

# 3) Want to compute the dates column, and add an extra column which transforms
# these dates into days of the week by number, meaning Monday = 1, Tuesday = 2, etc.
airbnb_team2_without_na$day_num <- format(airbnb_team2_without_na$date,"%u")
airbnb_team2_without_na$day_num <- as.numeric(airbnb_team2_without_na$day_num)

#Name of dataset$weekdag <- weekdays(name of dataset$date) --> NOT REQUIRED

# After this we will create an extra column for the dummy variable weekend or
# weekday, which will enable us the analyze the difference between weekends and
# weekdays

#create a vector of weekdays or weekends --> to create a column that indicates
#whether a day is in the weekend or on a weekday
weekdays1 <- c(1, 2, 3, 4, 7)
airbnb_team2_without_na$wDay <- factor(((airbnb_team2_without_na$day_num) %in% weekdays1), levels=c(FALSE, TRUE), labels=c('weekend', 'weekday'))


# We still need to change the price variable into a variable that stores the numeric value of price without the dollar sign
airbnb_team2_without_na$price <- parse_number(airbnb_team2_without_na$price)

# If all went correctly up to this point we should have a complete dataframe
# with the compilation of list information of AriBnB's with pricing information
# over the weekdays or weekends, with its respective city next to it.

# This dataframe allows us to analyze this data through the dplyr package to,
# for example see the measure the mean of price in weekend vs the mean of price
# in weekdays

airbnb_team2_without_na

# Next, we can run an ANOVA on this data to see whether the difference between these prices is significant.
# See example below:

airbnb_team2_without_na %>%
  filter(wDay == 'weekday')%>%
  summarise(weekdayfee <- mean(price))%>%
  View()        

airbnb_team2_without_na %>%
  filter(wDay == 'weekend')%>%
  summarise(weekendfee <- mean(price))%>%
  View()

ANOVA <- lm(price ~ wDay, airbnb_team2_without_na); 
summary(ANOVA)


