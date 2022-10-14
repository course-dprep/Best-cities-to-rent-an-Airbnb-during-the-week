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
library(effectsize)
library(emmeans)
install.packages("carData")
# Import the cleaned data 
setwd("~/GitHub/Best-cities-to-rent-an-Airbnb-during-the-week/src/data-preparation")
cleaned_dataset <- read_csv("cleaned_dataset.csv")
View(cleaned_dataset)

data_airbnb_ANOVA <- sample_n(cleaned_dataset, 5000)
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

# Moderation effect of city and room_type (Note: Loading the moderators will take some time)
## city
mod1 <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$city, data_airbnb_ANOVA$wDay))
summary(mod1)

mod2 <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$united_states, data_airbnb_ANOVA$wDay))
summary(mod2)

mod3 <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$europe, data_airbnb_ANOVA$wDay))
summary(mod3)

## room_type
mod4 <- aov(data_airbnb_ANOVA$price ~ interaction(data_airbnb_ANOVA$room_type, data_airbnb_ANOVA$wDay))
summary(mod4)

# Tukey tests for moderation effect
TukeyHSD(mod1)
TukeyHSD(mod2)
TukeyHSD(mod3)
TukeyHSD(mod4)

# Effect size of the ANOVAs with moderation effect
eta_squared(mod1, ci=0.95, partial = TRUE) 
eta_squared(mod2, ci=0.95, partial = TRUE)
eta_squared(mod3, ci=0.95, partial = TRUE)
eta_squared(mod4, ci=0.95, partial = TRUE)

# Average price per day for cities in United States 
data_airbnb_ANOVA %>%
  filter(united_states == 'TRUE') %>%
  group_by(weekdag) %>%
  summarize(mean_price = mean(price))

# Average price per day for cities in Europe
data_airbnb_ANOVA %>%
  filter(europe == 'TRUE') %>%
  group_by(weekdag) %>%
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