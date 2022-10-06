all: ../../src/cleaned_data.csv


../../data/datafiles.txt: download_file.r
	R --vanilla < download_file.r

../../data/calender_data.csv ../../data/listing_data.csv: compiling_file.r ../../data/datafiles.txt 
	R --vanilla < compiling_file.r
	
../../src/cleaned_data.csv: cleaning_file.r ../../data/calender_data.csv ../../data/listing_data.csv
	R --vanilla < cleaning_file.r