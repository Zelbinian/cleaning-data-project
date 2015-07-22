# load in each of the data sets; they don't have headers, so header = F is necessary

varNames <- read.table("features.txt", header = F)
testData <- read.table("test/X_test.txt", header = F)
trainData <- read.table("train/X_train.txt", header = F)

# prepare the varNames data to be used as column headers
varNames <- t(varNames[,2])

# assign the names to be the column headers
names(testData) <- varNames
names(trainData) <- varNames