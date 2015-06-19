---
title: "Getting Data Project"
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

Since both data sets lack a header row with column names, the script is hardcoded to provide such variable labels. Columns names are based on the "features.txt", which is insde the "UCI HAR Dataset" folder.

The second step involves loading the train and test Y data sets. Both Y data sets contain a vector with the activities ID performed by the subjects. Each row of the vector corresponds to the same row of the X dataframe.

Last, load the data set containing activities descriptions. Since both test and train data share the same codes, one data load will sufice this time.

### Merging tables

### concatenating tables

### Grouping/pivoting data


When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

```{r}
summary(cars)
```

You can also embed plots, for example:

```{r, echo=FALSE}
plot(cars)
```

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
