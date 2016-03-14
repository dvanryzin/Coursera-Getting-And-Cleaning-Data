# Data Science Specialization
# Getting And Cleaning Data 2016
# Final Project

# Initialize the working directory
setwd("./GettingAndCleaningData/Project")

# Read in the csv files containing the training set
trainingSet = read.csv("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE) 
trainingSet[,562] = read.csv("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE) 
trainingSet[,563] = read.csv("./getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE) 

# Read in the csv files containing the test data
testSet = read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE) 
testSet[,562] = read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE) 
testSet[,563] = read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE) 

# Get the activity labels
activityLabels = read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE) 
 
# Read in the feature set and modify their names to make them more understandable 
featureSet = read.csv("getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt", sep="", header=FALSE) 
featureSet[,2] = gsub('-mean', 'Mean', featureSet[,2]) 
featureSet[,2] = gsub('-std', 'Std', featureSet[,2]) 
featureSet[,2] = gsub('[-()]', '', featureSet[,2]) 
 
# Merge the training and test sets together by row 
finalData = rbind(trainingSet, testSet) 
 
# Determine the columns containing mean and standard deviation data 
colsToKeep <- grep(".*Mean.*|.*Std.*", featureSet[,2])

# Keep only the columns in the featureSet table that we want to retain 
featureSet <- featureSet[colsToKeep,] 

# Add the the subject and activity columns at the end 
colsToKeep <- c(colsToKeep, 562, 563) 

# And remove the unwanted columns from finalData 
finalData <- finalData[,colsToKeep] 

# Setup the column names using the featureSet in finalData 
colnames(finalData) <- c(featureSet$V2, "Activity", "Subject") 
colnames(finalData) <- tolower(colnames(finalData)) 

# Tidy up label names
currentActivity = 1 
for (currentActivityLabel in activityLabels$V2) { 
  finalData$activity <- gsub(currentActivity, currentActivityLabel, finalData$activity) 
  currentActivity <- currentActivity + 1 
} 
 
finalData$activity <- as.factor(finalData$activity) 
finalData$subject <- as.factor(finalData$subject) 

# Summarize the data
tidyDataSet = aggregate(finalData, by=list(activity = finalData$activity, subject=finalData$subject), mean)

# Remove the subject and activity columns because taking their mean does not make sense 
tidyDataSet[,90] = NULL 
tidyDataSet[,89] = NULL

# Write the tidy data set to the output file
write.table(tidyDataSet, "tidyDataSet.txt", sep="\t") 
