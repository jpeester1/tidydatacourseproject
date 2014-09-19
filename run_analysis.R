#read the X test data

#read the results for x_test
x_test_df<-read.table("./test/X_test.txt", header=FALSE)

#read the subjects
x_subject_test_df<-read.table("./test/subject_test.txt", header=FALSE)

#read the activity keys
x_activity_test_df<-read.table("./test/y_test.txt", header=FALSE)

#read the activity labels 
activity_labels<-read.table("activity_labels.txt", header=FALSE)

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
