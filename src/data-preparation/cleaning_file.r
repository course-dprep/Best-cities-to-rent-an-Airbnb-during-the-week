merged_data <- calender_data %>%
  left_join(listing_data, by = c("listing_id" = "id"))

merged_data_without_na <- na.omit(merged_data)




merged_data_without_na$day_num <- format(merged_data_without_na$date,"%u")
merged_data_without_na$day_num <- as.numeric(merged_data_without_na$day_num)

weekdays1 <- c(1, 2, 3, 4, 7)
merged_data_without_na$wDay <- factor(((merged_data_without_na$day_num) %in% weekdays1), levels=c(FALSE, TRUE), labels=c('weekend', 'weekday'))


# We still need to change the price variable into a variable that stores the numeric value of price without the dollar sign
merged_data_without_na$price <- parse_number(merged_data_without_na$price)

write.csv(merged_data_without_na, "cleaned_dataset.csv")