# Copy output from data-preparation into input folder 
# This step really depends no how files are shared across the different stages (e.g. if whole pipeline
# is on a single machine, could directly access output folder from prepaaration stage)
file.copy(from = "~/Desktop/dprep/Best-cities-to-rent-an-Airbnb-during-the-week/src/data-preparation/output/cleaned_dataset.csv", to = "~/Desktop/dprep/Best-cities-to-rent-an-Airbnb-during-the-week/src/analysis/cleaned_dataset.csv")
