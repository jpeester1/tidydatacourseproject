
#read the activity labels 
activity_labels<-read.table("activity_labels.txt", header=FALSE)

#read the measurement labels
measurement_labels<-read.table("features.txt", header=FALSE)

#read the results for x_test and x_train
test_df<-read.table("./test/X_test.txt", header=FALSE)
train_df<-read.table("./train/X_train.txt", header=FALSE)
names(test_df)<-measurement_labels$V2
names(train_df)<-measurement_labels$V2


#read the subjects
subject_test_df<-read.table("./test/subject_test.txt", header=FALSE)
subject_train_df<-read.table("./train/subject_train.txt", header=FALSE)
names(subject_test_df)<-'Subject'
names(subject_train_df)<-'Subject'

#read the activity keys and provide column names
activity_test_df<-read.table("./test/y_test.txt", header=FALSE)
activity_train_df<-read.table("./train/y_train.txt", header=FALSE)
names(activity_test_df)<-'Activity'
names(activity_train_df)<-'Activity'


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
}



#Using y_train, lookup up the activity being measured in x_train,  colbind with X_train
#example - STANDING  3.3535362e-001 -7.7075148e-002 -6.7901127e-002 -3.6055476e-001 -1.0563135e-001 -2.8282314e-001


#read the X test data colbind activity labels as we did above

#red the subject_train file and colbind with train set from above

#merge the datasets


#extract only the columns we need (mean and standard deviation for each measurement)

#using the features.txt file name the columns of our dataset with human readable labels
