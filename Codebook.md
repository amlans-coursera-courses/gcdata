#CodeBook for tidy.txt dataset

##Source 

This dataset is generated from "Human Activity Recognition Using Smartphones Data Set V1.0" avaiable at [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 
[The zip file](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/) available at this location MUST BE extracted at the same level as run_analysis.R and there should be an "UCI HAR Dataset" directory at this level.

##Feature Selection

Please refer to the [README.md](https://github.com/amlanc/gcdata/blob/master/README.md) at the [repository](https://github.com/amlanc/gcdata) and **"features_info.txt"** file in the **"UCI HAR DATASET"** to learn more about feature selection criteria. Essentially it says, 
```
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).
```

The project assignment explicitly instructs us to ** 2. Extracts only the measurements on the mean and standard deviation for each measurement **.  That is why all variables having anything to to do with __Mean__ or __Std__ has been included in the feature set. 

#####NOTE: '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

###List of features 
#####(as defined in features_info.txt)
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated (and kept for this assignment) from these signals are:

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. 
These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean


#### All other features have been removed from the resultant dataset for the purpose of this excercise. The code is also extensively commented to describe the transformation of data at each step.

##### Note: A variable name like *tbodyaccmeanx*, means it is representing __mean__ of tBodyAcc-XYZ variable
