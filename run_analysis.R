###############################################################
# 1. Merges the training and the test sets to create one data set.
###############################################################


# Set working directories and read data files
setwd("c:/Coursera/GettingAndCleaningData/data1/CourseProject/UCI HAR Dataset")
setwd("c:/Coursera/GettingAndCleaningData/data1/CourseProject/UCI HAR Dataset/test")
test_st <- read.table("subject_test.txt")
test_x <- read.table("X_test.txt")
test_y <- read.table("Y_test.txt")

setwd("c:/Coursera/GettingAndCleaningData/data1/CourseProject/UCI HAR Dataset/train")
train_st <- read.table("subject_train.txt")
train_x <- read.table("X_train.txt")
train_y <- read.table("Y_train.txt")

setwd("c:/Coursera/GettingAndCleaningData/data1/CourseProject/UCI HAR Dataset")
features <- read.table("features.TXT", colClasses="character") # Had to redo this using colClasses to add the column headings using rbind
activity_labels <- read.table("activity_labels.txt")

# Combine train sensor data
## First combine the train subject and x data
x_train_sensor <- cbind(train_x,train_st)
## combine Y train data to this
xy_train_sensor <- cbind(x_train_sensor,train_y)

# Combine test sensor data
## first combine test subject and x data
x_test_sensor <- cbind(test_x,test_st)
## combine y test data to this
xy_test_sensor <- cbind(x_test_sensor,test_y)
# Combine both test and train sensor data into one sensor data frame
sensor_data <- rbind(xy_train_sensor,xy_test_sensor)

########################################################################################
#2. Extracts only the measurements on the mean and standard deviation for each measurement.
########################################################################################

# Label the subject and y data accordingly to the combines data set
# Since subject was added first, and then Activity data, column 562 is subject and 563 is activity Id

sensorData_header <- rbind(rbind(features, c(562, "Subject")),c(563,"ActivityId"))[,2]
# replace the header in the sensor_data with this new header including the "subject" and ActivityId headers
names(sensor_data) <- sensorData_header

# filter the header to include only mean and std headers. This will be used to create the mean and std data set
# from sensor_data
#filter_meanStd <- grepl("mean|std|Subjet|AcvtivityId|",names(sensor_data))
# create the mean and std data set from sensor_data
meanStd_sensor_data <- sensor_data[,grepl("mean|std|Subject|ActivityId",names(sensor_data))]

########################################################################
#3. Use descriptive activity names to name the activities in the data set
########################################################################

# rename the activities labels data header from V1,V2 to ActivityId, Activity
activity_labels_header <- c("ActivityId","Activity")
# Replace the header in Activity_labels with the new header 
names(activity_labels) <- activity_labels_header
# Merge the meanStd_sensor_data with the Activity_labels data 
mean_std_sensor_data <- merge(meanStd_sensor_data,activity_labels,by="ActivityId")
# Remove the ActivityId column from the data set
mean_std_sensor_data <- mean_std_sensor_data[,-1]

#################################################################
#4. Appropriately label the data set with descriptive variable names.
#################################################################
# First Remove paranthesis
names(mean_std_sensor_data) <- gsub('\\(|\\)',"",names(mean_std_sensor_data))
# change the label using following interpretations :
# 'f'-"FrequencyDomain", 't'-"TimeDomain", "Acc"-"Acceleration", "Gyro"-"Angle",
# "gyroJerk" - AngleAcceleration", "Mag"-"Magnitude", "Freq"-"Frequency"
# first "Acc" to "Acceleration
names(mean_std_sensor_data) <- gsub("Acc","Acceleration",names(mean_std_sensor_data))
# "Mag" to "Magnitude"
names(mean_std_sensor_data) <- gsub("Mag","Magnitude",names(mean_std_sensor_data))
# "GyroJerk" to "AngleAcceleration"
names(mean_std_sensor_data) <- gsub("GyroJerk","AngleAcceleration",names(mean_std_sensor_data))
# "Gyro" to "AngleSpeed"
names(mean_std_sensor_data) <- gsub("Gyro","AngleSpeed",names(mean_std_sensor_data))
# "t" to "Timedomain". Here use "^t" to ensure the t in the beginning is the only t that is replaced.
names(mean_std_sensor_data) <- gsub("^t","TimeDomain",names(mean_std_sensor_data))
# "f" to "FrequencyDomain". Use "^f".
names(mean_std_sensor_data) <- gsub("^f","FrequencyDomain",names(mean_std_sensor_data))
# "-mean" to "Mean"
names(mean_std_sensor_data) <- gsub("-mean","Mean",names(mean_std_sensor_data))
# "-std" to "StandardDeviation"
names(mean_std_sensor_data) <- gsub("-std","StandardDeviation",names(mean_std_sensor_data))

#########################################################################################
#5. From the data set in step 4, creates a second, independent tidy data set with the average
# of each variable for each activity and each subject.
#########################################################################################
# for each grouping of the ddata by ctivty first then by subject, calculate the mean
# for each variable or column, here usingg ddply function and the numcolwise argument
# I am understanding this to mean by each activity under each subject, so activity under subject
mean_actvty_subjct_sensor_data <- ddply(mean_std_sensor_data,c("Subject","Activity"), numcolwise(mean))

# Creating a file with this output for sharing the data
write.table(mean_actvty_subjct_sensor_data,"mean_actvty_subjct_sensor_data.txt")
