---
author: "Jesus Alfonso Moreno"
date: "21 de junio de 2015"
output: html_document
---
# CodeBook

## Background

The analysis performed in this project uses data from the **Human Activity Recognition Using Smartphones Data Set** study. The original research consisted of logging human activity data with the sensors of a Samsung Galaxy S2 smartphone. Such sensors are an accelerometer and gyroscope. The original data contains about 543 varialbes, but only a subset of such readings and estimates are used in this project.

To learn more about the experiments visit: <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>

To download the original data:
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip>



## Extracting measurements on the mean and standard deviation for each measurement

For the purpose of this project it is assumed that the measurements are:

	-tBodyAcc-XYZ
	-tGravityAcc-XYZ
	-tBodyAccJerk-XYZ
	-tBodyGyro-XYZ
	-tBodyGyroJerk-XYZ
	-tBodyAccMag
	-tGravityAccMag
	-tBodyAccJerkMag
	-tBodyGyroMag
	-tBodyGyroJerkMag
	-fBodyAcc-XYZ
	-fBodyAccJerk-XYZ
	-fBodyGyro-XYZ
	-fBodyAccMag
	-fBodyAccJerkMag
	-fBodyGyroMag
	-fBodyGyroJerkMag

*Note: It is known that such list of signals where extracted with several methods from the raw data of the two sensors.* 

In consequence only the mean and standard deviation of such listed signals where extracted. Estimations that included the word mean, but really were a different estimation on its own (and not a mean/standard deviation calculation) where ignored. For example “fBodyAcc-meanFreq()-X” or “angle(tBodyAccJerkMean),gravityMean)”. In general the following estimations where ignored:

	-mad(): Median absolute deviation 
	-max(): Largest value in array
	-min(): Smallest value in array
	-sma(): Signal magnitude area
	-energy(): Energy measure. Sum of the squares divided by the number of values. 
	-iqr(): Interquartile range 
	-entropy(): Signal entropy
	-arCoeff(): Autorregresion coefficients with Burg order equal to 4
	-correlation(): correlation coefficient between two signals
	-maxInds(): index of the frequency component with largest magnitude
	-meanFreq(): Weighted average of the frequency components to obtain a mean frequency
	-skewness(): skewness of the frequency domain signal 
	-kurtosis(): kurtosis of the frequency domain signal 
	-bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
	-angle(): Angle between to vectors.


## Creating descriptive variable names 

Based on the “features.txt” file of the original data, which lists the complete list of columns names, more complete labels were created. The proposed new names have the following structure with each section englobed by squared brackets and separated by  “\_”: **[Signal Domain Type]**\_**[Source Of Movement (Body or Gravity)]**\_**[Sensor Name (Accelerometer or Gyroscope)]**\_**[Jerk Measurement Flag (if it applies)]**\_**[Axis name or Magnitude Flag]**\_**[Estimation Name (Mean or Standar Deviation)]**. So for example “tBodyAcc-mean()-X” becomes “time\_BodyMotion\_Accelerometer\_Xaxis_Mean”

**Why is this descriptive?** Because even though working with these signals and filtering them requires advanced mathematics and physics knowledge, any person who reads this document will know at least:
	
1. Type/Source of movement
2. Domain of the variable (frequency or time)
3. Source of readings (sensor's name)
4. If it's the magnitude of the vector or an Axis
5. Estimation type (mean or standard deviation)

It's also expected that a Data Scientist working with a data set with such descriptions will have a better change of recalling the use of each variable.

## Units

The units assigned to each of the measurements are not mentioned in the original codebook. But it's expected that gyroscope readings are in some form of angular velocity, while accelerometer readings are expected to be in a form of acceleration unit. The same logic applies to Jerk derivations.

Another point to keep in mind is that at the beginning of each variable name the domain type is indicated. The two known cases of this data set are:

1. Time domain
2. Frequency domain