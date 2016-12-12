# Project - Getting and Cleaning data

# The purpose of this project is to demonstrate your ability to collect, work with, 
# and clean a data set. The goal is to prepare tidy data that can be used for later 
# analysis. 

#install.packages("data.table","reshape2","dplyr")
library(data.table, reshape2, dplyr)

# Download & Unzip the data

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

temp <- tempfile()
download.file(url, dest=temp, mode="wb") 
if (!file.exists("UCI HAR Dataset")){
  unzip (temp, exdir = "./")
}
unlink(temp)

path <- getwd()

# Read the data

### Read the subject files

subjectTrain <- fread(file.path(path, "UCI HAR Dataset/train", "subject_train.txt"))
subjectTest <- fread(file.path(path,"UCI HAR Dataset/test","subject_test.txt"))

### Read the activity index files

activityindexTrain <- fread(file.path(path, "UCI HAR Dataset/train", "y_train.txt"))
activityindexTest <- fread(file.path(path,"UCI HAR Dataset/test","y_test.txt"))

### Read the activity files

activityTrain <- fread(file.path(path, "UCI HAR Dataset/train", "X_train.txt"))
activityTest <- fread(file.path(path,"UCI HAR Dataset/test","X_test.txt"))

# 1. Merges the training and the test sets to create one data set.

### Merge by rows
subject <- rbind(subjectTrain, subjectTest)
names(subject) <- "subject"
activityindex <- rbind(activityindexTrain, activityindexTest)
names(activityindex) <- "activityindex"
activity <- rbind(activityTrain, activityTest)

### Merge by columns
dt <- cbind(subject, activityindex, activity)

### Set key
setkey(dt, subject, activityindex)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement.

### Read feature file
feature <- fread(file.path(path, "UCI HAR Dataset/", "features.txt"))
names(feature) <- c("featurenum", "featurename")

### Subset only the mean and std for each measurement
subset <- feature[grepl("mean\\(\\)|std", featurename)]

### Convert the column numbers to a vector of variable names matching columns in dt.
subset$featurecode <- subset[, paste0("V", featurenum)]

### Subset these variables using code
selection <- c(key(dt), subset$featurecode)
dt <- subset(dt, select=selection)

# 3. Uses descriptive activity names to name the activities in the data set

### Read the activity label file
activitylabel <- fread(file.path(path,"UCI HAR Dataset/activity_labels.txt"))
names(activitylabel) <- c("activityindex","activityname")

###Merge data with activity description
dt <- merge(dt, activitylabel, by="activityindex", all.x=TRUE)

###Set activity name as key 
setkey(dt, subject, activityindex, activityname)

# 4. Appropriately labels the data set with descriptive variable names.

### Reshape dataset from wide to long table 
dtLong <- melt(dt,id.vars=c("subject", "activityindex", "activityname"))
names(dtLong)[4] <- "featurecode"

### Merge variable description to dataset
setkey(dtLong, subject, activityindex, activityname,featurecode)
dtLong <- merge(dtLong, subset, by="featurecode",all.x=TRUE)
dtLong = dtLong %>% select(subject, activityindex, activityname, featurenum, featurecode, featurename, value)

# 5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

tidy <- summarize(group_by(dtLong,subject,activityname,featurename), mean=mean(value))
write.table(tidy,"tidy.txt",quote=FALSE,row.names=FALSE)
