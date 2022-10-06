# Load packages
library(tidyverse)

# Input
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
urls_listing = c("http://data.insideairbnb.com/united-states/co/denver/2022-09-26/data/listings.csv.gz", "http://data.insideairbnb.com/ireland/leinster/dublin/2022-09-11/data/listings.csv.gz", "http://data.insideairbnb.com/united-kingdom/england/london/2022-09-10/data/listings.csv.gz", "http://data.insideairbnb.com/united-states/ca/los-angeles/2022-09-09/data/listings.csv.gz", "http://data.insideairbnb.com/italy/lombardy/milan/2022-09-14/data/listings.csv.gz", "http://data.insideairbnb.com/germany/bv/munich/2022-06-21/data/listings.csv.gz", "http://data.insideairbnb.com/united-states/ny/new-york-city/2022-09-07/data/listings.csv.gz", "http://data.insideairbnb.com/france/ile-de-france/paris/2022-06-06/data/listings.csv.gz", "http://data.insideairbnb.com/united-states/or/portland/2022-09-16/data/listings.csv.gz", "http://data.insideairbnb.com/united-states/ca/san-francisco/2022-09-07/data/listings.csv.gz")

urls_calender = c("http://data.insideairbnb.com/united-states/co/denver/2022-09-26/data/calendar.csv.gz",
                 "http://data.insideairbnb.com/ireland/leinster/dublin/2022-09-11/data/calendar.csv.gz")
urls_listing = c("http://data.insideairbnb.com/united-states/co/denver/2022-09-26/data/listings.csv.gz",
                  "http://data.insideairbnb.com/ireland/leinster/dublin/2022-09-11/data/listings.csv.gz")

# Transformation and output

for (url in urls_calender) {
  filename = paste(gsub('[^a-zA-Z]', '', url), '.csv')
  filename = gsub('httpdatainsideairbnbcom', '', filename)
  download.file(url, destfile = paste0('../../data/', filename)) # download file
}

sink('../../data/datafiles.txt')
cat('done!')
sink()
