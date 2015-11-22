---
title: "getdata034Project"
author: "Ed Murphy"
date: "November 15, 2015"
output: html_document
---

The project produces 2 files, SubjectActivityFeature.txt and SubjectActivityFeatureMean.txt.  They share the column structure described below.  SubjectActivityFeature.txt contains the original feature readings.  SubjectActivityFeatureMean.txt is a summary of that original data where each feature's readings are grouped by subject and activity and the mean is calculated.

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




