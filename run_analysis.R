##0.Download the required data and read this into R

if(!file.exists("./data")) {dir.create("./data")} ##create directory "data" if it does not exist in wd

fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileurl, destfile="./data/Dataset.zip")

unzip(zipfile="./data/Dataset.zip",exdir="./data")

fileloc <- file.path("./data", "UCI HAR Dataset")
files <- list.files(fileloc, resursive=TRUE)

##1.Merges the training and the test sets to create one data set.

#reading Y data
ydatatest <- read.table(file.path(fileloc,"test","y_test.txt"),header=FALSE)
ydatatrain <- read.table(file.path(fileloc,"train","y_train.txt"))

#reading X data
xdatatest <- read.table(file.path(fileloc,"test","X_test.txt"),header=FALSE)
xdatatrain <- read.table(file.path(fileloc,"train","X_train.txt"))

#reading subject data
subdatatest <- read.table(file.path(fileloc,"test","subject_test.txt"),header=FALSE)
subdatatrain <- read.table(file.path(fileloc,"train","subject_train.txt"))

#merging the data sets by row
ydata <- rbind(ydatatrain,ydatatest)
xdata <- rbind(xdatatrain,xdatatest)
subdata <- rbind(subdatatrain,subdatatest)

#naming the variable
names(ydata) = c("activity")
xdatanames <- read.table(file.path(fileloc, "features.txt"),header=FALSE)
names(xdata) <- xdatanames$V2
names(subdata) = c("subject")

#combine all data by column
data <- cbind(xdata,subdata,ydata)


##2.Extracts only the measurements on the mean and standard deviation for each measurement.

#subset the names of x with "mean" and "std"
xdatanamesms <- xdatanames$V2[grep("mean\\(\\)|std\\(\\)", xdatanames$V2)] 

#subset the combined data with the subsetted names of x above
data <- subset(data,select = c(as.character(xdatanamesms),"subject","activity"))


##3.Uses descriptive activity names to name the activities in the data set

#reading the activity labels
activitylabel <- read.table(file.path(fileloc,"activity_labels.txt"),header=FALSE)
#factor the activity with descriptive name from activity labels file
data$activity <- factor(data$activity, labels = activitylabel[,2])


##4.Appropriately labels the data set with descriptive variable names. 

names(data)<-gsub("^t", "time", names(data))
names(data)<-gsub("^f", "frequency", names(data))
names(data)<-gsub("Acc", "Accelerometer", names(data))
names(data)<-gsub("Gyro", "Gyroscope", names(data))
names(data)<-gsub("Mag", "Magnitude", names(data))
names(data)<-gsub("BodyBody", "Body", names(data))

##5.From the data set in step 4, creates a second, independent tidy data set 
##  with the average of each variable for each activity and each subject.

#code requires "plyr"
library("plyr")

data2 <- aggregate(.~ subject + activity, data, mean)
data2 <- data2[order(data2$subject, data2$activity),]
write.table(data2, file = "subjectactivityaverage.txt", row.name=FALSE)

