###
## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each 
##    variable for each activity and each subject.
###
if (!require("reshape2")) {
    install.packages("reshape2")
}
require("reshape2")

if (!require("data.table")) {
    install.packages("data.table")
}
require("data.table")
#
training <- read.table("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE)
Y_train <-  read.table("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE)
S_train <- read.table("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
#
training <- cbind(training, Y_train, S_train)
Y_train <- NULL -> S_train

x <- dim(training)
message(sprintf("Loaded %d observations for %d training variables\n", x[1], x[2]))
#
testing <- read.table("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE)
Y_test <- read.table("UCI HAR Dataset/test//y_test.txt", sep="", header=FALSE)
S_test <- read.table("UCI HAR Dataset//test//subject_test.txt", sep="", header=FALSE)
#
testing <- cbind(testing, Y_test, S_test);
Y_test <- NULL -> S_test

x <- dim(testing)
message(sprintf("Loaded %d observations for %d testing variables\n", x[1], x[2]))
#
allData = rbind(training, testing)
#
# Read activity Labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)
#
# Read the features
features = read.table("UCI HAR Dataset/features.txt", sep="", header=FALSE)
features[ ,2] = gsub('-mean', 'Mean', features[ ,2])
features[ ,2] = gsub('-std', 'Std', features[ ,2])
features[ ,2] = gsub('[-()]', '', features[ ,2])
#
#
# Extract the measurements on the mean and standard deviation
colsNeeded <- grep(".*Mean.*|.*Std.*", features[ ,2])
#
# Only select those rows with mean and std
features <- features[colsNeeded, ] 
#
#add the last two columns Subject and Activity
colsNeeded <- c(colsNeeded, 562, 563)
# 
# Take only the columns needed
allData <- allData[ ,colsNeeded]
#
#Add the last to column names
colnames(allData) <- c(features$V2, "Activity", "Subject")
#
# Change to lower case all col names
colnames(allData) <- tolower(colnames(allData))
#
# Replace codes with Labels of Activity
for (i in activityLabels$V1) {
    allData$activity <- gsub(i, activityLabels$V2[i], allData$activity)
    i <- i + 1
}
#
allData$activity <- as.factor(allData$activity)
allData$subject  <- as.factor(allData$subject)
#
tidy <- aggregate(allData, by=list(activity = allData$activity, subject=allData$subject), mean)
#
# since mean of subject and activity has no meaning, removing the last two columns
tidy[ ,89] <- NULL -> tidy[ ,90]
#
print("Creating tidy dataset as tidy.txt...")
write.table(tidy, "tidy.txt", sep = "\t")
print("Done.")
