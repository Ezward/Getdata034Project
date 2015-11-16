# download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", "dataset.zip")
# unzip("dataset.zip")

# load the set of test and train data (2947 rows, 561 columns)
X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
dataSet <- rbind(X_test, X_train)

# apply the column names
features <- readLines("UCI HAR Dataset/features.txt")
colnames(dataSet) <- features

# select only the mean and standard deviation columns
mean_features <- grep("-mean()", features, fixed=TRUE, value=TRUE)
std_features <- grep("-std()", features, fixed=TRUE, value=TRUE)
mean_std_features <- c(mean_features, std_features)
dataSet <- dataSet[,mean_std_features]

# add the subject column
subject_test <- readLines("UCI HAR Dataset/test/subject_test.txt")
subject_train <- readLines("UCI HAR Dataset/train/subject_train.txt")
subject <- c(subject_test, subject_train)
dataSet$subject <- subject

# create the merged activity vector
activity_test <- readLines("UCI HAR Dataset/test/y_test.txt")
activity_train <- readLines("UCI HAR Dataset/train/y_train.txt")
activity <- c(activity_test, activity_train)
activity <- as.numeric(activity) # convert to numeric vector

# convert activity numbers to a human readable label
activity_labels = readLines("UCI HAR Dataset/activity_labels.txt")
map_activity_label <- function(activity_number) {
  activity_labels[activity_number]
}
activity <- sapply(activity, map_activity_label)

# add the activity column to the dataSet
dataSet$activity <- activity

# save this dataset
write.table(dataSet, "FeatureActivitySubject.dt")



