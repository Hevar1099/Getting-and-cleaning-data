Overview
This code book provides a summary of the variables, transformations, and 
steps taken in the data cleaning process. The final tidy dataset contains the 
average of each measurement for each activity and subject.

Variables
X_train and X_test:
Sensor data for training and testing, containing 561 features 
(accelerometer and gyroscope measurements).
------------------------------------
Y_train and Y_test:
Activity labels (numeric codes) corresponding to each row in X_train and X_test.
------------------------------------
activity_labels:
Maps numeric activity codes to descriptive names (e.g., WALKING, WALKING_UPSTAIRS).
------------------------------------
features_labels:
Names of the 561 features (sensor measurements).
------------------------------------
subject_train and subject_test:
Subject IDs corresponding to each observation in the training and test data.
------------------------------------
Data Cleaning and Transformation Steps
Reading Data:
Raw data files are read and stored in respective data frames.
Renaming Columns:
Column names of X_train and X_test are updated using features_labels.
Merging Data:
X_train, Y_train, and subject_train are merged into a single training dataset (train_data).
Similarly, X_test, Y_test, and subject_test are merged into test_data.
------------------------------------
Long Format Transformation:
The merged data (final_data_merged) is reshaped into long format using pivot_longer(), where each feature becomes a Measurement and its value is in the Measurement_value column.
Adding Descriptive Activity Names:
Numeric activity codes are replaced with descriptive names using activity_labels.
------------------------------------
Filtering for Mean and Std:
Only measurements related to mean and standard deviation are 
retained by filtering the Measurement column.
------------------------------------
Calculating Averages:
The average value of each measurement is calculated for each 
activity and subject using group_by() and summarise().
------------------------------------
Final Dataset
The final tidy dataset, average_data, contains the following columns:
------------------------------------
activityName: Descriptive activity name.
Measurement: Sensor feature name.
Subject: Subject ID.
AverageValue: Average value of the feature for each activity and subject.
