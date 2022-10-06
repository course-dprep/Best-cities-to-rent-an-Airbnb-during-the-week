
calender_data <- lapply(urls_calender, function(url) {
  ds = read_csv(url, n_max = 5000)
  city_name = strsplit(url, '/')[[1]][6]
  ds = ds %>% mutate(city = city_name)
  ds
})

calender_data <- calender_data %>% bind_rows()
write.csv(calender_data, "calender_data.csv")

listing_data <- lapply(urls_listing, function(url) {
  ds = read_csv(url, col_select = c("id","room_type"), n_max = 5000)
  ds
})

listing_data <- listing_data %>% bind_rows()
write.csv(listing_data, "listing_data.csv")