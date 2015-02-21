##Read all the files that will be needed for the dataset merge
Xtest <- read.table("X_test.txt")
Ytest <- read.table("Y_test.txt")
Xtrain <- read.table("X_train.txt")
Ytrain <- read.table("Y_train.txt")
labels <- read.table("activity_labels.txt")
features <- read.table("features.txt")
subjTrain <- read.table("subject_train.txt")
subjTest <- read.table("subject_test.txt")

##Merge the data by simply addind the rows for all 561 observations. Results in a data frame with 10299 observations of 561 variables
mergeXY <- rbind(Xtest, Xtrain)

##Take the column names from the features file and add them to the new mergeXY dataset (Step 4 from the project)
names(mergeXY) <- features$V2

##Extracts only the measurements on the mean and standard deviation
##Use only the std and mean (w/o meanFreq) --> 66 columns are left (credit to the following post: https://class.coursera.org/getdata-011/forum/thread?thread_id=191#post-1346)
data1 <- mergeXY[,grepl("mean\\(\\)|std\\(\\)", colnames(mergeXY))]

##rbind the Y files
Activity <- rbind(Ytest, Ytrain)

##Add the activity column to the data1 set and format it as factor variable
data1[, "Activity1"] <- Activity
data1$Activity <- as.character(labels[match(data1$Activity1, labels$V1), 'V2']) ##credit to stackoverflow(http://stackoverflow.com/questions/10158617/how-do-i-replace-numeric-codes-in-a-data-frame-with-value-labels-from-a-data-fr/10158737#10158737)
data1$Activity <- as.factor(data1$Activity)
##Remove the Activity1 column from data 1
data1$Activity1 <- NULL

##Step 5
###Bind the subjects for Test and Train sets
Subject <- rbind(subjTest, subjTrain)
###Add the column to data 1
data1[, "Subject"] <- Subject
###Melt the data frame by subject and activity
library(reshape2)
data2 <- melt(data1, id=c("Activity", "Subject"))
data3 <- dcast(data2, Activity + Subject ~ variable, mean)

##Write the dataset to a text file
write.table(data3, "tidyDataSet.txt", row.name=FALSE)
