all: ../../data/calender_data.csv ../../data/listing_data.csv

../../data/calender_data.csv ../../data/listing_data.csv: download_file.R
	R --vanilla < download_file.R

../../src/data-preperation/cleaned_dataset.csv: ../../data/calender_data.csv ../../data/listing_data.csv cleaning_file.R
	R --vanilla < cleaning_file.R

../../src/analysis/analysis.pdf: ../../cleaned_dataset.csv analysis_file.R
	R --vanilla < analysis_file.R

../../gen/output/report.pdf: 
