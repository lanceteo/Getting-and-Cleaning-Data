#CodeBook for run_analyis.R

This Codebook describes the variables, the data, and any transformations or work that I performed to clean up the data. The dataset can be downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

##Data

- activitylabel - contains the labels for the activity read from the "activity_labels.txt" file
- data - combined dataset of both training and testing dataset
- data2 - a data set with average of each variable for each activity and each subject based on "data"
- subdata - a combined dataset of "subject"
- subdatatest - a dataset of testing "subject"
- subdatatrain - a dataset of training "subject"
- xdata - a combined dataset of "features"
- xdatanames - labels of features read from "features.txt"
- xdatatest - a dataset of testing "features"
- xdatatrain - a dataset of training "features"
- ydata - a combined dataset of "activity"
- ydatatest - a dataset of testing "activity"
- ydatatrain - a dataset of training "activity"

##Output

- subjectactivityaverage.txt - Second, independent tidy data set with the average of each variable for each activity and each subject
