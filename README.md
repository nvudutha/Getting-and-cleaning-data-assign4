### Getting-and-Cleaning-Data-Week-4-Assignment
## This repo was created to finish the assignment for week 4 of Getting and Cleaning Data Coursera course.

# Step1: 
Download and unzip the data file into R working directory
# Step2:
Download the R source code "run_analysis.R" into R working directory
# Step3:
Execute R script "run_analysis.R" to generate tidy data file "tidydata.txt" in the R working directory
# Data description
The variables in the data X are sensor signals measured with waist-mounted smartphone from 30 subjects 
The variable in the data y indicates activity type on the subjects performed during recording
# Code explaination
The code combined training dataset and test dataset, and extracted required variables to create a new dataset with the averages of each variable for each activity for each subject
# New dataset
The new generated dataset contained variables calculated based on the mean and standard deviation 
Each row of the dataset is an average of each activity type for all subjects

The code was written based on the instruction of this assignment
Read training and test dataset into R environment
Read variable names into R envrionment 
Read subject index into R environment
Merges the training and the test sets to create one data set. Use command rbind to combine training and test set
Extracts only the measurements on the mean and standard deviation for each measurement. 
Uses grep command to get column indexes for variable name contains "mean()" or "std()"
Uses descriptive activity names to name the activities in the data set 
Converts activity labels to characters and add a new column as factor
Appropriately labels the data set with descriptive variable names and gives the selected descriptive names to variable columns
From the data set created in the previous step, creates a second, independent tidy data set with the average of each variable for each activity and each subject 
Uses write table command to create a new tidy dataset with command group_by and summarize_each in dplyr package