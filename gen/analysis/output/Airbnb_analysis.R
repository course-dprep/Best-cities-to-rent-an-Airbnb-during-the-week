# Load the R-packages
library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(data.table)
library(ggplot2)
library(afex)
library(lmerTest)
library(postHoc)
library(afex)
library(car)
library(effectsize)
library(emmeans)

# Import the cleaned data 
setwd("~/GitHub/Best-cities-to-rent-an-Airbnb-during-the-week/src/data-preparation")
cleaned_dataset <- read_csv("cleaned_dataset.csv")
View(cleaned_dataset)

# Create dataset for analyses 
## Delete columns that are not needed for analyses
cleaned_dataset <- cleaned_dataset %>% select(-adjusted_price)
cleaned_dataset <- cleaned_dataset %>% select(-maximum_nights)
cleaned_dataset <- cleaned_dataset %>% select(-X.y)
cleaned_dataset <- cleaned_dataset %>% select(-listing_id)
cleaned_dataset <- cleaned_dataset %>% select(-available)
cleaned_dataset <- cleaned_dataset %>% select(-...1)
cleaned_dataset <- cleaned_dataset %>% select(-X.x)
cleaned_dataset <- cleaned_dataset %>% select(-date)

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

# Check assumptions ANOVA
# Randomly selecting 5000 rows from the dataset to investigate homoskedasticity and normality
data_airbnb_ANOVA <- sample_n(cleaned_dataset, 5000)
View(data_airbnb_ANOVA)

# Homoskedasticity
## city
leveneTest(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$city, data_airbnb_ANOVA$wDay), center=mean) 
leveneTest(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$united_states, data_airbnb_ANOVA$wDay), center=mean) 
leveneTest(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$europe, data_airbnb_ANOVA$wDay), center=mean)
leveneTest(price ~ city, data_airbnb_ANOVA, center=mean)

## roomtype
leveneTest(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$room_type, data_airbnb_ANOVA$wDay), center=mean)
leveneTest(price ~ room_type, data_airbnb_ANOVA, center=mean)

# Normality
shapiro.test(data_airbnb_ANOVA$price)

# One-way ANOVA's with wDay, room_type and city as independent variable and price as dependent variable
anova_1 <- aov(price ~ wDay, data_airbnb_ANOVA)
summary(anova_1)

anova_2 <- aov(price ~ room_type, data_airbnb_ANOVA)
summary(anova_2)

anova_3 <- aov(price ~ city, data_airbnb_ANOVA)
summary(anova_3)

# Effect size for the ANOVA's
eta_squared(anova_1, ci=0.95, partial = TRUE) 

eta_squared(anova_2, ci=0.95, partial = TRUE) 

eta_squared(anova_3, ci=0.95, partial = TRUE) 

# Moderation effect of city and room_type
## city
mod1 <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$city, data_airbnb_ANOVA$wDay))
summary(mod1)

## room_type
mod2 <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$room_type, data_airbnb_ANOVA$wDay))
summary(mod2)

# Tukey tests for moderation effect
TukeyHSD(mod1)
TukeyHSD(mod2)

# Effect size of the ANOVAs with moderation effect
eta_squared(mod1, ci=0.95, partial = TRUE) 
eta_squared(mod2, ci=0.95, partial = TRUE)

# Difference in average price between weekdays and weekend days in United States 
data_airbnb_ANOVA %>%
  filter(united_states == 'TRUE') %>%
  group_by(wDay) %>%
  summarize(mean_price = mean(price))

# Difference in average price between weekdays and weekend days in Europe
data_airbnb_ANOVA %>%
  filter(europe == 'TRUE') %>%
  group_by(wDay) %>%
  summarize(mean_price = mean(price))

# Difference between average price in weekend and during the week for cities in United States
data_airbnb_ANOVA %>%
  filter(united_states == 'TRUE') %>%
  group_by(city, wDay) %>%
  summarize(mean_price = mean(price))

# Difference between average price in weekend and during the week for cities in Europe
data_airbnb_ANOVA %>%
  filter(europe == 'TRUE') %>%
  group_by(city, wDay) %>%
  summarize(mean_price = mean(price))

# Create output directory 
dir.create(".../../gen/analysis/output/")

# Plot price over time
data_airbnb_ANOVA$wDay <- as.numeric(data_airbnb_ANOVA$wDay)
dt_price <- as.data.table(data_airbnb_ANOVA)
plot_price <- dt_price[, .(mean_price = mean(price)), 
                                     by = .(wDay, city)]


## WERKT NOG NIET
ggplot(data = plot_price, aes(x = city, y = mean_price)) +
  geom_line(aes(color = city, linetype = city)) +
  geom_point(aes(color = city, linetype = city)) +
  ggtitle("Change in price per city") +
  xlab("Cities") +
  ylab("Price") +
  ylim(0, 1000)
dev.off()


# Pogingen tot boxplots 
data_airbnb_ANOVA_uscities <- data_airbnb_ANOVA %>% filter(united_states == TRUE)

ggplot(data_airbnb_ANOVA_uscities, aes(x = day_num, y = price, color = city)) + geom_point()

ggplot(data_airbnb_ANOVA_uscities, aes(x = wDay, y = mean(price))) + geom_col() + facet_wrap(~ city)



ggplot(data_airbnb_ANOVA, aes(x = city, y = price))+ geom_bar()

ggplot(data_airbnb_ANOVA, 
       aes(city)) + 
  geom_bar(aes(y = price 
                 (..count..)/sum(..count..)*100)) + 
  ylab("percentage")
