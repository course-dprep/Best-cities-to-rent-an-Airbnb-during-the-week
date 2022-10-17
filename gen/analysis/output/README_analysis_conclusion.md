
# **Analysis & interpretation**

## **Checking the assumptions ANOVA**
The homogeneity of variance, normality of the distribution, and independence of observations are three assumptions that need to be verified in order to determine whether an ANOVA analysis can be conducted. A random sample of 5000 observations for this evaluation was generated. 

**Homogeneity of variance**\
*City*\
For the interaction effect between wDay and city, it can be concluded that there are no equal variances in , since the Levene’s Test gives a p-value that is lower 0.05. Also for the direct effect of the city on price, the Levene’s test gives a p-value below 0.05. 


*Room type*\
Also for the interaction effect between wDay and room_type, it can be concluded that there are no equal variances in , since the Levene’s Test gives a p-value that is lower 0.05. Also for the direct effect of room_type on price, the Levene’s test gives a p-value below 0.05. 

As a result, the homogeneity is violated. However, this is not a problem for conducting and interpreting the ANOVA analyses since there is a large sample size used.

**Normality of the distribution**\
From the Shapiro Wilk normality test we can conclude that the variable in the sample is not normally distributed, since it has a smaller p-value than 0.05. As a result, the normality is violated for all variables, however, this is not a problem for conducting and interpreting the ANOVA analyses since there is a large sample size used.

**Independence of observations**\
When the sample is chosen at random, the experiment is set up properly and therefore the independence of observations can be achieved.  The function ‘sample_n’ is used to collect 5000 random observations in a new data frame. Therefore, the ANOVA analyses can be conducted.

## **ANOVA Analyses**
There have been several ANOVA analyses conducted to address the research question *“to what extent does the day of the week (weekday vs. weekend) impact pricing of Airbnb? And does this significantly differ per room type, and does this significantly differ between the cities (top 5 cities U.S. vs. top 5 cities Europe)?”*

In this section, short descriptions of the findings are given.

- **ANOVA price and wDAY**\
From the ANOVA it can be concluded that there is no significant relationship between the variable wDay and price (p = 0.811)(anova_wDay_summary.txt). This means that there is no significant difference between weekdays and weekend days on the price. 
- **ANOVA price and room_type**\
From the ANOVA it can be concluded that there is a significant relationship between the variable room_type and price (p<0,001)(anova_room_type_summary.txt). This means that there is a significant difference between the different room types on the price. To get more insights about the size of the effect, there is a test conducted, to know the eta squared. The eta squared is very low, so from that it can be concluded that the effect is very small. 
- **ANOVA price and city**\
From the ANOVA it can be concluded that there is a significant relationship between the variable city and price (p<0,001)(anova_city_summary. This means that there is a significant difference between the different cities on the price. To get more insights about the size of the effect, there is a test conducted, to know the eta squared. The eta squared is 0.02, which means that there is a small to medium effect.
- **ANOVA with interaction room_type*wDay**\
From the ANOVA with the interaction effect between room_type and wDay on price, the conclusion is that there is a significant relationship between this interaction variable and the price, since the p-value is very low (p < 0,001)(mod_roomtype_wDay_interaction_results.txt).  This leads to the conclusion that the difference in the effect of weekdays vs. weekend days on price, depends on the room type. However, this effect is not very big, since the eta squared is very low. To get more insights in the difference in room_types, a Tukey test was performed. From the results it can be concluded that the price for shared and private rooms is much lower. The price for a hotel room and an entire home/apartment have the highest price. 
- **ANOVA with interaction city*wDay**\
From the ANOVA with the interaction between city and wDay, the conclusion is that there is a significant relationship between this interaction variable and the price (mod_city_wDay_interaction_results.txt). This leads to the conclusion that the effect of the wDay on the price did significantly differ between different cities. However, this effect is very small since the eta squared is 0.02. To get more insights a Tukey test was performed. It can be concluded from this test that the price of the US city San Francisco and the price of the European city Milan are the highest. 
- **Difference in price Wday in U.S.**\
The average price of Airbnb’s during the week for cities in the United States is 285. This average price does not differ from weekend days. So with this it can be concluded that the price for cities in the United States does not differ across weekend days and weekdays. 
- **Difference in price Wday Europe**\
The average price of Airbnb’s during the week for cities in Europe is 186. This average price is slightly higher than the average price for weekend days. The average price for Airbnb’s on weekdays in Europe is namely 175. So there is a small difference between the price on the weekend and during the week.
- **Differences between weekends and weekdays visualized**\
![plot_eu_cities](https://user-images.githubusercontent.com/111459511/196128650-7cb88d6b-fdf4-42c5-9bf9-1c4b41a71ca4.png)
![plot_us_cities](https://user-images.githubusercontent.com/111459511/196128706-0f1932de-9004-4f6d-8d69-722a23f89212.png)




