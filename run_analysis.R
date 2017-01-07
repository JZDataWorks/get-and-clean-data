###### 3. Get and Clean Data Excercise - JHU Coursera Data Science  
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation for each measurement.
# Uses descriptive activity names to name the activities in the data set
# Appropriately labels the data set with descriptive variable names
# From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#clear environment
rm(list = ls())

#set working directory
setwd("C:/Users/jzimmerman/Documents/JHU Cert/Getcleandata/UCI HAR Dataset/")

####### 1. Merge test and training datasets into on #################

#overall information 
features <- read.table('./features.txt',header=FALSE)
activityType = read.table('./activity_labels.txt',header=FALSE)

#  Get Training Data
trainy <- read.table('./train/y_train.txt',header=FALSE)
trainx <- read.table('./train/X_train.txt',header=FALSE)
trainsubj <- read.table('./train/subject_train.txt',header=FALSE)

# Column names for training and merging 
colnames(activityType)  = c('activity','TypeActivity');
colnames(trainx)        = features[,2]; 
colnames(trainy)        = "activity";
colnames(trainsubj)     = "subject";

#  Get test Data

testy <- read.table('./test/y_test.txt',header=FALSE)
testx <- read.table('./test/X_test.txt',header=FALSE)
testsubj <- read.table('./test/subject_test.txt',header=FALSE)

# Column names for test and merging 
colnames(testx)        = features[,2]; 
colnames(testy)        = "activity";
colnames(testsubj)     = "subject";


#full Join of Test and Train

joinY<-rbind(trainy,testy)

joinX<-rbind(trainx,testx)

subjectsfull<-rbind(trainsubj,testsubj)

####### 2. Reduce the data set to only standard deviations and mean 

mean_STD_cols <- grep("-(mean|std)\\(\\)", features[, 2])

onlystdandmeandata<-joinX[,mean_STD_cols]

####### 3. Uses descriptive activity names to name the activities in the data set

ynames <- merge(joinY,activityType)

####### 4. Appropriately label the data set with descriptive variable names

finalfulldata<-cbind(ynames,subjectsfull,onlystdandmeandata) ##labels already added 

rm(list= ls()[!(ls() %in% c('finalfulldata'))])

###### 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
library(plyr)

Means <- ddply(finalfulldata, .(subject, TypeActivity), function(x) colMeans(x[, 3:69]))
