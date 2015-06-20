# Getting Data Project
---
author: "Jesus Moreno"
date: "06/18/2015"
output: html_document
---


This scripts performs the following steps in the same order:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
    
## Prerequisites

In order to properly run the script, ensure that the following file is unzipped in the R working directory of the session: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

## Analysis

### Loading X and Y data sets for train and test data

The former link contains Test and Train data sets for a machine learning research project, using cellphone's sensors to identify the activities performed by the test subjects. The first step involves loading both X (independent variables) data sets into two data frames.

Since both data sets lack a header row with column names, the script is hardcoded to provide such variable labels. Columns names are based on the "features.txt", which is insde the "UCI HAR Dataset" folder. Also while loading the data sets, unwated columns are discarted.

The second step involves loading the train and test Y data sets. Both Y data sets contain a vector with the activities ID performed by the subjects. Each row of the vector corresponds to the same row of the X dataframe.

The third data load is the subject list of each case. This data can be found in the "subject_test.txt" file of each data case. The file contains a vector with subject's ID, since no descriptions are needed it will be fine as it is.

Last, load the data set containing activities descriptions. Since both test and train data share the same codes, one data load will sufice this time. 


### concatenating tables
The following concatenation procedures are performed in the order presented:

1. X Train Data Frame with Y Train Data Frame (columns wise)
2. X Test Data Frame with Y Test Data Frame (columns wise)
3. subject_test vector with the result of concatenate 1 (column wise)
4. subject_test vector with the result of concatenate 2 (column wise)
5. Result of the 3rd concatenation with result of the 4th concatenation (rows wise). From now on this result will be called **Complete Table**


### Merging tables

Since Y data sets only contain codes, it's important to add descriptions to make the data frame more understandable for humans. To achieve this the script uses the merge function.


### Grouping/pivoting data




```{r}
summary(cars)
```


