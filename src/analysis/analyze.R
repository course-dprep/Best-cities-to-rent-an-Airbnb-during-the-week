# Read cleaned dateset 
cleaned_dataset <- read.csv("cleaned_dataset.csv")

summarize(cleaned_dataset)

table(cleaned_dataset$room_type)

# Estimate model 1 --> Dit stond in de template
m1 <- lm(V1 ~ V3 + V4,df_cleaned)

# Estimate model 2--> Dit stond in de template
m2 <- lm(V1 ~ V3 + V4 + V5 , df_cleaned)

# Wij dachten wellicht meerdere ANOVA's runnen om significante verschillen te indiceren. 

# Onderlinge verschillen tussen steden, tussen europa en US en evt. verschil tussen de verschillen (e.g., in europa verschilt het zoveel... en us verschilt het zoveel.. is het verschil tussen die 2 verschillen een significant verschil)

# Save results
save(m1,m2,file="./gen/analysis/output/model_results.RData")