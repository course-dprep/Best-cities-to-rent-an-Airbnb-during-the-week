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
library(car)
library(effectsize)
library(emmeans)

# Import the cleaned data 
cleaned_dataset <- read_csv("cleaned_dataset.csv")

data_airbnb_ANOVA <- sample_n(cleaned_dataset, 5000)

# Homoscedasticity
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
anova_wDay_summary <- summary(anova_wDay)

# Save anova_wDay
capture.output(anova_wDay_summary, file = "../../gen/analysis/output/anova_wDay_summary.txt")

anova_room_type <- aov(price ~ room_type, data_airbnb_ANOVA)
anova_room_type_summary <- summary(anova_room_type)

# Save anova_room_type
capture.output(anova_room_type_summary, file = "../../gen/analysis/output/anova_room_type_summary.txt")

anova_city <- aov(price ~ city, data_airbnb_ANOVA)
anova_city_summary <- summary(anova_city)

# Save anova_city
capture.output(anova_city_summary, file = "../../gen/analysis/output/anova_city_summary.txt")

## room_type moderator
mod_room_type_wDay <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$room_type, data_airbnb_ANOVA$wDay))
mod_room_type_wDay_summary <- summary(mod_room_type_wDay)

# Save output
capture.output(mod_room_type_wDay_summary, file = "../../gen/analysis/output/mod_roomtype_wDay_interaction_results.txt")

# Effect size for the ANOVA's
eta_squared(anova_wDay, ci=0.95, partial = TRUE) 

eta_squared(anova_room_type, ci=0.95, partial = TRUE) 

eta_squared(anova_city, ci=0.95, partial = TRUE) 

# Moderation effect of city and room_type
## city
mod_city_wDay <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$city, data_airbnb_ANOVA$wDay))
mod_city_wDay_summary <- summary(mod_city_wDay)

# Save output
capture.output(mod_city_wDay_summary, file = "../../gen/analysis/output/mod_city_wDay_interaction_results.txt")

# Tukey tests for moderation effect
TukeyHSD(mod_room_type_wDay)
TukeyHSD(mod_city_wDay)

# Effect size of the ANOVAs with moderation effect
eta_squared(mod_room_type_wDay, ci=0.95, partial = TRUE) 
eta_squared(mod_city_wDay, ci=0.95, partial = TRUE)

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
