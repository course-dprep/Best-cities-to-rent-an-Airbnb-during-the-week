
# Most appealing cities in the US to rent an Airbnb during the week

![_109556954_airbnb (2)](https://user-images.githubusercontent.com/111437432/191220772-d6aa7645-2e0f-40c6-8fe0-ed349eafe2a6.png)

## Introduction
Welcome to the 'most appealing cities in the US to rent an Airbnb during the week' repository. 
This README provides detailed instructions on how to use the contents in this repository for future use.

## Motivation
Airbnb is started in 2007, when two hosts opened their San Francisco home to three guests. Since then, it has expanded to over 4 million hosts and more than 1 billion guest arrivals in practically every nation on earth. Through the internet marketplace Airbnb, homeowners who wish to rent out their properties can connect with travelers looking for accommodation in particular areas. 

Previously, Airbnbs were mostly rented on weekends. While renters still show up on weekends, weekday stays are becoming increasingly popular in the U.S. People who rent out an Airbnb are quickly inclined to lower their prices for renting the Airbnb during the week, while instead, they can increase prices because of the increasing demand. By gathering and analyzing data, it is possible to find out in which U.S. cities there is a higher demand for stays during the week. The general question for this study project is as follows: 

**“*Which U.S. cities are most appealing to rent your private room during the week?*”**

Read the generated research file by goign to XXXX(nog invullen, linkje naar het document met de resultaten)

## Method

## Analysis results

## Repository overview

## How to run the analyses? 
### Required software / programs 
To run the fle you must have installed to following programs:
- [R and R-studio](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/r/)
- [Make](https://tilburgsciencehub.com/building-blocks/configure-your-computer/automation-and-workflows/make/)
- [Git Bash](https://gitforwindows.org/) (windows user) of terminal (mac user)
- [pandoc](https://tilburgsciencehub.com/building-blocks/configure-your-computer/statistics-and-computation/pandoc/) is needed to convert a markdown file to PDF

### R libraries 

### Collecting the data

### Running the workflow

### Data sources for this research 
- Airbnb data use available at [Inside Airbnb](http://insideairbnb.com/get-the-data/)

### Authors
Thos is the repository for the course [Data Preparation and Workflow Management](https://dprep.hannesdatta.com/) at Tilburg University as part of the Master's program Marketing Analytics, used for the team project of group 2.

- Bo de Ruijter, b.deruijter@tilburguniversity.edu
- Pepijn de Vries, p.j.devries@tilburguniversity.edu
- Amber Pullens, a.pullens@tilburguniversity.edu
- Anouk Lamers, a.j.f.lamers@tilburguniversity.edu
- Caroline Bloemendaal, c.a.bloemendaal@tilburguniversity.edu

### More resources

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
