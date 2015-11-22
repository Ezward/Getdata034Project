---
title: "getdata034Project"
author: "Ed Murphy"
date: "November 15, 2015"
output: html_document
---
##Project
The project goal is to create an R script named run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

##Data Set
The data can be downloaded from [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

That data set is called *Human Activity Recognition Using Smartphones Data Set*.  The data is collected from the accelerometers in a Galaxy S smartphone.  A full description of the data set can be obtained [here.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Downloading Source Data
The data is a zip file.  This is downloaded into a local file named "dataset.zip", which is then unzipped in place.  This produces the file folder named "UCI HAR Dataset" which contains, among other things, a README.txt file that describes the data in detail.  It also contains a "test" and a "train" subfolder, each having data.  One of the goals of the project is to merge these two datasets into a single set of data.

## Merging and Subsetting Test and Train data
The included script, run_analysis.R, merges the train and test data, then subsets the table to keep columns that hold mean and standard deviation data.

- The test and train datasets (feature measurements) are merged, then the columns containing the measurement means and standard deviations (having "-mean()" and "-std()" in the column names respectively) are maintained and other columns are dropped.  
    - NOTE: it is critical to make all merges (for the subject and activity data) in the same order so data correspondence of rows in the added columns is maintained.  The included script concatenates the train data to the end of the test data.
- Then the column names are simplified to a camelcase format that is easier to read.
- Then the test and train subject data (a vector indicating which subject the feature data corresponds to) are merged and then added to the subset feature data as the 'subject' column.  Again, we are careful to merge these in the same order as the original test and train data sets so the the rows correspond.
- Likewise, the test and train activity data (a vector indicating what physical activity was ocurring while the feature measurements were made) is merged.  The numeric data in the activity vector is replaced with human readable character data so it is easier to understand the activity column.  This character vector is then added to the subset feature data as the 'activity' column.
- This subset data table is then saved as "FeatureActivitySubject.txt"

## Creating a tidy data set
The run_analysis.R script takes the merged and subsetted data and creates a second, independent tidy data set with the average of each variable for each activity and each subject .

- feature data is aggregated by subject and activity and then the mean is calculate for each group.  So for each subject there are 6 rows corresponding to the 6 activities (sitting, standing, walking, etc).  The feature columns are as described in download file "UCI HAR Dataset/features_info.txt" except that the column names are renamed to be more human readable as follows;
    - features beginning with a 't' are prefixed with 'time' and features prefixed with an 'f' are prefixed with 'freq' to make it clearer that these are in the time and frequency domains respectively.
    - the mean and standard deviation indicators are made into camel case.  So '-mean()' becomes 'Mean' and '-std()' becomes 'Std'
    - The axis indication are made into camelcase.  So '-X' becomes 'X', '-Y' becomes 'Y', '-Z' becomes 'Z'.  For example 'tBodyAcc-mean()-X' bcomes 'timeBodyAccMeanX' and 'fBodyGyro-std()-Z' becomes 'freqBodyGyroStdZ'.
- the resulting data set is written to "SubjectActivityFeatureMean.txt"

Column                      | Description
--------------------------- | ------------
subject                     | 1..30 indicating the subject number
activity                    | Factor w/ 6 levels "walking","walkingUpStairs",.. indicating the subject’s physical activity during the feature measurement.
timeBodyAccMeanX            | number indicating the mean of the body acceleration signal on the X axis in the time domain
timeBodyAccMeanY            | same for Y axis
timeBodyAccMeanZ            | same for Z axis
timeGravityAccMeanX         | number indicating the mean of the gravity acceleration signal on the X axis in the time domain
timeGravityAccMeanY         | same for Y axis
timeGravityAccMeanZ         | same for Z axis
timeBodyAccJerkMeanX        | number indicating the mean of the body acceleration jerk signal on the X axis in the time domain
timeBodyAccJerkMeanY        | same for Y axis.
timeBodyAccJerkMeanZ        | same for Z axis
timeBodyGyroMeanX           | number indicating the mean of the body gyro signal on the X axis in the time domain
timeBodyGyroMeanY           | same for Y axis.
timeBodyGyroMeanZ           | same for Z axis.
timeBodyGyroJerkMeanX       | number indicating the mean of the body gyro jerk signal on the X axis in the time domain
timeBodyGyroJerkMeanY       | same for Y axis.
timeBodyGyroJerkMeanZ       | same for Z axis.
timeBodyAccMagMean          | number indicating the mean of the body acceleration magnitude in the time domain
timeGravityAccMagMean       | number indicating the mean of the gravity acceleration magnitude in the time domain
timeBodyAccJerkMagMean      | number indicating the mean of the body acceleration jerk signal magnitude in the time domain
timeBodyGyroMagMean         | number indicating the mean of the body gyro signal magnitude in the time domain
timeBodyGyroJerkMagMean     | number indicating the mean of the body gyro jerk signal magnitude in the time domain
freqBodyAccMeanX            | number indicating the mean of the body acceleration signal on the X axis in the frequency domain
freqBodyAccMeanY            | same for the Y axis.
freqBodyAccMeanZ            | same for the Z axis.
freqBodyAccJerkMeanX        | number indicating the mean of the body acceleration jerk signal on the X axis in the frequency domain.
freqBodyAccJerkMeanY        | same for Y axis.
freqBodyAccJerkMeanZ        | same for Z axis.
freqBodyGyroMeanX           | number indicating the mean of the body gyro signal on the X axis in the frequency domain.
freqBodyGyroMeanY           | same for Y axis.
freqBodyGyroMeanZ           | same for Z axis.
freqBodyAccMagMean          | number indicating the mean of the body acceleration magnitude in the frequency domain.
freqBodyBodyAccJerkMagMean  | number.
freqBodyBodyGyroMagMean     | number.
freqBodyBodyGyroJerkMagMean | number.
timeBodyAccStdX             | number indicating the standard deviation of the body acceleration signal on the X axis in the time domain
timeBodyAccStdY             | same for Y axis
timeBodyAccStdZ             | same for Z axis
timeGravityAccStdX          | number indicating the standard deviation of the gravity acceleration signal on the X axis in the time domain
timeGravityAccStdY          | same for Y axis
timeGravityAccStdZ          | same for Z axis
timeBodyAccJerkStdX         | number indicating the standard deviation of the body acceleration jerk signal on the X axis in the time domain
timeBodyAccJerkStdY         | same for Y axis.
timeBodyAccJerkStdZ         | same for Z axis
timeBodyGyroStdX            | number indicating the standard deviation of the body gyro signal on the X axis in the time domain
timeBodyGyroStdY            | same for Y axis.
timeBodyGyroStdZ            | same for Z axis.
timeBodyGyroJerkStdX        | number indicating the standard deviation of the body gyro jerk signal on the X axis in the time domain
timeBodyGyroJerkStdY        | same for Y axis.
timeBodyGyroJerkStdZ        | same for Z axis.
timeBodyAccMagStd           | number indicating the standard deviation of the body acceleration magnitude in the time domain
timeGravityAccMagStd        | number indicating the standard deviation of the gravity acceleration magnitude in the time domain
timeBodyAccJerkMagStd       | number indicating the standard deviation of the body acceleration jerk signal magnitude in the time domain
timeBodyGyroMagStd          | number indicating the standard deviation of the body gyro signal magnitude in the time domain
timeBodyGyroJerkMagStd      | number indicating the standard deviation of the body gyro jerk signal magnitude in the time domain
freqBodyAccStdX             | number indicating the standard deviation of the body acceleration signal on the X axis in the frequency domain
freqBodyAccStdY             | same for the Y axis.
freqBodyAccStdZ             | same for the Z axis.
freqBodyAccJerkStdX         | number indicating the standard deviation of the body acceleration jerk signal on the X axis in the frequency domain.
freqBodyAccJerkStdY         | same for Y axis.
freqBodyAccJerkStdZ         | same for Z axis.
freqBodyGyroStdX            | number indicating the standard deviation of the body gyro signal on the X axis in the frequency domain.
freqBodyGyroStdY            | same for Y axis.
freqBodyGyroStdZ            | same for Z axis.
freqBodyAccMagStd           | number indicating the standard deviation of the body acceleration magnitude in the frequency domain.
freqBodyBodyAccJerkMagStd   | number.
freqBodyBodyGyroMagStd      | number.
freqBodyBodyGyroJerkMagStd  | number.




