# FINAL ASSIGNMENT
#This R scrip does the following, assuming data is already downloaded:

#1. Uploads data tables. 
#2. Appropriately labels the data sets with descriptive variable names. 
#3. Extracts only the measurements on the mean and standard deviation for each measurement. 
#4. Merges the training and the test sets to create one data set.
#5. Uses descriptive activity names to name the activities in the data set
#6. From the data set in step 5, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

# ------------------------------------------------------------------------------------------------------------
# 1- UPLOAD FILES

features<-read.table('./features.txt')
act_labels<-read.table('./activity_labels.txt')

train_data <- read.table('./train/X_train.txt')
train_label <- read.table('./train/y_train.txt')
train_subject <- read.table('./train/subject_train.txt')

test_data <- read.table('./test/X_test.txt')
test_label <- read.table('./test/y_test.txt')
test_subject <- read.table('./test/subject_test.txt')

# --------------------------------------------------------------------------------------------------------------
# 2- RENAME VARIABLES 
# and labels the data sets with descriptive variable names -> V1, V2, V3 to features description labels: tBodyAcc-mean()-X, tBodyAcc-mean()-Y, etc)
# I DID NOT CHANGE AUTHORS VARIABLE NAMES, I just label data sets with the appropiate feature names (instead of "V1", "V2, "V3"... )

names(train_data)<-features$V2 #rename column in train set (descriptive variable names, point 2)
names(test_data)<-features$V2 #rename column in test set (descriptive variable names, point 2)
names(train_label)<-"activity" #rename activities column in train set
names(test_label)<-"activity" #rename activities column in test set
names(train_subject)<-"subject" #rename subject column in train set
names(test_subject)<-"subject" #rename subject column in test set
names(act_labels)<-c("activity","description") #rename activities column in act_labels
names(features)<-c("features","description") #rename features column in features

# --------------------------------------------------------------------------------------------------------------
# 3- SELECT 'mean' or 'std' COLUMNS

train_data<-train_data[,grepl('mean|std',names(train_data))]
test_data<-test_data[,grepl('mean|std', names(test_data))]

# --------------------------------------------------------------------------------------------------------------
# 4- BIND COLUMNS (subject and activity->train_label)

temp1_train<-cbind(train_subject,train_label) #'temporary' df 1 with subject and activity number, for train set
temp2_train<-cbind(temp1_train,train_data) #'temporary' df 2 with subj+activity number + data, for train set

temp1_test<-cbind(test_subject,test_label) #'temporary' df 1 with subject and activity number, for test set
temp2_test<-cbind(temp1_test,test_data) #'temporary' df 2 with subj+activity number + data, for test set

# --------------------------------------------------------------------------------------------------------------
# 4- BIND ROWS from train and test data sets

merged_df1<-rbind(temp2_train, temp2_test) #merge complete data from train and test data sets

# --------------------------------------------------------------------------------------------------------------
# 5- RENAME ACTIVITIES WITH DESCRIPTIVE NAMES

merged_df1$activity<-act_labels[match(merged_df1[,2],act_labels[,1]),2]

# --------------------------------------------------------------------------------------------------------------
# 6- CREATE TIDY DATA SET with the average of each variable for each activity and each subject.

library(dplyr)
tidydata<- merged_df1 %>% group_by(activity,subject) %>% summarise_all(mean) #use merged_df1, group by activity and then subject, and get the average
write.table(tidydata, "TidyData.txt", row.name=FALSE)

# --------------------------------------------------------------------------------------------------------------
