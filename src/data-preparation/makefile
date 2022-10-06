all: ../../data/datafiles.txt ../../data/calender_data.csv ../../data/listing_data.csv


../../data/datafiles.txt: download_file.r
	R --vanilla < download_file.r

../../data/calender_data.csv ../../data/listing_data.csv: compiling_file.r
	R --vanilla < compiling_file.r