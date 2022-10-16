AOUTPUT = ../../gen/analysis/output

all: $(AOUTPUT)/plot_eu_cities.png

$(AOUTPUT)/plot_eu_cities.png: analyze.R ../data-preparation/cleaned_dataset.csv
	R --vanilla < analyze.R