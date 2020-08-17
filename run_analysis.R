library(dplyr)

# Set the correct working directory
setwd("C:/Users/10676/OneDrive/Reading/Coursera/Data Science Specialization/R Programming/Week 4/getting_and_cleaning_data")

# 1. Merges the training and the test sets to create one data set

# Read training data
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")

# Read testing data
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Reading the feature and activity label
features <- read.table("./UCI HAR Dataset/features.txt")
activity_label <- read.table("./UCI HAR Dataset/activity_labels.txt")

# Combining train and test files
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

# Update the column names
colnames(x_data) <- features[,2]
colnames(y_data) <- "Activity_ID"
colnames(subject_data) <- "Subject_ID"

# Merging data into one data frame
final_data <- cbind(x_data, y_data, subject_data)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement
mean_std_cols <- features$V2[grep("mean\\(\\)|std\\(\\)", features$V2)]
columns_to_select <- c(as.character(mean_std_cols), "Activity_ID", "Subject_ID")
extracted_data <- final_data[,columns_to_select]


# 3. Uses descriptive activity names to name the activities in the data set

# Update Activity Label column name
colnames(activity_label) <- c("Activity_ID", "Activity_Name")

joined_data <- merge(extracted_data, activity_label, by = "Activity_ID", all.x = TRUE)

# 4. Appropriately labels the data set with descriptive variable names.

names(extracted_data) <- gsub("^t", "time_", names(extracted_data))
names(extracted_data) <- gsub("^f", "freq_", names(extracted_data))
names(extracted_data) <- gsub("-", "_", names(extracted_data))
names(extracted_data) <- gsub("[()]", "", names(extracted_data))


# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

second_data_set <- aggregate(. ~Subject_ID + Activity_ID, extracted_data, mean)
second_data_set <- second_data_set[order(second_data_set$Subject_ID, second_data_set$Activity_ID),]

# Write results to file
write.table(second_data_set, file = "tidydata.txt", row.names = FALSE)