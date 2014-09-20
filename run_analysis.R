
#read the activity labels 
activity_labels<-read.table("activity_labels.txt", header=FALSE)

#Give readable, descriptive names to the columns
names(activity_labels)<-c("ActivityID", "ActivityLabel")

#read the measurement labels
measurement_labels<-read.table("features.txt", header=FALSE, stringsAsFactors=FALSE)

#give readable names to the feautre columns
names(measurement_labels)<-c("FeaturesID", "FeatureName")
  


#read the results for x_test and x_train
test_df<-read.table("./test/X_test.txt", header=FALSE)
train_df<-read.table("./train/X_train.txt", header=FALSE)

#Name the each column using the measurement_labels from above.
names(test_df)<-measurement_labels$FeatureName
names(train_df)<-measurement_labels$FeatureName


#read the subjects
subject_test_df<-read.table("./test/subject_test.txt", header=FALSE)
subject_train_df<-read.table("./train/subject_train.txt", header=FALSE)
names(subject_test_df)<-'Subject'
names(subject_train_df)<-'Subject'

#read the activity keys and provide column names
activity_test_df<-read.table("./test/y_test.txt", header=FALSE)
activity_train_df<-read.table("./train/y_train.txt", header=FALSE)
names(activity_test_df)<-'ActivityID'
names(activity_train_df)<-'ActivityID'






#merge training data
train_df<-cbind(activity_train_df, train_df)
train_df<-cbind(subject_train_df,train_df )

#merge test data
test_df<-cbind(activity_test_df, test_df)
test_df<-cbind(subject_test_df,test_df )

#bind the training and the testing data
total_df<-rbind(test_df, train_df)

#attemp to load the dplyr package
if(!require(dplyr)){
        install.packages("dplyr")
        library(dplyr)
}
if(!require(sqldf)){
  install.packages("sqldf")
  library(sqldf)
}

#build a data frame of the columns we want to use in our analysis
matches <- sapply(names(total_df), function(x) grepl('mean()', x))


#join the total_df with the activity_labels dataframe to get the labels for each activity in the total_df
activity_measurement_label<-sqldf('select ActivityLabel from activity_labels join total_df using(ActivityID) ')

#using dplyr, select the columns we want to work with
#finalColumnList <-c("Subject", "tBodyAcc-XYZ", "tGravityAcc-XYZ", "tBodyAccJerk-XYZ", "tBodyGyro-XYZ")
indicesOfDesiredColumns<-which(matches, arr.ind = TRUE, useNames =FALSE)
final_df<-select(total_df, Subject, indicesOfDesiredColumns)
#bind in our labels frame
final_df<-cbind(activity_measurement_label, final_df)

#find the columns we want to work with. We are selecting only those columns that contain 'mean()' as I believe these are the means of the measurement

#colNames <-measurement_labels[,which(matches)]

#Using y_train, lookup up the activity being measured in x_train,  colbind with X_train
#example - STANDING  3.3535362e-001 -7.7075148e-002 -6.7901127e-002 -3.6055476e-001 -1.0563135e-001 -2.8282314e-001


#read the X test data colbind activity labels as we did above

#red the subject_train file and colbind with train set from above

#merge the datasets


#extract only the columns we need (mean and standard deviation for each measurement)

#using the features.txt file name the columns of our dataset with human readable labels
