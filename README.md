
=======================================================================================================
# Getting and Cleaning Data Course Project

#### _This repository contains the final assingment of the Getting &amp; Cleaning Data Course (J. Hopkins, Coursera)_ 
=======================================================================================================

    Human Activity Recognition Using Smartphones Dataset Analysis


Data was obtained from url: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones, corresponding to the work by Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz "Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine" (International Workshop of Ambient Assisted Living (IWAAL 2012)), Vitoria-Gasteiz, Spain. Dec 2012. 
In their work, each person of a group of 30 volunteers within an age bracket of 19-48 years performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz were captured. The dataset was originally randomly partitioned into two sets: training and test data. 


The following files from the original dataset were used:
========================================================

- 'features.txt': List of all features.
- 'activity_labels.txt': Links the activity labels with their activity name (descriptive name).

- 'train/X_train.txt': Training data set.
- 'train/y_train.txt': Training labels.
- 'train/subject_train.txt': Subject id for training set.

- 'test/X_test.txt': Test data set.
- 'test/y_test.txt': Test labels.
- 'test/subject_test.txt': Subject id for test set.


Information about the R script used for the getting & data cleaning project:
============================================================================

script file name: run_analysis.R

The script does the following:

1. Uploads data tables (it will work as long as R script is saved in the same working directory as the files, otherwise please correct path)
2. Appropriately labels the data sets with descriptive variable names. 
3. Extracts only the measurements on the mean and standard deviation for each measurement. 
4. Merges the training and the test sets to create one data set.
5. Uses descriptive activity names to name the activities in the data set.
6. From the data set created in step 5, it creates a second, independent tidy data set with the average of each variable for each activity and each subject and saves it to a new .txt file named "TidyData.txt".

