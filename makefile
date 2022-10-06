all: ../../data/calender_data.csv ../../data/listing_data.csv

../../data/calender_data.csv ../../data/listing_data.csv: download_file.r
	R --vanilla < download_file.r

../../src/data-preperation/cleaned_dataset.csv: ../../data/calender_data.csv ../../data/listing_data.csv cleaning_file.R
	R --vanilla < cleaning_file.R

../../src/analysis/analysis.pdf: ../../cleaned_dataset.csv analysis_file.R
	R --vanilla < analysis_file.R

../../gen/output/report.pdf: 

clean:
	R -e "unlink('../../data/*.*', recursive = TRUE)"