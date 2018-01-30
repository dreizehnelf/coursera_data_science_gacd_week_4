==================================================================
Simplified Human Activity Recognition Using Smartphones Datasets
Version 1.0
==================================================================
Michael Hengherr
michael@hengherr.de
==================================================================

This dataset is based on:

Human Activity Recognition Using Smartphones Dataset
Version 1.0

Most of the data has been taken as it was in the original dataset and information about that
data can be obtained from [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] or after running the `run_analysis.R` script in
the created `UCI HAR Dataset` directory which then contains the original downloaded data.

==================================================================
Modifications to the original data:
==================================================================

The original records include:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The activity labels and subject data of the original dataset are stored in separate files and normalized, which makes a quick analysis/ harder than necessary.

Therefore these simplified datasets provide the following modifications:

For the base dataset (`dist/dataset.txt`):

- The subject IDs have been inlined as `iSubjectId` integer column
- The activity labels have been denormalised and also inlined as `cActivity` character column
- The feature labels have been inlined as column headers (with cleanup of unsupported column namen characters like "(", ")" and "," to simple "." characters.)
- The original huge feature vector has been cut down to the following original fields (only the `*-mean()*` and `*-std()*` features - please see `features_info.txt` in the original documentation for more info.):

	1. tBodyAcc-mean()-X
	1. tBodyAcc-mean()-Y
	1. tBodyAcc-mean()-Z
	1. tBodyAcc-std()-X
	1. tBodyAcc-std()-Y
	1. tBodyAcc-std()-Z
	1. tGravityAcc-mean()-X
	1. tGravityAcc-mean()-Y
	1. tGravityAcc-mean()-Z
	1. tGravityAcc-std()-X
	1. tGravityAcc-std()-Y
	1. tGravityAcc-std()-Z
	1. tBodyAccJerk-mean()-X
	1. tBodyAccJerk-mean()-Y
	1. tBodyAccJerk-mean()-Z
	1. tBodyAccJerk-std()-X
	1. tBodyAccJerk-std()-Y
	1. tBodyAccJerk-std()-Z
	1. tBodyGyro-mean()-X
	1. tBodyGyro-mean()-Y
	1. tBodyGyro-mean()-Z
	1. tBodyGyro-std()-X
	1. tBodyGyro-std()-Y
	1. tBodyGyro-std()-Z
	1. tBodyGyroJerk-mean()-X
	1. tBodyGyroJerk-mean()-Y
	1. tBodyGyroJerk-mean()-Z
	1. tBodyGyroJerk-std()-X
	1. tBodyGyroJerk-std()-Y
	1. tBodyGyroJerk-std()-Z
	1. tBodyAccMag-mean()
	1. tBodyAccMag-std()
	1. tGravityAccMag-mean()
	1. tGravityAccMag-std()
	1. tBodyAccJerkMag-mean()
	1. tBodyAccJerkMag-std()
	1. tBodyGyroMag-mean()
	1. tBodyGyroMag-std()
	1. tBodyGyroJerkMag-mean()
	1. tBodyGyroJerkMag-std()
	1. fBodyAcc-mean()-X
	1. fBodyAcc-mean()-Y
	1. fBodyAcc-mean()-Z
	1. fBodyAcc-std()-X
	1. fBodyAcc-std()-Y
	1. fBodyAcc-std()-Z
	1. fBodyAccJerk-mean()-X
	1. fBodyAccJerk-mean()-Y
	1. fBodyAccJerk-mean()-Z
	1. fBodyAccJerk-std()-X
	1. fBodyAccJerk-std()-Y
	1. fBodyAccJerk-std()-Z
	1. fBodyGyro-mean()-X
	1. fBodyGyro-mean()-Y
	1. fBodyGyro-mean()-Z
	1. fBodyGyro-std()-X
	1. fBodyGyro-std()-Y
	1. fBodyGyro-std()-Z
	1. fBodyAccMag-mean()
	1. fBodyAccMag-std()
	1. fBodyBodyAccJerkMag-mean()
	1. fBodyBodyAccJerkMag-std()
	1. fBodyBodyGyroMag-mean()
	1. fBodyBodyGyroMag-std()
	1. fBodyBodyGyroJerkMag-mean()
	1. fBodyBodyGyroJerkMag-std()

	Those features are now accessible in the respective columns:

	1. tBodyAcc.mean.X
	1. tBodyAcc.mean.Y
	1. tBodyAcc.mean.Z
	1. tBodyAcc.std.X
	1. tBodyAcc.std.Y
	1. tBodyAcc.std.Z
	1. tGravityAcc.mean.X
	1. tGravityAcc.mean.Y
	1. tGravityAcc.mean.Z
	1. tGravityAcc.std.X
	1. tGravityAcc.std.Y
	1. tGravityAcc.std.Z
	1. tBodyAccJerk.mean.X
	1. tBodyAccJerk.mean.Y
	1. tBodyAccJerk.mean.Z
	1. tBodyAccJerk.std.X
	1. tBodyAccJerk.std.Y
	1. tBodyAccJerk.std.Z
	1. tBodyGyro.mean.X
	1. tBodyGyro.mean.Y
	1. tBodyGyro.mean.Z
	1. tBodyGyro.std.X
	1. tBodyGyro.std.Y
	1. tBodyGyro.std.Z
	1. tBodyGyroJerk.mean.X
	1. tBodyGyroJerk.mean.Y
	1. tBodyGyroJerk.mean.Z
	1. tBodyGyroJerk.std.X
	1. tBodyGyroJerk.std.Y
	1. tBodyGyroJerk.std.Z
	1. tBodyAccMag.mean
	1. tBodyAccMag.std
	1. tGravityAccMag.mean
	1. tGravityAccMag.std
	1. tBodyAccJerkMag.mean
	1. tBodyAccJerkMag.std
	1. tBodyGyroMag.mean
	1. tBodyGyroMag.std
	1. tBodyGyroJerkMag.mean
	1. tBodyGyroJerkMag.std
	1. fBodyAcc.mean.X
	1. fBodyAcc.mean.Y
	1. fBodyAcc.mean.Z
	1. fBodyAcc.std.X
	1. fBodyAcc.std.Y
	1. fBodyAcc.std.Z
	1. fBodyAccJerk.mean.X
	1. fBodyAccJerk.mean.Y
	1. fBodyAccJerk.mean.Z
	1. fBodyAccJerk.std.X
	1. fBodyAccJerk.std.Y
	1. fBodyAccJerk.std.Z
	1. fBodyGyro.mean.X
	1. fBodyGyro.mean.Y
	1. fBodyGyro.mean.Z
	1. fBodyGyro.std.X
	1. fBodyGyro.std.Y
	1. fBodyGyro.std.Z
	1. fBodyAccMag.mean
	1. fBodyAccMag.std
	1. fBodyBodyAccJerkMag.mean
	1. fBodyBodyAccJerkMag.std
	1. fBodyBodyGyroMag.mean
	1. fBodyBodyGyroMag.std
	1. fBodyBodyGyroJerkMag.mean
	1. fBodyBodyGyroJerkMag.std	

Another dataset has been created with breakouts of the feature averages by test subject and activity (`dist/averages.txt`):

- It contains one row for each subject/activity pair
- All feature columns (from columns 3 on) contain the average of the features for all observations with the subject/activity pair in the base dataset

For any other information on the dataset/features (including additional notes, license, etc.), please refer to the original documentation.

==================================================================
Data format:
==================================================================

Both datasets in the `dist` folder (after running `run_analysis.R`) are *tab delimited* text files.

They can easily be loaded in R with the `read.table` command i.e. like this:

```
data <- read.table("dist/dataset.txt", sep="\t", header=TRUE);
```
