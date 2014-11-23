# Data folder location
datafiles <- "../tidydata_db/"

# read labels & activities
labels <- read.table(paste(datafiles,"activity_labels.txt", sep=""))
features <- read.table(paste(datafiles,"features.txt", sep=""))

# read RAW files - test set
test_subject <- read.table(paste(datafiles,"test/subject_test.txt", sep=""))
test_data <- read.table(paste(datafiles,"test/X_test.txt", sep=""))
test_activity <- read.table(paste(datafiles,"test/y_test.txt", sep=""))

# read RAW files - training set
train_subject <- read.table(paste(datafiles,"train/subject_train.txt", sep=""))
train_data <- read.table(paste(datafiles,"train/X_train.txt", sep=""))
train_activity <- read.table(paste(datafiles,"train/y_train.txt", sep=""))

# prepare DF with all variables
test_set <- cbind(test_subject, test_activity, test_data)
rm(test_subject, test_activity, test_data)
train_set <- cbind(train_subject, train_activity, train_data)
rm(train_subject, train_activity, train_data)

# merge test and traning dataset
data_merge <- rbind(test_set, train_set)
rm(test_set, train_set)

# Fix the columns names
colnames(data_merge) <- c("subject","activity",as.character(features[[2]])) 

# extract mean and std_dev
fields <- features[grep("[Mm]ean",features[[2]]),]
fields <- rbind(fields, features[grep("std",features[[2]]),])

# now subset the full data to find the right columns
data <- data_merge[ , c(1,2,fields$V1 + 2)]
rm(data_merge)

# Fix the activities names (field #2)
data$activity <- labels[match(data$activity,labels$V1), 2]

# Save the tidy data file
write.table(data, "tidydata.txt", sep=";", row.name=FALSE)