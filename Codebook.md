# Library required

```
dplyr
```

## CodeBook Description

This document is a codebook that provides descriptions of the variables, the data, and all transformations and work that I performed to clean up the data.

##The Data Source

Source data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Description of the dataset from the source website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## About the Script

The script performs the following activities
1. Merges the training and the test sets to create one data set
  - Read training data
  - Read testing data
  - Read the feature and activity label
  - Combining train and test files
  - Update the column names
  - Merging data into one data frame
2. Extracts only the measurements on the mean and standard deviation for each measurement
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Variables Used
1. Merges the training and the test sets to create one data set
* `x_train`, `y_train`, `subject_train`, `x_test`, `y_test`, `subject_test`, `features` and `activity_label` for storing file data
* `x_data`, `y_data`, `subject_data` and `final_data` for storing processed data

2. Extracts only the measurements on the mean and standard deviation for each measurement
* `mean_std_cols` to store columns with mean and std in name and `extracted_data` for storing the subset of data 

3. Uses descriptive activity names to name the activities in the data set
* `joined_data` for storing joined data

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
* `second_data_set` for storing the aggregate data
