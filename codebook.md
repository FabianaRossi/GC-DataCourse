# Codebook
#### _run_analysis.R codebook explaining the variables variables and summaries calculated, and any transformations applied in scripts for data getting & cleaning project._



data sources and tables names 
-----------------------------

**features**: *table containing features name ----------------------------------- source file: 'features.txt'*

**act_labels**: *table containing activity descriptive names -------------------- source file: 'activity_labels.txt'* 


**train_data**: *table containing training data --------------------------------- source file: 'train/X_train.txt'*

**train_label**: *table containing train label data ----------------------------- source file: 'train/y_train.txt'*

**train_subject**: *table containing subject numbers for training observations -- source file: 'train/subject_train.txt'*


**test_data**: *table containing test data -------------------------------------- source file: 'test/X_test.txt'*

**test_label**: *table containing test label data ------------------------------- source file: 'test/y_test.txt'*

**test_subject**: *table containing subject numbers for test observations-------- source file: 'test/subject_test.txt'*



variables
---------

**temp1_train** : *contains joined subject number and activity number for training set.*

**temp2_train** : *contains joined temp1_train variable and train observations (columns with names including 'mean' or 'std' only).*


**temp1_test** : *contains joined subject number and activity number for test set.*

**temp2_test** : *contains joined temp1_test variable and test observations (columns with names including 'mean' or 'std' only).*


**merged_df1** : *contains joined training set and test set observations.*

**tidydata** : *data set with the average of each variable for each activity and each subject.*



transformations
---------------
This transformations are written in sequential order as performed in the script.

* rename train_data and test_data column names with the descriptive variable names using the features file.

* search for matches to argument pattern ('mean' or 'std') using grepl function in order to obtain a subset of columns in the train and test data sets. train_data & test_data are re-defined and contain only columns including 'mean' or 'std' in their names.

* temp1_train is prepared by doing column bind of subject numbers and activity labels for the train set.
* temp2_train is prepared by doing column bind of temp1_train and observations for train set.

* temp1_test is prepared by doing column bind of subject numbers and activity labels for the test set.
* temp2_test is prepared by doing column bind of temp1_train and observations for test set.

* merged_df1 is prepared by doing row bind of temp2_train and temp_2 data frames.

* rename of activity numbers by descriptive names in the merged_df1 dataframe using the match function. These text values are obtained from the act_labels dataframe.

* averages are obtained by using dplyr library and chaining the functions groupby and summarise_all. 
