library(readtext)
library(dplyr)
library(gsubfn)

subjects_train<- readLines("UCI HAR Dataset/train/subject_train.txt")
subjects_test <- readLines("UCI HAR Dataset/test/subject_test.txt")
labels_train_data <- readLines("UCI HAR Dataset/train/y_train.txt")
labels_train_data <- gsubfn(".",list("1"="WALKING","2"="WALKING UPSTAIRS","3"="WALKING DOWNSTAIRS","4"="SITTING","5"="STANDIND",
                                     "6"="LAYING"),labels_train_data)
labels_test_data <- readLines("UCI HAR Dataset/test/y_test.txt")
labels_test_data <- gsubfn(".",list("1"="WALKING","2"="WALKING UPSTAIRS","3"="WALKING DOWNSTAIRS","4"="SITTING","5"="STANDIND",
                                    "6"="LAYING"),labels_test_data)

col_names_data <- read.delim("UCI HAR Dataset/features.txt",header = FALSE, sep = "")  ##First
##col_names_data <- make.names(as.vector(col_names_data[,2]),unique = TRUE)    ##Second

x_train_data <- tbl_df(read.delim("UCI HAR Dataset/train/X_train.txt",header = FALSE, sep = "",col.names = col_names_data[,2])) %>%
  mutate(ID = subjects_train, Activity = labels_train_data)
x_test_data <- tbl_df(read.delim("UCI HAR Dataset/test/X_test.txt",header = FALSE, sep = "",col.names = col_names_data[,2])) %>%
  mutate(ID = subjects_test,Activity = labels_test_data)


merged_data <- rbind(x_train_data,x_test_data) ##gsub("-","_",colnames(merged_data))

mean_sd_data <- merged_data[,grepl("mean",colnames(merged_data)) | grepl("std",colnames(merged_data)) | colnames(merged_data) ==
                              "ID" | colnames(merged_data) == "Activity" ] 

mean_act_ID_data <- mean_sd_data %>% group_by(Activity,ID) 
final_data <- summarise_each(mean_act_ID_data,funs(mean))
write.table(final_data,file = "tidy data set.txt",row.names = FALSE)
