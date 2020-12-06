#************************************
# Get the Data Ready 
#************************************ 

# The data was already Downloaded and unzipped 

# Loading the Data from the unzipped folder

path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)
files


#********************************************************************************
# Step 1: Merges the training and the test sets to create one data set.
#*****************************************************************************

# Reading the Datasets

# Reading trainings tables:

x_train <- read.table(file.path(path_rf, "train", "X_train.txt"), header = FALSE)
y_train <- read.table(file.path(path_rf, "train" ,"y_train.txt"), header = FALSE)
subject_train <- read.table(file.path(path_rf, "train","subject_train.txt"), header = FALSE)

# Reading testing tables:
x_test <- read.table(file.path(path_rf, "test", "X_test.txt"), header = FALSE)
y_test <- read.table(file.path(path_rf,"test","y_test.txt"), header = FALSE)
subject_test <- read.table(file.path(path_rf, "test", "subject_test.txt"), header = FALSE)

# Reading feature vector:
features <- read.table(file.path(path_rf, "features.txt"), header = FALSE)

# Reading activity labels:
activityLabels = read.table(file.path(path_rf, "activity_labels.txt"), header = FALSE)

# Assigning column names:

colnames(x_train) <- features[,2]
colnames(y_train) <-"activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[,2] 
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityLabels) <- c('activityId','activityType')

# Merging all train and test data into one dataset:

mrg_train <- cbind(y_train, subject_train, x_train)
mrg_test <- cbind(y_test, subject_test, x_test)
MergedData <- rbind(mrg_train, mrg_test)

# Merged data has 10299 obs and 563 Variables

# Checking the above

#dim(MergedData)

# [1] 10299   563


#********************************************************************************************************
# Step 2 : Extracts only the measurements on the mean and standard deviation for each measurement.
#************************************************************************************************   

# Reading column names:

colNames <- colnames(MergedData)

# Create vector for defining ID, mean and standard deviation:

mean_and_SD <- (grepl("activityId" , colNames) | 
                   grepl("subjectId" , colNames) | 
                   grepl("mean.." , colNames) | 
                   grepl("std.." , colNames) )

# Creating subset of Mean and Standard Deviation Data measurements

mean_and_SD_Data <-  MergedData[ , mean_and_SD == TRUE]


#***********************************************************************************
# Step 3 Uses descriptive activity names to name the activities in the data set
#***********************************************************************************

ActivityNames <- merge(mean_and_SD_Data, activityLabels,
                              by='activityId',
                              all.x=TRUE)

#******************************************************************
#Step 4. Appropriately labels the data set with descriptive variable names.
#******************************************************************

names(mean_and_SD_Data)<-gsub("^t", "time", names(mean_and_SD_Data))
names(mean_and_SD_Data)<-gsub("^f", "frequency", names(mean_and_SD_Data))
names(mean_and_SD_Data)<-gsub("Acc", "Accelerometer", names(mean_and_SD_Data))
names(mean_and_SD_Data)<-gsub("Gyro", "Gyroscope", names(mean_and_SD_Data))
names(mean_and_SD_Data)<-gsub("Mag", "Magnitude", names(mean_and_SD_Data))
names(mean_and_SD_Data)<-gsub("BodyBody", "Body", names(mean_and_SD_Data))

#*********************************************************************************************************************************************************
#Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#********************************************************************************************************************************************************
library(dplyr)

FinalData <- mean_and_SD_Data  %>%
  group_by(subjectId, activityId) %>%
  summarise_all(mean)

write.table(FinalData, "FinalData.txt", row.name=FALSE)

