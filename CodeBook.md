# Getting And Cleaning Data

### Outline

The course project notes can be found here:
https://class.coursera.org/getdata-015/human_grading/view/courses/973502/assessments/3/submissions

From the course project notes:
"One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

### Source of data

The data was manually downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and unzipped into a child folder, "UCI HAR Dataset", of the project folder.

The original source of the data was the UCI Machine Learing Repository which can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones [1]

The ICI repository notes state:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain."

### Dataset files and interrelation

The unzipped dataset files, present in the "UCI HAR Dataset" folder are made up of the following:

| Filename | Description |
| ------------- |:------:|
| activity_labels.txt | The list of activities e.g. WALKING, WALKING_UPSTAIRS etc. |
| features.txt | The list of data column names |
| test/X_test.txt | The main test dataset (2947 obs of 563 variables) |
| test/y_test.txt | Activities for each test row (2947 obs of 1 variable) |
| test/subject_test.txt | Subject for each test row (2947 obs of 1 variable) |
| train/X_train.txt | The main training dataset (7352 obs of 563 variables) |
| train/y_train.txt | Activities for each training row (7352 obs of 1 variable) |
| train/subject_train.txt | Subject for each training row (7352 obs of 1 variable) |

### Requirements to run the run_analysis.R script

The script makes use of the plyr package and this package must be installed.
If the plyr package is not already installed then intall it using:
install_packages("plyr")

The dataset files are assumed to be in a child folder of the working folder names "UCI HAR Dataset". If not present then they should be downloaded, extracted and put in the required folder.
The dataset files are assumed to be in the same folder structure as is present in the zip file.

### Variables

Activity data is one of the following: "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".

Subject data is comprised of integer values in the range 1 to 30.

The main dataset made up of 563 variables was filtered resulting in a reduced dataset of 88 variables.
This is the complete list of the resulting variables:

tBodyAcc_mean___X, tBodyAcc_mean___Y, tBodyAcc_mean___Z, tBodyAcc_std___X, tBodyAcc_std___Y, tBodyAcc_std___Z, tGravityAcc_mean___X, tGravityAcc_mean___Y, tGravityAcc_mean___Z, tGravityAcc_std___X, tGravityAcc_std___Y, tGravityAcc_std___Z, tBodyAccJerk_mean___X, tBodyAccJerk_mean___Y, tBodyAccJerk_mean___Z, tBodyAccJerk_std___X, tBodyAccJerk_std___Y, tBodyAccJerk_std___Z, tBodyGyro_mean___X, tBodyGyro_mean___Y, tBodyGyro_mean___Z, tBodyGyro_std___X, tBodyGyro_std___Y, tBodyGyro_std___Z, tBodyGyroJerk_mean___X, tBodyGyroJerk_mean___Y, tBodyGyroJerk_mean___Z, tBodyGyroJerk_std___X, tBodyGyroJerk_std___Y, tBodyGyroJerk_std___Z, tBodyAccMag_mean__, tBodyAccMag_std__, tGravityAccMag_mean__, tGravityAccMag_std__, tBodyAccJerkMag_mean__, tBodyAccJerkMag_std__, tBodyGyroMag_mean__, tBodyGyroMag_std__, tBodyGyroJerkMag_mean__, tBodyGyroJerkMag_std__, fBodyAcc_mean___X, fBodyAcc_mean___Y, fBodyAcc_mean___Z, fBodyAcc_std___X, fBodyAcc_std___Y, fBodyAcc_std___Z, fBodyAcc_meanFreq___X, fBodyAcc_meanFreq___Y, fBodyAcc_meanFreq___Z, fBodyAccJerk_mean___X, fBodyAccJerk_mean___Y, fBodyAccJerk_mean___Z, fBodyAccJerk_std___X, fBodyAccJerk_std___Y, fBodyAccJerk_std___Z, fBodyAccJerk_meanFreq___X, fBodyAccJerk_meanFreq___Y, fBodyAccJerk_meanFreq___Z, fBodyGyro_mean___X, fBodyGyro_mean___Y, fBodyGyro_mean___Z, fBodyGyro_std___X, fBodyGyro_std___Y, fBodyGyro_std___Z, fBodyGyro_meanFreq___X, 
fBodyGyro_meanFreq___Y, fBodyGyro_meanFreq___Z, fBodyAccMag_mean__, fBodyAccMag_std__, fBodyAccMag_meanFreq__, fBodyBodyAccJerkMag_mean__, fBodyBodyAccJerkMag_std__, fBodyBodyAccJerkMag_meanFreq__, fBodyBodyGyroMag_mean__, fBodyBodyGyroMag_std__, fBodyBodyGyroMag_meanFreq__, fBodyBodyGyroJerkMag_mean__, fBodyBodyGyroJerkMag_std__, fBodyBodyGyroJerkMag_meanFreq__, angle_tBodyAccMean_gravity_, angle_tBodyAccJerkMean__gravityMean_, angle_tBodyGyroMean_gravityMean_, angle_tBodyGyroJerkMean_gravityMean_, angle_X_gravityMean_,  angle_Y_gravityMean_, angle_Z_gravityMean_

The final tidy dataset contains the mean of each of these variables grouped by activity and subject.

### Transformations

The features dataset was processed to make the column names valid (using make.names).

The test and train activity and subject data were merged into the appropriate main dataset and then the two datasets were merged into one complete dataset.

The features dataset was filtered to identify those column names which contained "mean" or "std". The resulting list of columns was then used to filter the complete dataset to result in a dataset containing only those columns required for subsequent analysis.

The ddply() function from the plyr package was used to create the mean of each column grouped by activity and subject.

The resulting dataset was then written to a file named "tidy_data.txt" using write.table.

### References

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. A Public Domain Dataset for Human Activity Recognition Using Smartphones. 21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. Bruges, Belgium 24-26 April 2013.
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
