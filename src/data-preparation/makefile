all: ../../src/cleaned_dataset.csv


../../data/datafiles.txt: download_file.r
	R --vanilla < download_file.r

../../data/datafiles1.txt: compiling_file.r ../../data/datafiles.txt 
	R --vanilla < compiling_file.r
	
../../src/cleaned_dataset.csv: cleaning_file.r ../../data/datafiles1.txt
	R --vanilla < cleaning_file.r