---
title: "getdata034Project"
author: "Ed Murphy"
date: "November 15, 2015"
output: html_document
---
**Project
You should create one R script called run_analysis.R that does the following. 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

**Data Set
The data can be downloaded from [here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

That data set is called *Human Activity Recognition Using Smartphones Data Set*.  The data is collected from the accelerometers in a Galaxy S smartphone.  A full description of the data set can be obtained [here.](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Downloading Data
The data is a zip file.  This is downloaded into a local file named "dataset.zip", which is then unzipped in place.  This produces the file folder named "UCI HAR Dataset" which contains, among other things, a README.txt file that describes the data in detail.  It also contains a "test" and a "train" subfolder, each having data.  One of the goals of the project is to merge these two datasets into a single set of data.

Within "UCI HAR Dataset/test/X_test.txt" is a table iof 2947 rows and 561 columns.  Each row represents




