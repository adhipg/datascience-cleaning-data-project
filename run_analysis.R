# Gets all the data and runs the analysis to create two files:
# 1. processedData.txt -> raw processed data.
# 2. tidy.txt -> summarised data (mean) by subject and activity.

# Step 0
########
# Setup
# location of the data with respect to the current working directory. Change
# this to . if run_analysis.R is in the same file as the data directory.
localPath <- "UCI HAR Dataset/"

# Step 1
########
# Merge the training and the test sets to create one data set
# 1. Import all the files of training set and merge them (X_train.txt,
#    Y_train.txt, subject_train.txt) to form a single data-set.
# 2. Import all the files of test set like step 1.
# 3. Merge the two data-sets into a single data set.

getCombinedDataSet <- function( dataType ) {
  dataX <- read.table(paste(localPath, dataType, "/X_", dataType, ".txt", sep=""))
  dataY <- read.table(paste(localPath, dataType, "/Y_", dataType, ".txt",
                            sep=""), col.names=c("activityId"))
  dataSubject <- read.table(paste(localPath, dataType, "/subject_", dataType, ".txt",
                            sep=""), col.names=c("subjectId"))
  dataSet <- cbind(dataX, dataY, dataSubject)
  dataSet
}

trainingData <- getCombinedDataSet('train')
testData <- getCombinedDataSet('test')
dataSet <- rbind(trainingData, testData)

# Step 2
########
# Extract only the measurements on the mean and standard deviation for each
# measurement.
# The col-names for the measurements are in features.txt
# Apart from the means and std, we also want to keep the subject and activityId
features <- read.table(paste(localPath, "features.txt", sep=""))
desiredFeatureCols <- grep("-(mean|std)\\(\\)", features[, 2])
desiredFeatures <- features[desiredFeatureCols, ]
# Add the column numbers for activityId and subjectId
desiredFeatureCols <- c(desiredFeatureCols, match("activityId", names(dataSet)),
                        match("subjectId", names(dataSet)))
# Subset the dataSet
dataSet <- dataSet[, desiredFeatureCols]

# Step 3
########
# Use descriptive activity names to name the activities in the data set
# The activity names are given in activity_labels.txt
activities <- read.table(paste(localPath, "activity_labels.txt", sep=""),
                         col.names=c("activityId", "activity_label"))
dataSet <- merge(dataSet, activities)
dataSet$activityId = NULL

# Step 4
########
# Appropriately labels the data set with descriptive variable names.
# Write tidy names to the desiredFeatures data.frame
desiredFeatures[, 2] <- gsub("^t", "Time", desiredFeatures[, 2])
desiredFeatures[, 2] <- gsub("^f", "Frequency", desiredFeatures[, 2])
desiredFeatures[, 2] <- gsub("-mean\\(\\)", "Mean", desiredFeatures[, 2])
desiredFeatures[, 2] <- gsub("-std\\(\\)", "StdDev", desiredFeatures[, 2])
desiredFeatures[, 2] <- gsub("-", "", desiredFeatures[, 2])
desiredFeatures[, 2] <- gsub("BodyBody", "Body", desiredFeatures[, 2])

niceColNames <- desiredFeatures[, 2]
niceColNames <- c(niceColNames, "Subject", "Activity")
colnames(dataSet) <- niceColNames

write.table(dataSet, "processedData.txt", sep="\t", row.name=FALSE)

# Step 5
#######
# From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

library(plyr)

tidySet <- ddply(dataSet, c("Subject", "Activity"), numcolwise(mean))
write.table(tidySet, "tidy.txt", sep="\t", row.name=FALSE)
# Return as the output
tidySet
