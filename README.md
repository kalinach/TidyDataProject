# TidyDataProject
Getting and Cleaning Data Coursera Final Project

The "Tidy Data Set" is located in the "tidyDataSet.txt" file. The data set is derived from the "Human Activity Recognition Using Smartphones Dataset" colleccted by Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita and Xavier Parra.

The original data set is available online at: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#
It contains data randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data.

The script starts after the original data set has been manually unzipped into the working directory.

##Read the necessary files into R.
The data needed is located in the X_test.txt and the X_train.txt.
The names of the 561 initial variables (column names) are located in the features.txt file. 
The Y-test.txt and the Y_train.txt files match each of the observations in the 2 data sets to the activity performed. 
The subject_test.txt and the subject_train.txt map the observations to the subjects. 
activity_labels.txt maps the numbers 1 to 6 to the six activities.

##The test and the train data set were merged by adding the rows together.

##Column names of the merged data set were given from the features data frame (features.txt)

##The 561 variables are reduced to 66 by subsetting only the mean and standard deviation of each measurement. Mean frequencies are excluded from the new data set.

##A new column with the activity to which each observation relates was created.
Each observation is also mapped to the subject (number 1 to 30).

##The average of each of the 66 variables was calculated grouped by activity and by subject.

The new data set was saved to "tidyDataSet.txt"

