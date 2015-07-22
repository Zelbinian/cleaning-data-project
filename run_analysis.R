# load in in the raw data sets; they don't have headers, so overriding the default
testData <- read.table("test/X_test.txt", header = F)
trainData <- read.table("train/X_train.txt", header = F)

# combining them into one data frame
fullData <- rbind(testData, trainData)

# the column headers are stored in the features file
# this reads it in, and then sets that column to be the column names for the data
# this skips storing any of that in an additional variable or two because they're not
# necessary for any other computations
names(fullData) <- t(read.table("features.txt", header = F)[,2])

# Now to reduce the dataset to just the columns for means and std dev.
# The codebook that comes with the data says that the variable names are annotated
# with "mean()" and "std()", respectively

# first, using grep to get the columns we want
meanCols <- grep("mean\\(\\)", names(fullData))
stdCols <- grep("std\\(\\)", names(fullData))

# putting them together into one vector and then subsetting with it
meansAndStds <- fullData[, c(meanCols, stdCols)]