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
anova_wDay <- aov(price ~ wDay, data_airbnb_ANOVA)
summary(anova_wDay)

# Save anova_wDay
write.csv(anova_wDay, file = "../../gen/analysis/output/anova_wDay_output.csv", fileEncoding = "UTF-8", row.names=FALSE)

anova_room_type <- aov(price ~ room_type, data_airbnb_ANOVA)
summary(anova_room_type)

# Save anova_room_type
write.csv(anova_room_type, file = "../../gen/analysis/output/anova_room_type_output.csv", fileEncoding = "UTF-8", row.names=FALSE)

anova_city <- aov(price ~ city, data_airbnb_ANOVA)
summary(anova_city)

# Save anova_city
write.csv(anova_city, file = "../../gen/analysis/output/anova_city_output.csv", fileEncoding = "UTF-8", row.names=FALSE)

## room_type
mod_room_type_wDay <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$room_type, data_airbnb_ANOVA$wDay))
summary(mod_room_type_wDay)

# Save anova_city
write.csv(mod_room_type_wDay, file = "../../gen/analysis/output/mod_room_type_wDay.csv", fileEncoding = "UTF-8", row.names=FALSE)


# Effect size for the ANOVA's
eta_squared(anova_1, ci=0.95, partial = TRUE) 

eta_squared(anova_2, ci=0.95, partial = TRUE) 

eta_squared(anova_3, ci=0.95, partial = TRUE) 

# Moderation effect of city and room_type
## city
mod_city_wDay <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$city, data_airbnb_ANOVA$wDay))
summary(mod_city_day)

# Save anova_city
write.csv(mod_city_wDay, file = "../../gen/analysis/output/mod_city_wDay.csv", fileEncoding = "UTF-8", row.names=FALSE)


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

data_airbnb_ANOVA_uscities <- cleaned_dataset %>% filter(united_states == TRUE)
data_airbnb_ANOVA_uscities$wDay <- as.numeric(data_airbnb_ANOVA_uscities$wDay)
dt_price_uscities <- as.data.table(data_airbnb_ANOVA_uscities)
plot_price_uscities <- dt_price_uscities[, .(mean_price = mean(price)), 
                                         by = .(wDay, city)]

data_airbnb_ANOVA_eucities <- cleaned_dataset %>% filter(united_states == FALSE)
data_airbnb_ANOVA_eucities$wDay <- as.numeric(data_airbnb_ANOVA_eucities$wDay)
dt_price_eucities <- as.data.table(data_airbnb_ANOVA_eucities)
plot_price_eucities <- dt_price_eucities[, .(mean_price = mean(price)), 
                                         by = .(wDay, city)]

#Barplot United States 
ggplot(plot_price_uscities, aes(x = wDay, y =mean_price)) + geom_bar(stat = "identity") + facet_wrap(~ city) 
ggsave(filename = "../../gen/analysis/output/plot_us_cities.png", width = 15, height = 6, dpi = 100, units = "cm")

#Barplot Europe
ggplot(plot_price_eucities, aes(x = wDay, y =mean_price)) + geom_bar(stat = "identity") + facet_wrap(~ city)
ggsave(filename = "../../gen/analysis/output/plot_eu_cities.png", width = 15, height = 6, dpi = 100, units = "cm")
