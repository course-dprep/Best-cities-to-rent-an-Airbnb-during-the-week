# Weekends or weekdays: Could short-term Airbnb weekday stays become as expensive as weekends? 

<img width="650" alt="airbnb-678x381-1" src="https://user-images.githubusercontent.com/112823109/194288390-1e801324-f0dd-401a-a092-91ef73fe8cdb.png">

## Motivation
Shortterm weekday stays are becoming increasingly popular in the U.S (Chipkin, 2022). Demand for Tuesday night stays grew 5% from 2019 to 2021; Wednesdays came in a close second, followed by Mondays and Thursdays. In the past Airbnb hosts were quickly inclined to lower their prices for renting the Airbnb during the week, while instead, they maybe could increase prices. Currently, Airdna (2022) claims that it is an ideal time to optimize the pricing strategy for Airbnb hosts. Especially, weekday stays.

In this research, prices from week days and weekends will be compared. From the top 25 most popular Airbnb cities in the U.S.(Airdna, 2019), the following cities will be analyzed: Portland, San Francisco, Denver, Los Angeles, New York. These cities are spread all over the U.S, and by gathering and analyzing data of these 5 cities, a good representation of the whole U.S. is given. There is a possibility that the roomtype (private room, entire home/apartment, shared room or hotel room) has an impact on trend. It could appear that the pricthe trend can be confirmed in the U.S. If not, hosts can change their prices based on this research

In Europe, there are no sources found that confirm nor deny that the popularity of weekday stays has an impact on the pricing of Airbnb's. For that reason, the top 5 Airbnb cities in Europe, will also be analyzed: Munich, Milan, Paris, London and Dublin (Airbnb: These Are Europe’s Most Profitable Cities, n.d.). In the end, the U.S. and Europe will be compared to see the differences between both Europe and U.S.. The general question for this study project is as follows: 

**“*To what extent does the day of the week (weekday vs. weekend) impact pricing of Airbnb (U.S. vs. Europe)? And does this significantly differ per roomtype, and does this significantly differ between the cities (top 5 cities U.S. vs. top 5 cities Europe)?*”**


## Method
**Variables:**
```bash
1. weekdag: Monday, Tuesday, Wednesday, Thursday, Friday, Sturday, Sunday
2. wDay: computed variable of weekdays (Monday, Tuesday, Wednesday, Thursday, Sunday) vs. weekend (Friday, Saturday)
2. Room_type: Private room, entire home/ apartment, shared room or hotel
3. City: Top 5 most popular Airbnb cities in the U.S. and in Europe seperatly
4. Price: this is the price of the roomtype on a random day during the week or during the weekend
5. Date: the date is used to check if which price the hosts asks on a certain date
```
**Conceptual model:**

<img width="820" alt="image" src="https://user-images.githubusercontent.com/112823109/195271494-a0386fca-53c6-4273-8fbd-cc28217196a8.png">

## Analysis results

## Repository overview
```bash
├── README.md
├── data
├── gen
│   ├── analysis
│   ├── data-preparation
│   └── paper
└── src
    ├── analysis
    ├── data-preparation
    └── paper 
```
## How to run the analyses?

### Required software / programs 
To run the file you must have installed to following programs:
- [R and R-studio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)
- [Git Bash](https://gitforwindows.org/) (windows user) of terminal (mac user)
- [pandoc](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/) is needed to convert a markdown file to PDF

### R libraries 
In R the following packages should be installed by copying/ pasting and running the following code snippet:
- install.packages("tidyverse")
- install.packages("readr")
- install.packages("dplyr")
- library(stringr)
- library(tidyr)

### Collecting the data


### Running the workflow

### Data sources for this research 
- Airbnb data use available at [Inside Airbnb](http://insideairbnb.com/get-the-data/)

### Authors
This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com/) at Tilburg University as part of the Master's program Marketing Analytics, used for the team project of group 2.

- Bo de Ruijter, b.deruijter@tilburguniversity.edu
- Pepijn de Vries, p.j.devries@tilburguniversity.edu
- Amber Pullens, a.pullens@tilburguniversity.edu
- Anouk Lamers, a.j.f.lamers@tilburguniversity.edu
- Caroline Bloemendaal, c.a.bloemendaal@tilburguniversity.edu

### Resources

Onderstaande bronnen moeten nog verwerkt worden, daarnaast ook nog extra bronnen zoeken: 
- *5 Airbnb Guest Trends to Watch in 2022.* (n.d.). Retrieved October 4, 2022, from https://www.airdna.co/blog/5-airbnb-guest-trends-to-watch
- *Weekday US Hotel Occupancy Hits Pandemic-Era High.* (2022, June 20). Retrieved October 4, 2022, from https://www.businesstravelexecutive.com/news/weekday-us-hotel-occupancy-hits-pandemic-era-high
- *Airbnb: These are Europe’s most profitable cities.* (n.d.). TravelDailyNews International. Retrieved October 11, 2022, from https://www.traveldailynews.com/post/airbnb-these-are-europes-most-profitable-cities
