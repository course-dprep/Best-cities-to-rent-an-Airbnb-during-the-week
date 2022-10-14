# **Data exploration & preparation**

## **1. Data exploration**
### **1.1 Explore raw data using summary statistics**
From the summary statisitcs the following results can be derived:

**Statics observations per continent**  
The original dataset (raw data) contains 6,338,415 observations divided over two continents: United States and Europe. 

<img width="382" alt="image" src="https://user-images.githubusercontent.com/112823109/195710636-a9daf707-41f4-4080-b9d6-dd4a0e443c7e.png">

\
\
The original dataset contains 3,839,056 observations in Europe. The observations of Europe are spread over 5 different cities.  
<img width="408" alt="image" src="https://user-images.githubusercontent.com/112823109/195709885-a2e3e04f-a104-484e-834a-8bd4c70776b4.png">

<img width="414" alt="image" src="https://user-images.githubusercontent.com/112823109/195711444-7035bc18-1318-4eac-a452-9ce93e934cfa.png">

\
\
The original dataset contains 2,499,359 observations in the United States. The observations of the United Statesare spread over 5 different cities.  
<img width="413" alt="image" src="https://user-images.githubusercontent.com/112823109/195712388-2cc15f1b-ad41-4c7b-b3b6-862f8182f596.png">

<img width="362" alt="image" src="https://user-images.githubusercontent.com/112823109/195716651-271eb128-6bf5-4593-bb46-fdeac1b0572d.png">

### **1.2 Detect the origin of missing values**
The missing values are checked via the code: colSums(is.na(cleaned_dataset)). The output indicated that there were no missing values (NAs). This was also expected, because Airbnb data is generated automatically. People who rent out their home or apartment on Airbnb do not have to enter any information by themselves.

## **2. Data preparation**
### **2.1 Create new variables as reference to short term stays** 

As the data is collected per day with different duration, a new variable named "short_term_stays" is created. With this new variable, only stays with minimum nights stay of 1, 2, 3 or 4 are showed.

### **2.2 Delete unnecessary columns** 
As this research focuses on the main question *"To what extent does the day of the week (weekday vs. weekend) impact pricing of Airbnb? And does this significantly differ per room type, and does this significantly differ between the cities (top 5 cities U.S. vs. top 5 cities Europe)?"*, some variables in the original dataset might not be needed to come to an answer. For that reason only the following variables are kept in the dataset to maintain a clear overview of the variables needed for this research:

- **weekdag**: Monday, Tuesday, Wednesday, Thursday, Friday, Saturday, Sunday
- **wDay**: computed variable of weekdays (Monday, Tuesday, Wednesday, Thursday, Sunday) vs. weekend (Friday, Saturday)
- **short_term_stays**: 1, 2, 3 or 4 nights
- **room_type**: Private room, entire home/ apartment, shared room or hotel
- **city**: city in which the Airbnb is listed → Top 5 most popular Airbnb cities in the U.S. and top 5 most popular Airbnb cities in Europe 
- **united_states**: Portland, San-Francisco, Denver, Los Angeles, New-York
- **europe**: Munich, Milan, Paris, London, Dublin
- **price**: this is the price of the room type on a random day during the week or during the weekend
- **date**: the date is used to check if which price the hosts asks on a certain date

### **2.3 Chang the variable "price" to numeric** 
The data exploration revealed that the variable "price" in this data is imported as a character. For further analysis, the variable "price" must be converted to a numeric value. Before this could be done, the dollar sign and comma for prices greater than a thousand had to be removed.

### **2.4 Chang the variable "price" to numeric** 
From the statistics (boxplots and ggplots) used to detect outliers, it was observed that there are a few cases in which outliers seem to exist.


**Outliers within the variable "minimum_nights"**\
From the boxplot it is observed that there are 26 extreme outliers, which have a minimum stay of 9999 nights. All these outliers are from one listing ID. This is remarkable because the mean including this outlier is 33,7. By filtering on “minimum_nights” below 5, it is observed that 3,791.936 observations have the possibility of a short term stay. 

**Outliers within the variable "price"**\
The boxplot shows that there are some cases for which the price is €0.00. There are 1525 outliers which have a price of €0.00 per night. The data indicates that it is about observations of which multiple have the same id, but relate to different days during the week.

Only 0.02% of the dataset are outliers, which is in perspective very small, and will therefore not have any impact on the results of the dataset.

## **3. After cleaning**
The cleaned dataset (cleaned_dataset) contain approximately 6 million observations and 10 variables to work with. The cleaned dataset contains information on 10 different cities.
