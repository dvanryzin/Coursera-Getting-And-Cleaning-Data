CodeBook for the Tidy Dataset Output

Data source

This source data for the this analysis comes from the "Human Activity Recognition Using Smartphones Data Set" which was originally made available from: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Feature Selection 

The README and features.txt files in the source dataset contain more details regarding the feature selection for this dataset. There can be found the following description:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally, a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The reason for  selection of these features is that the project states "Extract only the measurements on the mean and standard deviation for each measurement." To be complete, all variables related to mean or standard deviation were included.

In order to derive the resulting dataset, these signals were used to estimate variables of the feature vector for each pattern:

 '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
•tBodyAcc-XYZ
•tGravityAcc-XYZ
•tBodyAccJerk-XYZ
•tBodyGyro-XYZ
•tBodyGyroJerk-XYZ
•tBodyAccMag
•tGravityAccMag
•tBodyAccJerkMag
•tBodyGyroMag
•tBodyGyroJerkMag
•fBodyAcc-XYZ
•fBodyAccJerk-XYZ
•fBodyGyro-XYZ
•fBodyAccMag
•fBodyAccJerkMag
•fBodyGyroMag
•fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

•mean(): Mean value
•std(): Standard deviation

Additional vectors were obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

•gravityMean
•tBodyAccMean
•tBodyAccJerkMean
•tBodyGyroMean
•tBodyGyroJerkMean

Other estimates have been removed as they were deemed superfluous for this project.

The resulting 'tidy' variable names are of the form: tbodyaccmeanx, which means the mean value of tBodyAcc-XYZ.
