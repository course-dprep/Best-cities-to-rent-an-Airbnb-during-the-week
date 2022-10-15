library(tidyverse)
urls_calender = c("http://data.insideairbnb.com/united-states/co/denver/2022-09-26/data/calendar.csv.gz",
                  "http://data.insideairbnb.com/ireland/leinster/dublin/2022-09-11/data/calendar.csv.gz", 
                  "http://data.insideairbnb.com/united-kingdom/england/london/2022-09-10/data/calendar.csv.gz", 
                  "http://data.insideairbnb.com/united-states/ca/los-angeles/2022-09-09/data/calendar.csv.gz",
                  "http://data.insideairbnb.com/italy/lombardy/milan/2022-09-14/data/calendar.csv.gz", 
                  "http://data.insideairbnb.com/germany/bv/munich/2022-06-21/data/calendar.csv.gz", 
                  "http://data.insideairbnb.com/united-states/ny/new-york-city/2022-09-07/data/calendar.csv.gz",
                  "http://data.insideairbnb.com/france/ile-de-france/paris/2022-06-06/data/calendar.csv.gz", 
                  "http://data.insideairbnb.com/united-states/or/portland/2022-09-16/data/calendar.csv.gz",
                  "http://data.insideairbnb.com/united-states/ca/san-francisco/2022-09-07/data/calendar.csv.gz")
urls_listing = c("http://data.insideairbnb.com/united-states/co/denver/2022-09-26/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/ireland/leinster/dublin/2022-09-11/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/united-kingdom/england/london/2022-09-10/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/united-states/ca/los-angeles/2022-09-09/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/italy/lombardy/milan/2022-09-14/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/germany/bv/munich/2022-06-21/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/united-states/ny/new-york-city/2022-09-07/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/france/ile-de-france/paris/2022-06-06/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/united-states/or/portland/2022-09-16/data/listings.csv.gz", 
                 "http://data.insideairbnb.com/united-states/ca/san-francisco/2022-09-07/data/listings.csv.gz")

calender_data <- lapply(urls_calender, function(url) {
  ds = read_csv(url, n_max = Inf)
  city_name = strsplit(url, '/')[[1]][6]
  ds = ds %>% mutate(city = city_name)
  ds
})

# Try random sample:
# calender_data <- lapply(urls_calender, function(url) {
#ds = sampleCSV(url, 5000)
#city_name = strsplit(url, '/')[[1]][6]
#ds = ds %>% mutate(city = city_name)
#ds
#})


calender_data1 <- calender_data[1:3] %>% bind_rows()
sample_calender_data <- sample_n(calender_data1, nrow(calender_data1)/15)
rm(calender_data1)
calender_data2<- calender_data[4:7] %>% bind_rows()
sample_calender_data2 <- sample_n(calender_data2, nrow(calender_data2)/15)
rm(calender_data2)
calender_data3 <- calender_data[8:10] %>% bind_rows()
sample_calender_data3 <- sample_n(calender_data3, nrow(calender_data3)/15)
rm(calender_data3)
rm(calender_data)

calender_data <- bind_rows(sample_calender_data, sample_calender_data2, sample_calender_data3)
write.csv(calender_data, "calender_data.csv")
rm(sample_calender_data, sample_calender_data2, sample_calender_data3)

listing_data <- lapply(urls_listing, function(url) {
  ds = read_csv(url, col_select = c("id","room_type"), n_max = Inf)
  ds
})

listing_data <- listing_data %>% bind_rows()
write.csv(listing_data, "listing_data.csv")

sink('../../data/datafiles1.txt')
cat('done!')
sink()