# Reading the files
X_train <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/X_train.txt')
Y_train <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/Y_train.txt')

X_test <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/X_test.txt')
Y_test <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/Y_test.txt')

activity_labels <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/activity_labels.txt')
features_labels <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/features.txt')

subject_train <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/subject_train.txt')
subject_test <- read.table('~/Desktop/Getting-and-Cleaning-Data-Course-Project/Raw Data/subject_test.txt')

names(subject_test) <- c('Subject')
names(subject_train) <- c('Subject')

#---------------------------------------------------#

library(dplyr)
library(tidyr)

# Labeling and merging both data frames
colnames(X_train) <- features_labels$V2
colnames(X_test) <- features_labels$V2

train_data <- cbind(X_train, Y_train)
test_data <- cbind(X_test, Y_test)

train_data <- cbind(train_data, subject_train)
test_data <- cbind(test_data, subject_test)

final_data_merged <- rbind(test_data, train_data)

long_data <- final_data_merged %>%
    pivot_longer(cols = -c(V1, Subject),
        values_to = 'Measurement_value',
        names_to = 'Measurement')

long_data <- as.data.frame(long_data)

# Replace activity labels with descriptive names
long_data$activity_name <- factor(long_data$V1, levels = activity_labels$V1, labels = activity_labels$V2)
# Cleaning the column names to not contain _
long_data <- rename(long_data, 'activityName' = activity_name, 'MeasurementValue' = Measurement_value) 

long_data
#------------------------------------------------#
clean_data <- long_data %>%
    select(-V1)

# Filter for mean and standard deviation measurements
filtered_data <- clean_data %>%
    filter(grepl('mean|std', Measurement, ignore.case = TRUE))

filtered_data

# Calculate average of each variable for each activity and each subject
average_data <- filtered_data %>%
    group_by(activityName, Measurement, Subject) %>%
    summarise(AverageValue = mean(MeasurementValue))

average_data <- as.data.frame(average_data)
average_data




# Save the first data frame
write.table(long_data, "first tidy data", sep = "\t", row.names = FALSE)

# Save the second data frame
write.table(average_data, "second tidy", sep = "\t", row.names = FALSE)

install.packages("R.utils")
library(R.utils)
setwd('~/Desktop/Getting-and-Cleaning-Data-Course-Project/')

# Compress your file using gzip
gzip("first tidy data", destname = "first_tidy_data.txt.gz")

gzip("X_train.txt", destname = "X_train.txt.gz")

gzip('second tidy data', destname = 'second_tidy_data.gz')


