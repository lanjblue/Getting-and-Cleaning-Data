# Getting and Cleaning Data - Course Project

This is the course project for the Getting and Cleaning Data Coursera course. 

# This course project contain four files:

## README.md 
Description of the project and files.

## CodeBook.md
Description of the data set and data processing steps. 

## run_analysis.R

This R script does the following:

1. Loads subject, feature and activity data sets.  
2. Merges the training and the test sets to create one data set.
3. Extracts only the measurements on the mean and standard deviation for each measurement.
4. Uses descriptive activity names to name the activities in the data set
5. Labels the data set with descriptive variable names.
6. Creates independent tidy data set with the average of each variable for each activity and each subject.

## tidy.txt
The tidy dataset created by run_analysis.R.