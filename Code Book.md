
-------------
#Study Design
-------------
The data was collected from the web site of the experiment: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

-------------
#Code Book
-------------
* "subjects_test","subjects_train" : is a vector the ID for each subject in the train and test data sets.
* "labels_test","labels_train"     : is a vector of the activity labels for each measure in the train and test data sets.
* "col_names_data"                 : is a data frame with two vectors, being the second one a vector with the names of the                                              features measured (561).
* "x_train_data","x_test_data"     : are tables with all the measures for each feature (columns) by each subject (rows), have                                         been added two more columns (Activity,ID) with the mutate() function.
* "merged_data"                    : "x_train_data" and "x_test_data" data merged in one table.
* "mean_sd_data"                   : measurements made on the mean or standard deviation features of the "merged_data".
* "mean_act_ID_data"               : "mean_sd_data" grouped by 'Activity' and 'ID'.
* "final_data"                     : independent tidy data set with the average of each variable for each activity and each                                           subject.