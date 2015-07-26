# Purpose

This script runs an analysis on the UCI HAR Dataset, which contains gyroscopic measurements from a Samsung Galaxy S2 phone. It produces a tidy data set featuring one row for each unique subject/activity pairing with the averages for the variables discussed below.

# Instructions

If you already have the data downloaded and extracted: (preferred)
1. Make sure you maintained the file structure when you ran the extraction
2. Download the run_analysis.r file to the root directory of the extracted data
3. Run the script

If you have not:
1. Download the run_analysis.r file to the root directory of the extracted data
2. Run the script. The script will download an unpack the files for you. (This is somewhat unsafe as it has not been tested extensively on different computer setups.)

# How the script works

1. Checks to see if all the files necessary are there in the structure it expects. (This is the same structure as the default extraction would provide.)If not, it downloads and unpacks them.
2. Reads in the training and test data and stacks them on top of one another in that order.
3. Grabs the column names from the features file by loading it in, transposing it, and then setting it.
4. Subsets the dataset by selecting only the columns that represent means and standard deviations, by way of grep
5. Adds an activity column to the dataset. It reads in the activity training and test data, combines them into a single vector, converts it into a character factor variable, and then sets it to a new column in the dataset.
6. Adds a subject column to the dataset in a similar manner.
7. Melts and recasts the data (using the reshape2 commands) based on the activity and subject factor variables, creating a new dataset that averages all of the other columns for each unique subject/activity pair.
8. The script then cleans up the r environment and any files it may have downloaded. (If run from inside the root of an already-downloaded and unpacked dataset, unlink won't find the files it's trying to unlink, so it will do nothing.)

# Codebook

The variable names come from the original dataset. This data scientist has chosen not to rename or re-represent data that he doesn't totally understand. The variables stand for various types of measurements from accelerometers and gyroscopes. I have included the write up from the original readme below for those interested in the details of what the variable names might mean.

## Variables in the tidy data set
This is not a full list of all 68 variables, but rather a way to help you decode what the variable names mean.
Notes:
1. The suffix '-XYZ' is short hand for there being one variable for each dimension. E.g. When you see tBodyAcc-XYZ this is actually 3 variables in the tidy dataset, tBodyAcc-X, tBodyAcc-Y, and tBodyAcc-Z.
2. Each variable in the dataset is a mean of means (demarcated by a "-mean()" suffix in the data) for each participant, or a mean of standard deviations (demarcated by a "-std()" suffice in the data).


tBodyAcc-XYZ			
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

## Write up from the original readme
The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.