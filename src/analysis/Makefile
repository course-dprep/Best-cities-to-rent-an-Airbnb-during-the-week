AOUTPUT = ../../gen/analysis/output

all: $(AOUTPUT)/anova_wDay_output.csv $(AOUTPUT)/anova_room_type_output.csv $(AOUTPUT)/anova_city_output.csv $(AOUTPUT)/plot_us_cities $(AOUTPUT)/plot_eu_cities

$(AOUTPUT)/anova_wDay_output.csv $(AOUTPUT)/anova_room_type_output.csv $(AOUTPUT)/anova_city_output.csv $(AOUTPUT)/plot_us_cities $(AOUTPUT)/plot_eu_cities: analyze.R ../data-preparation/cleaned_dataset.csv
	R --vanilla < analyze.R