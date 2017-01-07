##Description

This write up contains information the data set, variables and methods used to complete the Coursera John Hopkins University Getting and Cleaning Data class project

##Dataset

Information on the dataset can be found here (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Variables Used
x_train, y_train, x_test, y_test, subject_train and subject_test are files of the data set that contain information on the subjects and activities of the experiments

The features and activities files contain meta information for the x and y files respectively

##Methods
1. Merge the data sets using rbind and cbind functions
2. Use the grep command to identify which columns in the combined x training and test data set only concerns standard deviations and means
3. Merge the proper activity names taken from the activities file with the combined y training and test set
4. Use the informaiton in the features data set to properly label the x data sets. CBIND all the x, y, and subject files
5. Use DDPLY function to find the means for each subject and activity and turn it into a tidy data set
