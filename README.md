gcdata
======

GC-Data-Class-Exercise
This repository contains my course project for the Coursera course "Getting and Cleaning data"

Test Set data
------------------

Raw 561 features are unlabeled and can be read from test/X_test.txt. 
Activity labels are defined in test/Y_test.txt file.
All Test subjects are available in test/subject_test.txt file.

Training Set Data
--------------------
Raw 561 features are unlabeled and can be read from train/X_train.txt. 
Activity labels are defined in train/Y_train.txt file.
All  subjects are available in train/subject_train.txt file.

Script and Tidy.txt
-------------------
The script is named run_analysis.R as per instruction. It merges the test and training data sets and replaces the activity codes with readable labels and removes the unnecessary data in the form of mean of subject or activity columns.

Prereqs:

1. the UCI HAR Dataset must be extracted from the same directory as the run_analysis.R
2. the UCI HAR Datasetmust be in directory named "UCI HAR Dataset"

The script creates a tidy data set containing the means of all the columns per test subject and per activity.

This tidy dataset is written to a tab ("\t") delimited file called tidy.txt in the same directory as the run_analysis.R file and available in the repository.

Code Book
-------------------
The CodeBook.md file explains all the transformations and their resulting data and variables.


