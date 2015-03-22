## Overview

This repository contains the R script that is created to complete the tasks in the Course Project for ["Getting and Cleaning Data Module"](https://class.coursera.org/getdata-012).

This module was pack of the Data Science Specialisations Track by Johns Hopskins University in Coursera.

## Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The R script, run_analysis, will do the following:
 
1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### 0. Preparation

Before we can do any analysis, we must download the data and read it into R.
The first part of the code is to create a data directory if there isn't one already created in the working directory. Then, we will proceed to download the data into the data directory using the download.file() function. Since the downloaded file is a .zip file, we will have to extract the content using the unzip() function.

Once all these are done, we will lastly assign the extracted folder location to a variable "fileloc".

### 1. Merging the Data Sets

Oberserving the extracted files, you can see 3 main groups of files: "X" the features, "y" the activity and "subject". And they are further divided into 2 sub-groups: "test" and "train". Hence, we will start by reading the respective files into a table using read.table() function.

Then we will merge the the sub-group "test" and "train" in their respective main groups by row using rbind() functions.
Finally, we will then merge the 3 mains groups by columns using cbind() function.

With this, you will get one data set with all the information you need.

### 2. Extracts only the measurements on the mean and standard deviation for each measurement

We can do this by subsetting the Feature Names which can be easily done using grep() functions.
After that, we just have to store the result back into the data frame.

### 3. Uses descriptive activity names to name the activities in the data set

The descriptive activity names is already available in the "activity_labels.txt" file downloaded. We can label the activity names by factoring the variable "activity", i.e. data$activity, with the labels in "activity_labels.txt" using the factor() fucntion.

### 4. Appropriately labels the data set with descriptive variable names

Using the gsub() functions, we can easily change the name to something more descriptive.

prefix t is replaced by time
Acc is replaced by Accelerometer
Gyro is replaced by Gyroscope
prefix f is replaced by frequency
Mag is replaced by Magnitude
BodyBody is replaced by Body

### 5. Creates a second,independent tidy data set and ouput it

Again, this is not difficult, if we use the aggregate() function available in the "plyr" library.
