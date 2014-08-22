## set the working directory
setwd("C:/Users/CARLOS CHAVARRIA/Desktop/Coursera Courses/Getting & Cleaning Data/Course Project/UCI HAR Dataset/")

## Read the data in (including the features)
subject_test <- read.table("subject_test.txt", header = FALSE, sep="")
subject_train <- read.table("subject_train.txt", header = FALSE, sep="")
y_test <- read.table("y_test.txt", header = FALSE, sep="")
y_train <- read.table("y_train.txt", header = FALSE, sep="")
X_test <- read.table("X_test.txt", header = FALSE, sep="")
X_train <- read.table("X_train.txt", header = FALSE, sep="")
features <- read.table("features.txt", header = FALSE, sep="")

## Put data together
test_db <- cbind(X_test, subject_test, y_test)
train_db <- cbind(X_train, subject_train, y_train)
dataset <- rbind(test_db, train_db)

## Putting descriptive variable names (Results saved in the same 'features' Data Frame)
features$V2 <- sub("BodyBody", "bodybody", features$V2)
features$V2 <- sub("Body", "body", features$V2)
features$V2 <- sub("Gravity", "gravity", features$V2)
features$V2 <- sub("Acc", "acc", features$V2)
features$V2 <- sub("X", "x", features$V2)
features$V2 <- sub("Y", "y", features$V2)
features$V2 <- sub("Z", "z", features$V2)
features$V2 <- sub("Jerk", "jerk", features$V2)
features$V2 <- sub("Gyro", "gyro", features$V2)
features$V2 <- sub("Mag", "mag", features$V2)
features$V2 <- sub("JerkMag", "jerkmag", features$V2)
features$V2 <- sub("GyroMag", "gyromag", features$V2)
features$V2 <- sub("GyroJerkMag", "gyrojerkmag", features$V2)
features$V2 <- sub("\\(", "", features$V2)
features$V2 <- sub("\\)", "", features$V2)
features$V2 <- sub("-", "", features$V2)
features$V2 <- sub("-", "", features$V2)
features$V2 <- sub("meanFreq", "mfreq", features$V2)

## Put column names. Add two rows for 'subject' and 'activity' columns names
newRow562 <- data.frame(V1=562, V2="subject")
newRow563 <- data.frame(V1=563, V2="activity")
features_all <- rbind(features, newRow562, newRow563)
colnames(dataset) <- features_all$V2

## Put descriptive Activity Names
dataset$activity <- factor(dataset$activity,
                   levels = c(1, 2, 3, 4, 5, 6),
                   labels = c("Walking", "Walking Upstairs", "Walking Downstairs", "Sitting", "Standing", "Laying"))

## Picking out the mean and standard deviation columns and subsetting to those ones
colmeans <- grep("mean", features_all$V2)
colstds <- grep("std", features_all$V2)
colsubject <- grep("subject", features_all$V2)
colactivity <- grep("activity", features_all$V2)
WearableComputing <- dataset[ ,c(colmeans, colstds, colsubject, colactivity)]

## Produce a tidy data set of the means of the variables for each combination 
## of variable, subject, and activity. Results saved in mydata
library(reshape2)
attach(WearableComputing)
mydata <-aggregate(WearableComputing, by=list(subject,activity),FUN=mean, na.rm=TRUE)
detach(WearableComputing)

## Writing the dataset in a txt file and renaming the variables subject and activity
library(data.table)
setnames(mydata, "Group.1", "subject")
setnames(mydata, "Group.2", "activity")
write.table(mydata[ ,1:68], "mydata.txt", sep=",", row.names=FALSE)

## Reading the tidy dataset back into R
mydata <- read.table("mydata.txt", header = TRUE, sep=",")