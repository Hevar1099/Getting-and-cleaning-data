Getting and Cleaning Data - Project

This repository contains scripts and data for the "Getting and Cleaning Data" 
course project. The goal is to clean and analyze data from the UCI Human 
Activity Recognition Using Smartphones dataset, which includes sensor data from 
a smartphone.

Project Files

run_analysis.R:
This script merges the training and test datasets, extracts mean and 
standard deviation measurements, applies descriptive activity names, and calculates 
averages for each variable per activity and subject.
------------------------------------
CodeBook.md:
A brief explanation of the dataset, variables, and the data transformations performed.
------------------------------------
README.md:
This file, which provides an overview of the project and the scripts.
How It Works
------------------------------------
run_analysis.R:
Load libraries and data: Loads required libraries (dplyr, tidyr) 
and data files (X_train, Y_train, X_test, Y_test, etc.).

Rename columns: Sets descriptive column names for the sensor data using features.txt.

Merge datasets: Combines training and test datasets (X_train, Y_train, subject_train, etc.) 
into a single data frame.

Reshape data: Converts the dataset to long format, with features as Measurement
and their corresponding values in Measurement_value.

Activity labels: Replaces numeric activity labels with descriptive activity names.

Filter mean/std: Filters columns to keep only measurements related to 
mean and standard deviation.

Calculate averages: Groups data by activity, subject, and measurement, 
and calculates the average value for each combination.

Final Output
The final dataset (average_data) contains:

activity_name: Descriptive activity name (e.g., WALKING).
Measurement: Sensor feature name (e.g., "tBodyAcc-mean()-X").
Subject: Subject ID.
Average_value: Average of the measurement for each activity and subject.
How to Run the Script

Download and extract the dataset.
Set the working directory to the location of the data files.
Run run_analysis.R to generate the final tidy dataset with average values.
Dependencies

Required R packages:

dplyr
tidyr