##Variables

X_test  - table contents of test/X_test.txt

X_train  - table contents of train/X_train.txt

features - Measurement data. Combined data set of the two above variables


subject_test - table contents of test/subject_test.txt

subject_train - table contents of test/subject_train.txt

subject - Subjects. Combined data set of the two above variables


y_test - table contents of test/y_test.txt


y_train - table contents of train/y_train.txt

activity - Data Labels. Combined data set of the two above variables


features_names - table contents of features.txt and later - names of for data columns derived from this table


data - Combined data set of the three above variables (features,activity,subject)



subFeaturesNames -  vector of names only the measurements on the mean and standard deviation for each measurement.


Data - 

1)table contents of extracting only the measurements on the mean and standard deviation for each measurement and two columns: "Subject", "Activity".

2)table contents of descriptive activity names to name the activities in the data set

3)table contents of .Appropriately labels the data set with descriptive variable names


f - vector with activity labels

tidyData - independent tidy data set with the average of each variable for each activity and each subject-readable data ready for output according to project description.

##Output

tidyData.txt is a 180x68 data frame.


The first column contains subject IDs.
The second column contains activity names.
The averages for each of the 66 attributes are in columns 3-68.