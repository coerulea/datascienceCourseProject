datascienceCourseProject
========================

This repo contains the course project for the coursera course getting and cleaning data

==================================================================
Human Activity Recognition Using Smartphones Dataset
Version 2.0
==================================================================

The raw data set contained measurements on sensor signals (accelerometer and gyroscope) on a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset was randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

==================================================================
A brief description of each record provided in the provided datasets:
==================================================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

The raw data was further processed into the training and test sets containing calculated mean, standard deviations and frequency measures for each subject and for each activity. This processed dataset was used to arrive at the two tidy datasets described below:

==================================================================
Description of the two tidy datasets and steps taken to create them
==================================================================

MeasuredMeanStd:

This dataset contains an aggergate of all measured means and standard deviations from training and test sets. The following steps were taken to create this dataset:

1. Merged the X_test and y_test data and used the features file to name the variables
2. Merged the X_train and y_train and used the features file to name the variables
3. Merged the the training and test datasets into one dataset - this file contains 563 variables and 10299 observations
4. Re-coded the test data variable to reflect the actual activity names for easier reading
5. Extracted all the variables with mean and standard deviation measures aong with the subject and activity variables to create the final tidy dataset - this dataset contains 68 variables and 10299 observations

==================================================================

Average of Mean and Std measures:

This dataset is created by transforming the variables from the previous iteration. This was done by creating the average of each variable for each activity and each subject. The final dataset is arranged by summarizing by subject for each activity for each mean and standard deviation variable

==================================================================
Notes for running the code: 
==================================================================
Please extract the following files into your working directory before the running the code:
1. activity_labels.txt
2. features.txt
3. subject_test
4. X_test
5. y_test
6. subject_train
7. X_train
8. y_train

Additional Packages required:
1. reshape2

==================================================================
Citation:
1. Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human 2. Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
3. http://tgmstat.wordpress.com/2013/10/31/reshape-and-aggregate-data-with-the-r-package-reshape2/
4. Coursera discussion forums
5. Stack Overflow