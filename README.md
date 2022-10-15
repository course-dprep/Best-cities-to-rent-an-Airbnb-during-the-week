# Weekday vs. weekend: is there still a difference in Airbnb prices? 

<img width="650" alt="airbnb-678x381-1" src="https://user-images.githubusercontent.com/112823109/194288390-1e801324-f0dd-401a-a092-91ef73fe8cdb.png">

## Motivation
Short term weekday stays are becoming increasingly popular in the U.S (Chipkin, 2022). Demand for Tuesday night stays grew 5% from 2019 to 2021; Wednesdays came in a close second, followed by Mondays and Thursdays. In the past Airbnb hosts were quickly inclined to lower their prices for renting the Airbnb during the week, while instead, they maybe could increase prices. Currently, Airdna (2022) claims that it is an ideal time to optimize the pricing strategy for Airbnb hosts. Especially, for the weekday stays.

In this research, prices from short term stays during the weekd and weekends will be compared. From the top 25 most popular Airbnb cities in the U.S.(Airdna, 2019), the following cities will be analyzed: Portland, San Francisco, Denver, Los Angeles, New York. These cities are spread all over the U.S, and by gathering and analyzing data of these 5 cities, a good representation of the whole U.S. is given. There is a possibility that the roomtype (private room, entire home/apartment, shared room or hotel room) has an impact on trend. 

In Europe, there are no sources found that confirm nor deny that the popularity of weekday stays has an impact on the pricing of Airbnb's. For that reason, the top 5 Airbnb cities in Europe, will also be analyzed: Munich, Milan, Paris, London and Dublin (Airbnb: These Are Europe’s Most Profitable Cities, n.d.). In the end, the U.S. and Europe will be compared to see the differences between both Europe and U.S.. The general question for this study project is as follows: 

**“*To what extent does the day of the week (weekday vs. weekend) impact pricing of Airbnb? And does this significantly differ per roomtype, and does this significantly differ between the cities (top 5 cities U.S. vs. top 5 cities Europe)?*”**


## Repository overview
```bash
├── README.md
├── gen
│   ├── analysis
│   ├── data-preparation
│   └── paper
└── src
    ├── analysis
    ├── data-preparation
    └── paper 
```

## Required software / programs 
To run the file you must have installed to following programs:
- [R and R-studio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)
- [Git Bash](https://gitforwindows.org/) (windows user) of terminal (mac user)
- [pandoc](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/) is needed to convert a markdown file to PDF

## How to run the project  

## Research method
To answer the researuch question, multiple Airbnb datasets from [Inside Airbnb](http://insideairbnb.com/get-the-data/) are combined to one dataset. The dataset contains data from 10 cites in total, 5 from the U.S. and 5 from Europe. This dataset is cleaned and prepared for anlyses, because lots of unformation was not needed to answer the research question. For more information about this read: [/src/data-preparation/README_data_preparation.md](https://github.com/course-dprep/What-happens-to-AirBnB-pricing-on-weekdays-vs-weekends/blob/master/src/data-preparation/README_data_preparation.md)

**Conceptual model:**

![image](https://user-images.githubusercontent.com/112823109/195831134-55df6bd7-c7eb-4388-b0e6-b1bc8b94fa46.png)

**Variables of conceptual model:**
```bash
1. wDay: computed variable of weekdays (Monday, Tuesday, Wednesday, Thursday, Sunday) vs. weekend (Friday, Saturday)
2. Room_type: Private room, entire home/ apartment, shared room or hotel
3. City: Top 5 most popular Airbnb cities in the U.S. and in Europe seperatly
4. Price: this is the price of the roomtype on a random day during the week or during the weekend
```

## Conclusion
Based on the previous result section, the following conclusions can be drawn for the hypothesized relation. There is no significant effect in the difference of the price between weekend days and weekdays. The average price between weekdays and weekend days does differ for cities in Europe, but this difference is very small. However there are two interaction effects:  between weekdays vs. weekend days and room type on price, and between weekdays vs. weekend days and city on price. 
 
Despite the conclusion of the hypothesis, it is critical to keep in mind that the size of the effect was very tiny in all statistical tests. This means that these results should be interpreted with caution. 

For more detailed information about the findings of the analyses, read: [/gen/analysis/output/README_analysis_conclusion.md](https://github.com/course-dprep/What-happens-to-AirBnB-pricing-on-weekdays-vs-weekends/blob/master/gen/analysis/output/README_analysis_conclusion.md)

### Authors
This is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com/) at Tilburg University as part of the Master's program Marketing Analytics, used for the team project of group 2.

- Bo de Ruijter, b.deruijter@tilburguniversity.edu
- Pepijn de Vries, p.j.devries@tilburguniversity.edu
- Amber Pullens, a.pullens@tilburguniversity.edu
- Anouk Lamers, a.j.f.lamers@tilburguniversity.edu
- Caroline Bloemendaal, c.a.bloemendaal@tilburguniversity.edu

### Resources
- *5 Airbnb Guest Trends to Watch in 2022.* (n.d.). Retrieved October 4, 2022, from https://www.airdna.co/blog/5-airbnb-guest-trends-to-watch
- *Weekday US Hotel Occupancy Hits Pandemic-Era High.* (2022, June 20). Retrieved October 4, 2022, from https://www.businesstravelexecutive.com/news/weekday-us-hotel-occupancy-hits-pandemic-era-high
- *Airbnb: These are Europe’s most profitable cities.* (n.d.). TravelDailyNews International. Retrieved October 11, 2022, from https://www.traveldailynews.com/post/airbnb-these-are-europes-most-profitable-cities
