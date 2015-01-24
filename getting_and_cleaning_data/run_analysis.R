#  analysis of accelerometer data from smartphones
#
#  see README.md for more info

# these are the R libraries required for this script
library(plyr)
library(reshape2)

# IMPORTANT: script assumes that data has been downloaded and
# unzipped to the working directory, which should give you a
# subdir named ./accData.  edit the line below to insure that
# the working directory for the script is the directory where
# this accData dir is located

setwd("F:/coursera/3 Getting and Cleaning Data/course project")

########## process raw data ##########

# read various files to tables
activities <- read.table("./accData/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./accData/UCI HAR Dataset/features.txt")

testXData <- read.table("./accData/UCI HAR Dataset/test/X_test.txt")
testYData <- read.table("./accData/UCI HAR Dataset/test/Y_test.txt")
testSubjects <- read.table("./accData/UCI HAR Dataset/test/subject_test.txt")

trainingXData <- read.table("./accData/UCI HAR Dataset/train/X_train.txt")
trainingYData <- read.table("./accData/UCI HAR Dataset/train/Y_train.txt")
trainingSubjects <- read.table("./accData/UCI HAR Dataset/train/subject_train.txt")

# give some meaningful names to these data frames
colnames(activities) <- c("activityID","activity")
colnames(testSubjects) <- "subjectID"
colnames(testYData) <- "activityID"
colnames(testXData) <- features$V2
colnames(trainingSubjects) <- "subjectID"
colnames(trainingYData) <- "activityID"
colnames(trainingXData) <- features$V2

# add identifier to subjects tables indicating dataset source
testSubjects$dataSet <- "test"
trainingSubjects$dataSet <- "train"

# add activity name to YData
testYData$activity <- mapvalues(testYData$activityID,
                        from=activities$activityID,
                        to=as.character(activities$activity))
trainingYData$activity <- mapvalues(trainingYData$activityID,
                            from=activities$activityID,
                            to=as.character(activities$activity))

########## data summarization ##########

# extract only mean and std dev measures from X data
varsToExtract <- grep("mean()|std()",names(testXData))
testXData <- testXData[,varsToExtract]
varsToExtract <- grep("mean()|std()",names(trainingXData))
trainingXData <- trainingXData[,varsToExtract]

# combine data sets
testData <- cbind(testSubjects,testYData,testXData)
trainingData <- cbind(trainingSubjects,trainingYData,trainingXData)
# and now the total data set
allData <- rbind(testData,trainingData)

# write out the appropriate table.  note that if all you are
# interested in is one of the subsets, just change 'allData" to
# either 'testData' or 'trainingData' in the line below
write.csv(allData, "allData.csv", row.names=FALSE)

########## create summary table ##########

# remove cols we don't need for this tabulation
allData$dataSet <- NULL
allData$activityID <- NULL
# create output table of means by subject by activity
outputMelt <- melt(allData,id=c("subjectID","activity"))
output <- dcast(outputMelt,subjectID + activity ~ variable, mean)
# write it out
write.csv(output,"means_by_subject_by_activity.csv",
          row.names=FALSE)
