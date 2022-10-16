library(tidyverse)

calender_data <- read.csv("calender_data.csv")
listing_data <- read.csv("listing_data.csv")

merged_data <- calender_data %>%
  left_join(listing_data, by = c("listing_id" = "id"))

cleaned_dataset <- na.omit(merged_data)

cleaned_dataset$date <- as.Date(cleaned_dataset$date)

cleaned_dataset$day_num <- format(cleaned_dataset$date,"%u")
cleaned_dataset$day_num <- as.numeric(cleaned_dataset$day_num)

cleaned_dataset$weekdag <- weekdays(cleaned_dataset$date)

  
weekdays1 <- c(1, 2, 3, 4, 7)
cleaned_dataset$wDay <- factor(((cleaned_dataset$day_num) %in% weekdays1), levels=c(FALSE, TRUE), labels=c('weekend', 'weekday'))


# We still need to change the price variable into a variable that stores the numeric value of price without the dollar sign
cleaned_dataset$price <- parse_number(cleaned_dataset$price)

## Make dummy variable of variable wDay 
cleaned_dataset$wDay <- ifelse(cleaned_dataset$wDay == "weekday", 1,0)

## Create new column for short-term stays
short_term_stays <- c('1', '2', '3', '4')
cleaned_dataset$short_term_stays <- factor(cleaned_dataset$minimum_nights %in% short_term_stays)

## Create new column for cities in U.S. and Europe
united_states <- c('denver', 'portland', 'san-francisco', 'los-angeles', 'new-york-city')
cleaned_dataset$united_states <- factor(cleaned_dataset$city %in% united_states)

europe <- c('munich', 'london', 'paris', 'milan', 'dublin')
cleaned_dataset$europe <-factor(cleaned_dataset$city %in% europe)

# Delete columns that are not needed for analyses
cleaned_dataset <- cleaned_dataset %>%
  dplyr::select(5,7,9,11,12,13,14,15,16,17)

write.csv(cleaned_dataset, "cleaned_dataset.csv")

file.copy(from="cleaned_dataset.csv", to='../../src/analysis')
# File copy needs to be copied towards the gen/analysis/input