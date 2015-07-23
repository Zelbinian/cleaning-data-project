# TODO: check to see if current directory has the data

# loading necessary libraries
library(reshape2)

# load in in the raw data sets; they don't have headers, so overriding the default
# combining them into one data frame
rawData <- rbind(read.table("train/X_train.txt", header = F), #training data
                 read.table("test/X_test.txt", header = F))   #test data

# the column headers are stored in the features file
# this reads it in, and then sets that column to be the column names for the data
# this skips storing any of that in an additional variable or two because they're not
# necessary for any other computations
names(rawData) <- t(read.table("features.txt", header = F)[,2])

# Now to reduce the dataset to just the columns for means and std dev.
# The codebook that comes with the data says that the variable names are annotated
# with "mean()" and "std()", respectively

# first, using grep to get the columns we want
meanCols <- grep("mean\\(\\)", names(rawData))
stdCols <- grep("std\\(\\)", names(rawData))

# putting them together into one vector and then subsetting with it
cleanData <- rawData[, c(meanCols, stdCols)]

# Next, our clean data needs a column telling us which activity each row represents

# read in the numerical activity labels for both data sets and combine them into a vector
activity <- c(read.table("train/y_train.txt", header = F)[,1], #training data
              read.table("test/y_test.txt", header = F)[,1])   #test data

                                    # adding an activity column to the dataframe
cleanData$activity <- factor(       # which is a factor variable I'm creating
    activity,                       # from a combined vector of activity labels
    labels = c("walking", "upstairs", "downstairs", "standing", "sitting", "laying"))

# fixing some typos in the column names from the original dataset
names(cleanData)[grep("BodyBody", colnames(cleanData))] <- 
    c("fBodyAccJerkMag-mean()", "fBodyGyroMag-mean()", "fBodyGyroJerkMag-mean()",
      "fBodyAccJerkMag-std()", "fBodyGyroMag-std()", "fBodyGyroJerkMag-std()")

# loading in the subject data from the training and test files, combining them into a vector
subjects <- c(read.table("train/subject_train.txt", header = F)[,1], #training data
              read.table("test/subject_test.txt", header = F)[,1])   #test data

# attaching subject data to the data frame
cleanData$subject <- factor(subjects)

#tidying it up by melting and recasting
# first melting based on the factor variables
melted <- melt(cleanData, id=c(67:68), measure=c(1:66))
# then recasting by applying the mean function to every variable, based on each
# activty/subject group
finalData <- dcast(melted, subject + activity ~ variable, mean)
