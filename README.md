# Getting and Cleaning Final

## Description
This [project](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project) is the final assignment in the 4-week Coursera Course on Getting and Cleaning Data. The purpose is to test the students accumulated knowledge of working with data using the R programming language. A dataset is given with these instructions

You should create one R script called run_analysis.R that does the following.

1. Merges the training and the test sets to create one data set.
1. Extracts only the measurements on the mean and standard deviation for each measurement.
1. Uses descriptive activity names to name the activities in the data set
1. Appropriately labels the data set with descriptive variable names.
1. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.` 
    

## Running the script
The script 'run_analysis.R' is contained at the top level of this repository. To run it from the command line do the following:

`r -f run_analysis.R`

The script will retrieve the data set. Then it will unzip the dataset. Finally it will process the data as described in CodeBook.md and output the tidy datasets as files (tidy.txt and tidy2.txt).