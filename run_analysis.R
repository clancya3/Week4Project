ibrary(dplyr)

#reading in test data

setwd("C:/Users/kevin/Desktop/Coursera/Getting and Cleaning Data/Week 4")

x_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
x_test <- tbl_df(x_test) #easier to read
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
sub_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

#reading in training data
x_train <-read.table("./data/UCI HAR Dataset/train/X_train.txt")
x_train <- tbl_df(x_train) #easier to read
y_train <- read.table("./data/UCI HAR Dataset/train/Y_train.txt")
sub_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")

#reading in data description
var_names <- read.table("./data/UCI HAR Dataset/features.txt")

#reading in activity labels
act_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
colnames(act_labels) <- c("ActivityID", "Activity") #labeling activities dataset

#merging the activity and subject reference tables for the training and test sets
mergeactivity <- rbind(y_test, y_train)
colnames(mergeactivity) <- "ActivityID"
mergesubjects <- rbind(sub_test, sub_train)
colnames(mergesubjects) <- "subjectID"

#1. Merges the training and the test sets to create one data set.
x_total <- rbind(x_test, x_train)

#4. Appropriately labels the data set with descriptive variable names.
colnames(x_total) <- var_names[,2] #giving variables names

y_total <- rbind(y_test, y_train)


#merging the dataset with training/test activity ids and test ids
Merged_labels <- cbind(mergesubjects, mergeactivity, x_total)


#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#finding columns with mean or std
selectedcolumns <- grepl("mean|std|ActivityID|subjectID",names(Merged_labels))

#create dataset with columns that have mean or std
selecteddata <- Merged_labels[,selectedcolumns]


#3. Uses descriptive activity names to name the activities in the data set

data_labeled <- merge(selecteddata, act_labels, by = "ActivityID")

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#this says to take all the variables (.) and group them by Subject ID + Activity (~SubjectID + Activity) in the data_labeled dataset, apply the mean function

Tidy_Data <- aggregate(. ~ subjectID+Activity, data_labeled, mean)
Tidy_Data <-arrange(Tidy_Data, subjectID) 