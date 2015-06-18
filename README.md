# GettingAndCleaningData
Course project for Coursera Getting And Cleaning Data course

### Outline
The script, run_analysis.R, processes UCI HAR dataset to generate a tidy dataset, with averages of the mean and standard deviation data grouped by activity and subject.

From the course project notes:
"The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.  

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

### Assumptions
The script makes the following assumptions:
* The UCI HAR zip file has been downloaded
* The zip file has been extracted into the "UCI HAR Dataset" folder under the project folder
* The "UCI HAR Dataset" folder has retained the folder structure present in the zip file

### Process
The process flow is as follows:

1. Load the plyr package (required for ddply used later)
2. Initilise some local path variables for accessing the data files
3. Read features.txt into "features"
4. Convert features from a data frame to a character vector - "charFeatures"
5. Use make.names to ensure that the names will be valid column names and are unique
6. Replace the dots created in step 3 with underscores to avoid any issues with regular expressions
7. Read activity_label.txt into "activities"
8. Convert from a data frame to a character vector, "charActivities"
9. Read the training data:
  1. X_train.txt into "trainData"
  2. y_train.txt into "trainActivityData"
  3. subject_train.txt into "trainSubjectData"
10. Add training subject and activity data to "trainData" using cbind
11. Read the test data:
  1. X_test.txt into "testData"
  2. y_test.txt into "testActivityData"
  3. subject_test.txt into "testSubjectData"
12. Add test subject and activity data to "testData" using cbind
13. Add subject and activity column names to "charFeatures"
14. Merge the training and test data using rbind put into "completeData"
15. Use grep to identify columns whose names contain "mean" or "std" put column numbers into "cols"
16. Add the column numbers for subject and activity to "cols"
17. Subset "completeData" using "cols" to extract the columns of interest, put into "filtered"
18. Convert column 1 of "filtered" into a factor, set the levels to "charActivities" created in step 6
19. Set the column names of "filtered" to the subset of the complete set of column names using "cols" again
20. Create the tidy dataset, "tidy", using ddply on "filtered". Group by subject and activity, calculate the mean of the other columns
21. Write "tidy" to tidy_data.txt in the project folder using write.table (row.names=FALSE)
