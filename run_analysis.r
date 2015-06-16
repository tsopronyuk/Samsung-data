function run_analysis(){
#Part 0.Read all text files in R
path="~/Desktop/Coursera/Getting and Cleanningdata/UCI HAR Dataset/"
activity_labels <- read.table(paste0(path,"activity_labels.txt"))
features_names <- read.table(paste0(path,"features.txt"))

subject_test <- read.table(paste0(path,"test/subject_test.txt"))
X_test <- read.table(paste0(path,"test/X_test.txt"))
y_test <- read.table(paste0(path,"test/y_test.txt"))

subject_train <- read.table(paste0(path,"train/subject_train.txt"))
X_train <- read.table(paste0(path,"train/X_train.txt"))
y_train <- read.table(paste0(path,"train/y_train.txt"))

#Part1.Merges the training and the test sets to create one data set
subject <- rbind(subject_train, subject_test)
activity <- rbind(y_train, y_test)
features <- rbind(X_train, X_test)

names(activity) <- "Activity"
names(subject) <- "Subject"
names(features)<- features_names$V2

data <- cbind(features,activity,subject)

#Part2.Extracts only the measurements on the mean and standard deviation for each measurement. 
subFeaturesNames<-names(features)[grep("mean\\(\\)|std\\(\\)", names(features))]
Data<-subset(data,select=c(subFeaturesNames, "Subject", "Activity"))
names(Data)

#Part3.Uses descriptive activity names to name the activities in the data set
f<-as.character(activity_labels[,2])
Data$Activity<-as.character(Data$Activity)

for (i in 1:6)
    Data$Activity[Data$Activity==as.character(i)]<-f[i]

Data$Activity<-as.factor(Data$Activity)
head(Data$Activity,50)

#Part4.Appropriately labels the data set with descriptive variable names 
names(Data)<-gsub("-s", "S", names(Data))
names(Data)<-gsub("-m", "M", names(Data))
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)

#Part 5.From the data set in step 4, creates a second, 
#independent tidy data set with the average of each variable for each activity and each subject
tidyData <- aggregate(Data[,1:(ncol(Data)-2)],
                      by=list(subject=Data$Subject,activity=Data$Activity),
                      mean)

write.table(tidyData, file = "tidy.txt", row.names = FALSE)
}