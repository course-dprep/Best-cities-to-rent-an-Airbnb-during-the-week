
# Could shortterm Airbnb weekday stays become as expensive as weekends? 

![_109556954_airbnb (2)](https://user-images.githubusercontent.com/111437432/191220772-d6aa7645-2e0f-40c6-8fe0-ed349eafe2a6.png)

## Introduction
Welcome to the 'could shortterm Airbnb weekdays stay become as expensive as weekends?' repository. 
This README provides detailed instructions on how to use the contents in this repository for future use.

## Motivation
Shortterm weekday stays are becoming increasingly popular in the U.S (Chipkin, 2022). Demand for Tuesday night stays grew 5% from 2019 to 2021; Wednesdays came in a close second, followed by Mondays and Thursdays. In the past Airbnb hosts were quickly inclined to lower their prices for renting the Airbnb during the week, while instead, they maybe could increase prices. Currently, Airdna (2022) claims that it is an ideal time to optimize the pricing strategy for the Airbnb hosts. 

From the top 25 most popular Airbnb cities (Airdna, 2019), the 5 biggest cities are chosen: Portland, San Francisco, Denver, Los Angeles, New York. By gathering and analyzing data of 5 cities spread over the U.S., we could see if the hosts in the U.S. already adapted their pricing strategy. There is a possibility that the roomtype (entire place, private room, hotel room or a shared room) has an impact. 

The general question for this study project is as follows: 

**“*To what extent does the day of the week (weekend vs. weekday) impact pricing of Airbnb in the U.S.? And does this significantly differ per roomtype, and does this significantly differ between the 5 U.S. cities?*”**

Next to that, it could be interesting to find out if this trend also exists in Europe. Therefore, the following cities in Europe will be analyzed: Munich, Milan, Paris, London and Dublin (**BRON**). 

## Method
```bash
Variables: 
- Price
- Date 
- Location 
- Computed variable weekend or weekday
- City 
- Roomtype 
- ID
- Continent
```
Conceptual model: 

## Analysis results

## Repository overview --> AANPASSEN!!!!!
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

### More resources

Onderstaande bronnen moeten nog verwerkt worden, daarnaast ook nog extra bronnen zoeken: 
- https://www.airdna.co/blog/5-airbnb-guest-trends-to-watch
- https://www.businesstravelexecutive.com/news/weekday-us-hotel-occupancy-hits-pandemic-era-high 















## Example of reproducible research workflow
This is a basic example repository using Gnu make for a reproducible research workflow, as described in detail here: [tilburgsciencehub.com](http://tilburgsciencehub.com/). 

The main aim of this to have a basic structure, which can be easily adjusted to use in an actual project.  In this example project, the following is done: 
1. Download and prepare data
2. Run some analysis
3. Present results in a final pdf generated using LaTeX

## Dependencies
- R 
- R packages: `install.packages("stargazer")`
- [Gnu Make](https://tilburgsciencehub.com/get/make) 
- [TeX distribution](https://tilburgsciencehub.com/get/latex/?utm_campaign=referral-short)
- For the `makefile` to work, R, Gnu make and the TeX distribution (specifically `pdflatex`) need to be made available in the system path 
- Detailed installation instructions can be found here: [tilburgsciencehub.com](http://tilburgsciencehub.com/)


## Notes
- `make clean` removes all unncessary temporary files. 
- Tested under Linux Mint (should work in any linux distro, as well as on Windows and Mac) 
- IMPORTANT: In `makefile`, when using `\` to split code into multiple lines, no space should follow `\`. Otherwise Gnu make aborts with error 193. 
- Many possible improvements remain. Comments and contributions are welcome!
