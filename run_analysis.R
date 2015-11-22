library(data.table)
library(reshape2)

if(!dir.exists("./download")) {dir.create("./download")}
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "./download/dataset.zip")
unzip("./download/dataset.zip")

##
## 1. Merges the training and the test sets to create one data set.
##
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
dataSet <- rbind(X_test, X_train)

# apply the column names in the features file
features <- readLines("UCI HAR Dataset/features.txt")
colnames(dataSet) <- features

##
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##
mean_features <- grep("-mean()", features, fixed=TRUE, value=TRUE)
std_features <- grep("-std()", features, fixed=TRUE, value=TRUE)
mean_std_features <- c(mean_features, std_features)
dataSet <- dataSet[,mean_std_features]

##
## 4. Appropriately labels the data set with descriptive variable names.
##
# rename the columns;
# - remove initial digits
# - initial t is time, intial f is freq (frequency)
# - remove dashes and parens
# - make it camelcase
renameFunc <- function(name) {
  newName <- sub("^[ ]*[0-9]+[ ]+", "", name)
  newName <-  sub("^t", "time", newName)
  newName <- sub("^f", "freq", newName)
  newName <- sub("\\-std\\(\\)", "Std", newName)
  newName <- sub("\\-mean\\(\\)", "Mean", newName)
  newName <- sub("\\-X", "X", newName)
  newName <- sub("\\-Y", "Y", newName)
  newName <- sub("\\-Z", "Z", newName)
  newName
}
colnames(dataSet) <- sapply(mean_std_features, renameFunc)


# add the subject column
subject_test <- readLines("UCI HAR Dataset/test/subject_test.txt")
subject_train <- readLines("UCI HAR Dataset/train/subject_train.txt")
subject <- c(subject_test, subject_train)
dataSet$subject <- as.numeric(subject)

# create the merged numeric activity vector
activity_test <- readLines("UCI HAR Dataset/test/y_test.txt")
activity_train <- readLines("UCI HAR Dataset/train/y_train.txt")
activity <- c(activity_test, activity_train)
activity <- as.numeric(activity) # convert to numeric vector

##
## 3. Uses descriptive activity names to name the activities in the data set
##
activity_labels = c("walking", "walkingUpStairs", "walkingDownStairs", "sitting", "standing", "laying") # readLines("UCI HAR Dataset/activity_labels.txt")
activity <- factor(activity, labels=activity_labels)

# add the activity column to the dataSet
dataSet$activity <- activity

# save this dataset
write.table(dataSet, "SubjectActivityFeature.txt")

##
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject.
##
meltData <- melt(dataSet, c("subject", "activity"))
meanData <- dcast(meltData, subject+activity ~ variable, fun=mean)

# write out the averages data set
write.table(meanData, "SubjectActivityFeatureMean.txt", row.name=FALSE)

