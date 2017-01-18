#DOWNLOAD DATASET
url <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
f <- file.path(getwd(),"UCI-HAR-dataset.zip")
download.file(url, f)
unzip('./UCI-HAR-dataset.zip')

#TEST DATA
x_test <- read.table("test/X_test.txt")
y_test <- read.table("test/Y_test.txt")
subj_test <- read.table("test/subject_test.txt")

#TEST SET DIMENSIONS
x_test_size <- dim(x_test)
y_test_size <- dim(y_test)
subj_test_size <- dim(subj_test)

#TRAIN DATA
x_train <- read.table("train/X_train.txt")
y_train <- read.table("train/Y_train.txt")
subj_train <- read.table("train/subject_train.txt")

#TRAINING SET DIMENSIONS
x_train_size <- dim(x_train)
y_train_size <- dim(y_train)
subj_train_size <- dim(subj_train)

#COMBINE TRAINING AND TEST DATA
x_total <- rbind(x_test, x_train)
y_total <- rbind(y_test, y_train)
subj_total <- rbind(subj_test, subj_train)

#X matrice is filled with 561 variables, all of which are labeled in
#features.txt file. X_total therefore will be labeled by the features
#file.
features <- read.table("features.txt")
colnames(x_total) <- features[,2]
#Remove the hyphens in the column names
colnames(x_total) <- gsub("-", " ",colnames(x_total))

#Select mean and standard deviations measurements.
x_mean <- x_total[,grepl("mean",colnames(x_total))]
x_std <- x_SD <- x_total[,grepl("std",colnames(x_total))]
x_mean_std <- cbind(x_mean,x_std)
#check size
x_mean_std_size <- dim(x_mean_std)

#LOAD ACTIVITY LABELS
activity_names <- read.table("activity_labels")

#Rename subj_total, y_total, activities, and colnames
y_total[,1] <- activity_names[y_total[,1],2]
colnames(y_total) <- "Activity"
colnames(subj_total) <- "SubjectID"

#Combine subj_total, y_total, and x_means_std
total_data <- cbind(subj_total,y_total,x_mean_std)

#Clean up names
names(total_data) <- gsub("\\", " ", names(total_data))

#SAVE NEW TABLE
write.table(total_data,"./Complete.txt",row.names = FALSE)


#FINAL STEP
#CREATE TIDY IND. DATASET W/ MEANS OF ALL DATA
total_mean <- aggregate(x=total_data, by=list(activity=total_data$Activity, subjectID=total_data$SubjectID), FUN=mean)
total_mean$subjectID <- NULL
total_mean$Activity <- NULL

write.table(total_mean,"./Complete_means.txt",row.names = FALSE)






