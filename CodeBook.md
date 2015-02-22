# Code Book

## Raw Data Collection

The original data was sourced from
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

The data has been described at
[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

The raw data has no units since it's normalised and bound between `[-1, 1]`.

## Data Transformation

The raw data files were processed with `run_analysis.R` script to create a tidy
data set.

### 1. Combine data files to form complete training and test datasets.

The training and test datasets were each split into three files that had the
same number of rows:

1. `X_train.txt`: The set of all the features.
2. `Y_train.txt`: Activity ID for the record.
3. `subject_train.txt`: SubjectID for the record.

These three files were merged to form a single trainingData set. ActivityId was
added as `activityId` and SubjectId was added as `subjectId`.

### 2. Combine training and test datasets

The test and training datasets were combined to form a single dataset called
`dataSet`.

### 3. Extract mean and standard deviation measurements

All the columns that did not represent a mean or a standard deviation
measurement was then removed from the dataset. The set of features is available
in the file `features.txt`.
Any feature that did not have `mean` or `std` in the name was considered to be
not relevant to the project - exclusions were made for `activityId` and
`subjectId`.

### 4. Use descriptive activity names

A new column called `activity` was added to the dataSet that represented the
actual activity name instead of the integer representation.

The activity labels were as under:

| ID | Activity |
| -- | -------- |
| 1 | WALKING |
| 2 | WALKING_UPSTAIRS |
| 3 | WALKING_DOWNSTAIRS |
| 4 | SITTING |
| 5 | STANDING |
| 6 | LAYING |

### 5. Add descriptive label names

Labels were then added to the rest of the columns of the dataset. The label
names were changes from the original names in `features.txt` to be better column
names and more readable.

#### 6. Create a tidy set

The `dataSet` was then used to create a summary set where all the numeric
variables are averaged by activity and subject.

## Data Summary

The final `dataSet` that was used to create the summary consisted of 10299 rows.

`tidy.txt` contains a file with the following columms:

```
Subject
  The SubjectID - INTEGER
Activity
  Activity Name - One of:
    WALKING
    WALKING_UPSTAIRS
    WALKING_DOWNSTAIRS
    SITTING
    STANDING
    LAYING
TimeBodyAccMeanX
TimeBodyAccMeanY
TimeBodyAccMeanZ
TimeBodyAccStdDevX
TimeBodyAccStdDevY
TimeBodyAccStdDevZ
TimeGravityAccMeanX
TimeGravityAccMeanY
TimeGravityAccMeanZ
TimeGravityAccStdDevX
TimeGravityAccStdDevY
TimeGravityAccStdDevZ
TimeBodyAccJerkMeanX
TimeBodyAccJerkMeanY
TimeBodyAccJerkMeanZ
TimeBodyAccJerkStdDevX
TimeBodyAccJerkStdDevY
TimeBodyAccJerkStdDevZ
TimeBodyGyroMeanX
TimeBodyGyroMeanY
TimeBodyGyroMeanZ
TimeBodyGyroStdDevX
TimeBodyGyroStdDevY
TimeBodyGyroStdDevZ
TimeBodyGyroJerkMeanX
TimeBodyGyroJerkMeanY
TimeBodyGyroJerkMeanZ
TimeBodyGyroJerkStdDevX
TimeBodyGyroJerkStdDevY
TimeBodyGyroJerkStdDevZ
TimeBodyAccMagMean
TimeBodyAccMagStdDev
TimeGravityAccMagMean
TimeGravityAccMagStdDev
TimeBodyAccJerkMagMean
TimeBodyAccJerkMagStdDev
TimeBodyGyroMagMean
TimeBodyGyroMagStdDev
TimeBodyGyroJerkMagMean
TimeBodyGyroJerkMagStdDev
FrequencyBodyAccMeanX
FrequencyBodyAccMeanY
FrequencyBodyAccMeanZ
FrequencyBodyAccStdDevX
FrequencyBodyAccStdDevY
FrequencyBodyAccStdDevZ
FrequencyBodyAccJerkMeanX
FrequencyBodyAccJerkMeanY
FrequencyBodyAccJerkMeanZ
FrequencyBodyAccJerkStdDevX
FrequencyBodyAccJerkStdDevY
FrequencyBodyAccJerkStdDevZ
FrequencyBodyGyroMeanX
FrequencyBodyGyroMeanY
FrequencyBodyGyroMeanZ
FrequencyBodyGyroStdDevX
FrequencyBodyGyroStdDevY
FrequencyBodyGyroStdDevZ
FrequencyBodyAccMagMean
FrequencyBodyAccMagStdDev
FrequencyBodyAccJerkMagMean
FrequencyBodyAccJerkMagStdDev
FrequencyBodyGyroMagMean
FrequencyBodyGyroMagStdDev
FrequencyBodyGyroJerkMagMean
FrequencyBodyGyroJerkMagStdDev
  All of these fields are a mean of the original values which were bound between
  [-1, 1]. The mean is also therefore bound between [-1, 1] without any units.
```

## Output

1. An intermediate file called `processedData.txt` is created for
   debugging/verification purpose.
2. The output file is written as `tidy.txt`
3. The data table is also returned back by the script according to the
   specifications.
