## Creating the test set

subject_test <- read.table("subject_test.txt")
names(subject_test) <- "subject"

y_test <- read.table("y_test.txt")
names(y_test) <- "activity"

features <- read.table("features.txt", stringsAsFactors=FALSE)
features <- subset(features, select="V2")

X_test <- read.table("X_test.txt")
names(X_test) <- features$V2

merged_test <- cbind(subject_test, X_test, y_test)
dim(merged_test)

### Reading in the activity labels:

activity_labels <- read.table("activity_labels.txt")

## Creating the training set

subject_train <- read.table("subject_train.txt")
names(subject_train) <- "subject"

y_train <- read.table("y_train.txt")
names(y_train) <- "activity"

X_train <- read.table("X_train.txt")
names(X_train) <- features$V2
 
merged_train <- cbind(subject_train, X_train, y_train)
dim(merged_train)

## Creating the merged Test and Train dataset

mergedTestTrain <- rbind(merged_train, merged_test)
dim(mergedTestTrain)


### Checking to see if the merged dataframe looks ok with spot tests
### - emphasis on activity label

mergedTestTrain[1:2, 560:563]
mergedTestTrain[2000:2002, 560:563]
class(mergedTestTrain$activity)

### Contents of column 'subject' in the merged dataframe renamed
### for easier reading

mergedTestTrain$activity[mergedTestTrain$activity==1] <- "WALKING"
mergedTestTrain$activity[mergedTestTrain$activity==2] <- "WALKING UPSTAIRS"
mergedTestTrain$activity[mergedTestTrain$activity==3] <- "WALKING DOWNSTAIRS"
mergedTestTrain$activity[mergedTestTrain$activity==4] <- "SITTING"
mergedTestTrain$activity[mergedTestTrain$activity==5] <- "STANDING"
mergedTestTrain$activity[mergedTestTrain$activity==6] <- "LAYING"
 
class(mergedTestTrain$activity)


### Selecting all columns that contain 'mean' or 'standard deviation' data

mergedTestTrainMean <- mergedTestTrain[, grep("mean()", names(mergedTestTrain), fixed="TRUE")]
mergedTestTrainStd <- mergedTestTrain[, grep("std()", names(mergedTestTrain), fixed="TRUE")]

### Appending the 'subject' & 'Activity' columns and creating a dataframe
### This the first 'tidy data' containing all means and stds with subject and activity

mergedTestTrainSubject <- subset(mergedTestTrain, select="subject")
mergedTestTrainActivity <- subset(mergedTestTrain, select="activity")
MeanStdSet <- cbind(mergedTestTrainSubject, mergedTestTrainMean, mergedTestTrainStd, mergedTestTrainActivity)

### Checking dimensions & names

dim(MeanStdSet)
names(MeanStdSet)

## Creating the average of each variable for each activity and each subject

AvgMeanStdSet <- melt(MeanStdSet, id.vars=c("subject","activity"))
AvgMeanStdSet <- dcast(AvgMeanStdSet, subject+activity~variable, mean)

## Checking the dimensions of the new dataset and viewing portion of data
dim(AvgMeanStdSet)
AvgMeanStdSet[1:6, 1:5]
