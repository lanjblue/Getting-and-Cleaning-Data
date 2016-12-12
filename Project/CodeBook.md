# Cood Book

## Description
Description of the variables, the data, and any transformations or work that were performed to clean up the data

## Source Data
A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Data Set Information
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

## Attribute Information

For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

## Steps for data processing

### 1. Merge the training and the test sets to create one data set.

load and merge the follwing data files into one data set:

features.txt
activity_labels.txt
subject_train.txt
x_train.txt
y_train.txt
subject_test.txt
x_test.txt
y_test.txt

### 2. Extract only the measurements on the mean and standard deviation for each measurement.

Use grepl to create a subset that contains only mean() and std() columns.

### 3. Use descriptive activity names to name the activities in the data set

Merge data subset by the activityindex to include the descriptive activity names.

### 4. Appropriately label the data set with descriptive activity names.

Transform the subset from wide to long table. Merge it with featurecode to include the description of the activity names. 

### 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

Use summarize function to calculate the average of each variable for each activity and each subjects. 

## Final tidy file
The tidy data set is written into "tidy.txt". 

### Identifiers of the tidy file

subject - The ID of the test subject
activityname - The type of activity performed when the corresponding measurements were taken

### Measurement 
1 tBodyAcc-mean()-X
2 tBodyAcc-mean()-Y
3 tBodyAcc-mean()-Z
4 tBodyAcc-std()-X
5 tBodyAcc-std()-Y
6 tBodyAcc-std()-Z
7 tGravityAcc-mean()-X
8 tGravityAcc-mean()-Y
9 tGravityAcc-mean()-Z
10 tGravityAcc-std()-X
11 tGravityAcc-std()-Y
12 tGravityAcc-std()-Z
13 tBodyAccJerk-mean()-X
14 tBodyAccJerk-mean()-Y
15 tBodyAccJerk-mean()-Z
16 tBodyAccJerk-std()-X
17 tBodyAccJerk-std()-Y
18 tBodyAccJerk-std()-Z
19 tBodyGyro-mean()-X
20 tBodyGyro-mean()-Y
21 tBodyGyro-mean()-Z
22 tBodyGyro-std()-X
23 tBodyGyro-std()-Y
24 tBodyGyro-std()-Z
25 tBodyGyroJerk-mean()-X
26 tBodyGyroJerk-mean()-Y
27 tBodyGyroJerk-mean()-Z
28 tBodyGyroJerk-std()-X
29 tBodyGyroJerk-std()-Y
30 tBodyGyroJerk-std()-Z
31 tBodyAccMag-mean()
32 tBodyAccMag-std()
33 tGravityAccMag-mean()
34 tGravityAccMag-std()
35 tBodyAccJerkMag-mean()
36 tBodyAccJerkMag-std()
37 tBodyGyroMag-mean()
38 tBodyGyroMag-std()
39 tBodyGyroJerkMag-mean()
40 tBodyGyroJerkMag-std()
41 fBodyAcc-mean()-X
42 fBodyAcc-mean()-Y
43 fBodyAcc-mean()-Z
44 fBodyAcc-std()-X
45 fBodyAcc-std()-Y
46 fBodyAcc-std()-Z
47 fBodyAccJerk-mean()-X
48 fBodyAccJerk-mean()-Y
49 fBodyAccJerk-mean()-Z
50 fBodyAccJerk-std()-X
51 fBodyAccJerk-std()-Y
52 fBodyAccJerk-std()-Z
53 fBodyGyro-mean()-X
54 fBodyGyro-mean()-Y
55 fBodyGyro-mean()-Z
56 fBodyGyro-std()-X
57 fBodyGyro-std()-Y
58 fBodyGyro-std()-Z
59 fBodyAccMag-mean()
60 fBodyAccMag-std()
61 fBodyBodyAccJerkMag-mean()
62 fBodyBodyAccJerkMag-std()
63 fBodyBodyGyroMag-mean()
64 fBodyBodyGyroMag-std()
65 fBodyBodyGyroJerkMag-mean()
66 fBodyBodyGyroJerkMag-std()

### Activity Labels

WALKING (num=1): subject was walking during the test
WALKING_UPSTAIRS (num=2): subject was walking up a staircase during the test
WALKING_DOWNSTAIRS (num=3): subject was walking down a staircase during the test
SITTING (num=4): subject was sitting during the test
STANDING (num=5): subject was standing during the test
LAYING (num=6): subject was laying down during the test
