## Task:
## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately label the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Notes:
## Data is located inside project folder in the "UCI HAR Dataset" folder
  library(plyr)

  rootPath <- "UCI HAR Dataset"
  trainPath <- "UCI HAR Dataset/train"
  testPath <- "UCI HAR Dataset/test"
    
  ## read the features, convert to char vector and make names valid and unique
  features <- read.table(paste0(rootPath, "/features.txt"), sep="")
  charFeatures <- as(features[,2], "character")
  charFeatures <- make.names(charFeatures, unique=TRUE)
  charFeatures <- gsub(".", "_", charFeatures, fixed=TRUE) ## replace dots with underscore to avoid any regex complications
  
  ## read the activity labels
  activities <- read.table(paste0(rootPath, "/activity_labels.txt"), sep="")
  charActivities <- as(activities[,2], "character")
  
  ## read the train data, use sep="" so that white space is treated as the separator
  trainData <- read.table(paste0(trainPath, "/X_train.txt"), sep="")
  trainSubjectData <- read.table(paste0(trainPath, "/subject_train.txt"), sep="")
  trainActivityData <- read.table(paste0(trainPath, "/y_train.txt"), sep="")
  
  ## add subject and activity coulumns to train data
  trainData <- cbind(trainSubjectData, trainData)
  trainData <- cbind(trainActivityData, trainData)
  
  ## read the test data, use sep="" so that white space is treated as the separator
  testData <- read.table(paste0(testPath, "/X_test.txt"), sep="")
  testSubjectData <- read.table(paste0(testPath, "/subject_test.txt"), sep="")
  testActivityData <- read.table(paste0(testPath, "/y_test.txt"), sep="")
  
  ## add subject and activity coulumns to test data
  testData <- cbind(testSubjectData, testData)
  testData <- cbind(testActivityData, testData)
  
  ## add subject and activity column names vector
  charFeatures <- append(c("activity", "subject"), charFeatures, 2)
  
  ## 1. Merge the training and the test sets to create one data set.
  completeData <- rbind(testData, trainData)
  
  ## 2. Extract only the measurements on the mean and standard deviation for each measurement.
  cols <- grep("std|mean", charFeatures, ignore.case=TRUE)
  ## retain the first two columns (activity, subject) and all of the cols containing mean or std
  cols <- append(1:2, cols, 2)
  filtered <- completeData[,cols]
  
  ## 3. Use descriptive activity names to name the activities in the data set i.e. convert to factor  
  filtered[[1]] <- as.factor(filtered[[1]])
  levels(filtered[[1]]) <- charActivities
  
  ## 4. Appropriately label the data set with descriptive variable names. Use the subset of the full set of names
  filtered <- setNames(filtered, charFeatures[cols])
  
  ## 5. From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.
  tidy <- ddply(filtered, c("activity", "subject"), numcolwise(mean))

  ## finally, save the tidy data to file
  write.table(tidy, "tidy_data.txt", append=FALSE, row.names=FALSE)
  
  
  