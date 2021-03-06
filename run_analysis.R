# This script will pull all of the data together for this experiment 
# and compile a clean, tidy dataset for downstream analysis



proj_ds_1 <- read.table("C:/Users/ohaganb/Desktop/BI and Analytics/Cloudera/GetCleanData/project/UCI HAR Dataset/train/subject_train.txt", header = FALSE, sep = "")
                                                            # reads in the first txt file
colnames(proj_ds_1) <- "Subject"
                                                            # adds a label for the column

proj_ds_2 <- read.table("C:/Users/ohaganb/Desktop/BI and Analytics/Cloudera/GetCleanData/project/UCI HAR Dataset/train/X_train.txt", header=FALSE, sep="")
                                                            # reads in the second txt file

ds_2_cols <- read.table("C:/Users/ohaganb/Desktop/BI and Analytics/Cloudera/GetCleanData/project/UCI HAR Dataset/features.txt", header=FALSE, sep="", stringsAsFactors = FALSE)
                                                            # reads in column names from
                                                            # features.txt file
ds_2_cols <- ds_2_cols[2]
                                                            # subset to keep only labels


colnames(ds_2_cols) <- "Labels"
                                                            # adds a label for the column


#colnames(proj_ds_2, do.NULL =TRUE)
#colnames(proj_ds_2[,1]) <- ds_2_cols[1,]


proj_ds_3 <- read.table("C:/Users/ohaganb/Desktop/BI and Analytics/Cloudera/GetCleanData/project/UCI HAR Dataset/train/y_train.txt", header=FALSE, sep="")
                                                            # reads in the third txt file
colnames(proj_ds_3) <- "Activity"
                                                            # adds a label for the column

proj_ds_all <- cbind(proj_ds_1, proj_ds_2)
                                                            # combines the 
                                                            # second txt file with the 
                                                            # first txt file



proj_ds_all <- cbind(proj_ds_all, proj_ds_3)                
                                                            # combines the 
                                                            # third txt file with the 
                                                            # first and second txt files
tidy <- summary(proj_ds_all)

#head(proj_ds_all)

write.table(tidy, "C:/Users/ohaganb/Desktop/BI and Analytics/Cloudera/GetCleanData/project/tidy.txt", row.name=FALSE)
