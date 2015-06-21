---
author: "Jesus Moreno"
date: "06/18/2015"
output: html_document
---

# Getting Data Project

## Introduction

The script in general performs the following steps:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

As indicated in the project instructions for Coursera's Getting and Cleaning Data cousera.
    
## Prerequisites for running the scripts

In order to properly run the script, ensure that the following file is unzipped in the R working directory of the session: <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>

If there's an internet connection available, the script will try to download the zipped file. Else ensure that the proper file is in the root of the working directiry. 

Also the script uses the reshape2 library. If unavailable use the following code to install:

```{r}
install.packages("reshape2",dependencies = c("Depends", "Imports", "LinkingTo", "Suggests", "Enhances"))
```

Last but not least, R must installed in order to run the code.


## Analysis

### Loading X and Y data sets for train and test data

The former link contains Test and Train data sets for a machine learning research project, using cellphone's sensors to identify the activities performed by the test subjects. The first step involves loading both X (independent variables) data sets into two data frames.

Since both data sets lack a header row with column names, the script is hardcoded to provide such variable labels when loading both tables. Columns names are based on the "features.txt", which is insde the "UCI HAR Dataset" folder. Also while loading the data sets, unwated columns are discarted.


The second step involves loading the train and test Y data sets. Both Y data sets contain a vector with the activities ID performed by the subjects. Each row of the vector corresponds to the same row of the X dataframe.

The third data load is the subject list of each case. This data can be found in the "subject_test.txt" file of each data case. The file contains a vector with subject's ID, since no descriptions are needed it will be fine as it is.

then the scripts load the data set containing activities descriptions. Since both test and train data share the same codes, one data load will sufice this time. 


### concatenating and mergingtables

The following concatenation procedures are performed in the order presented:

1. X Train Data Frame, with Subjects ID Table and Activities ID table (columns wise). The resulting data frame is named **train**.
2. X Test Data Frame, with Test Subjects ID Table and Test Activities ID table (columns wise). The resulting data frame is named **test**.
3. Concatenate **train and test** dataframes, rows wise. The resulting data framed is named **complete**
4. Merge **complete** data frame with the activities label data frame, by activities id column.

### Removing unwanted columns

All unneeded columns are removed, leaving only 66 variables.


### Grouping/pivoting data

The reshape function is used. This involves 3 steps:

1. Identifying all numerical variables (non label/ID columns. To simplify the process when loading the data, all non key columns where assigned a double class. While key columns where assigned a character or integer class. The class serves as a flag to discriminate variables. The following code is used to create a vector with column's name that contain amounts:


```{r}
vValuesCol = names(complete[,sapply(complete, is.double)])
```

2. Defining an intermediate data frame to enable grouping. Reshape2 library contains the melt function which outputs a DF with a clear distinction between ID variables and amount columns. The following code was used:

```{r}
dfmComplete = melt(complete,id=c("Activities_Label","Subjects_ID"),measure.vars = vValuesCol)
```
3. Defining the resulting group table, by using Reshape2's dcast function:

```{r}
dfcComplete = dcast(dfmComplete, Activities_Label + Subjects_ID ~ variable,mean)
```

Last but not least the dfcComplete table is saved in the working directory, using pipes "|" seperators:
```{r}
write.table(dfcComplete,file = "reshapedDataActivitiesSubjects",row.names = F,sep="|")
```
