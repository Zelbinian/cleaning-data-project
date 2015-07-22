Steps
---
1. Downloaded the folder with the data from the Getting & Cleaning Data Course Project Page
2. Extracted the entire contents of the compressed folder
	a. set the R working directory to match the directory of the download
3. Load the "features" file with read.delim(sep="", header = F)
4. Transpose it using t() so it can be used for column names
5. For each data set (training and test)
    a. read in the data set using read.delim(header = F)
    b. set the names of the columns using the transposed features data from earlier
    c. read in the activity data using read.delim(header = F)
    d. add the activity data as a new column on the main data set and name the column
    e. read in the subjects data using read.delim(header = F)
    f. add the subject data as a new column on the main data set and name the column
6. Now that both data sets have been processed and have the same number of colummns
   with identical column names, they can be merged very easily (using...)
