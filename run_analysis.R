library(dplyr)

####### 1. Merge the training and test data sets to create one dataset
## 1.1 read training data
X_train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
Y_train_data <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
## 1.2 read test data
X_test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
Y_test_data <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
## 1.3 now, merge the training and test data to one dataset
X_TRAIN_TEST_MERGED <- rbind(X_train_data, X_test_data)
Y_TRAIN_TEST_MERGED <- rbind(Y_train_data, Y_test_data)
subject_TRAIN_TEST_MERGED <- rbind(subject_train, subject_test)

####### 2. Extract only the measurements on the mean and standard deviation for each measurement
## 2.1 capture the variable names from the features.txt
variable_names <- read.table("./UCI HAR Dataset/features.txt")
## 2.2 capture the activity lables from the activity_labels.txt
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
## 2.3 create a required variable vector with only the required measurements
required_variables <- variable_names[grep("mean\\(\\)|std\\(\\)",variable_names[,2]),]
X_TRAIN_TEST_MERGED <- X_TRAIN_TEST_MERGED[,required_variables[,1]]

###### 3. Use descriptive activity names to name the activities in the data set
colnames(Y_TRAIN_TEST_MERGED) <- "activity"
Y_TRAIN_TEST_MERGED$activitylabel <- factor(Y_TRAIN_TEST_MERGED$activity, labels=as.character(activity_labels[,2]))
activitylabel <- Y_TRAIN_TEST_MERGED[,-1]

###### 4. Appropriately label the data set with descriptive variable names
colnames(X_TRAIN_TEST_MERGED) <- variable_names[required_variables[,1],2]

###### 5. From the above step, create a second independent tidy data set with the average of each variable, for each activity and for each subject
colnames(subject_TRAIN_TEST_MERGED) <- "subject"
total <- cbind(X_TRAIN_TEST_MERGED, activitylabel, subject_TRAIN_TEST_MERGED)
total_mean <- total %>% group_by(activitylabel, subject) %>% summarize_all(funs(mean))
## create tidy data set
write.table(total_mean, file="./tidydata.txt", row.names=FALSE, col.names=TRUE)

