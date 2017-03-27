
# Human Activity Recognition Using Smartphones Dataset
# Version 1.0

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws


The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

# For each record it is provided:

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

# The dataset includes the following files:


- 'README.txt'

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 

- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. Every row shows a 128 element vector. The same description applies for the 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 

- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 

# Notes: 
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

# Feature Selection 

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arCoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxInds(): index of the frequency component with largest magnitude
meanFreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

For more information about this dataset contact: activityrecognition@smartlab.ws

## Transformations performed to achieve the final tidy data set :

### Merge train anbd test data sets
Training and test data - X_train.txt, X_test.txt, along with subject data - subject_train.txt, subject_test.txt and also activity data - y_train.txt, y_test.txt were combined to produce a single data set.
features.txt provided the labels for each variables and this combined data set variables were labelled with these names.

### Selectively extract Mean and Standard Ddeviation variables
From the combined data set, the mean() and Std() variables were extracted to create a subset of data. These were identified with the labeles that contained "mean()" andd "std()".

### add descroptive activity names
A new variable with activity names was added to the above data set. This variable carries  the descriptive activity names and is looked up from the activity_labels.txt file provided by joining on the Activity Id variable.

### Label the variables with easy to read decriptive labels
The original labels were cryptic and easily readable. Hence they were changes to provide descriptive labels. for eg. Acc was changed to Acceleration, STD wa changed to standard deviation, Gyro was changge to angle, dashes and paranthesis were removed etc.

### Final Tidy Data set
A final tidy data set is created by computingthe mean or average of numerical variables grouped by activity with in each subject.
The tidy data set contains 180 observations andd 81 variables as follows :
This data is from the orignal data set of 10299 observations and 81 variables that were the result of only picking mean and std varialbes.

  Activity variable : WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
  Subject variable : 1, 3, 5, 6, 7, 8, 11, 14, 15, 16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
  
  The remaining 79 varriables are either Time domain or Frequency domain numeric values for linear or angular speeds and accelerations. 

the following are hte vriable names in the final tidy data set. "-X or Y or Z" denotes three variables, one for each axis.

 [1] "Subject"                                                           
 [2] "Activity"                                                          
 [3] "TimeDomainBodyAccelerationMean-X"                                  
 [4] "TimeDomainBodyAccelerationMean-Y"                                  
 [5] "TimeDomainBodyAccelerationMean-Z"                                  
 [6] "TimeDomainBodyAccelerationStandardDeviation-X"                     
 [7] "TimeDomainBodyAccelerationStandardDeviation-Y"                     
 [8] "TimeDomainBodyAccelerationStandardDeviation-Z"                     
 [9] "TimeDomainGravityAccelerationMean-X"                               
[10] "TimeDomainGravityAccelerationMean-Y"                               
[11] "TimeDomainGravityAccelerationMean-Z"                               
[12] "TimeDomainGravityAccelerationStandardDeviation-X"                  
[13] "TimeDomainGravityAccelerationStandardDeviation-Y"                  
[14] "TimeDomainGravityAccelerationStandardDeviation-Z"                  
[15] "TimeDomainBodyAccelerationJerkMean-X"                              
[16] "TimeDomainBodyAccelerationJerkMean-Y"                              
[17] "TimeDomainBodyAccelerationJerkMean-Z"                              
[18] "TimeDomainBodyAccelerationJerkStandardDeviation-X"                 
[19] "TimeDomainBodyAccelerationJerkStandardDeviation-Y"                 
[20] "TimeDomainBodyAccelerationJerkStandardDeviation-Z"                 
[21] "TimeDomainBodyAngleSpeedMean-X"                                    
[22] "TimeDomainBodyAngleSpeedMean-Y"                                    
[23] "TimeDomainBodyAngleSpeedMean-Z"                                    
[24] "TimeDomainBodyAngleSpeedStandardDeviation-X"                       
[25] "TimeDomainBodyAngleSpeedStandardDeviation-Y"                       
[26] "TimeDomainBodyAngleSpeedStandardDeviation-Z"                       
[27] "TimeDomainBodyAngleAccelerationMean-X"                             
[28] "TimeDomainBodyAngleAccelerationMean-Y"                             
[29] "TimeDomainBodyAngleAccelerationMean-Z"                             
[30] "TimeDomainBodyAngleAccelerationStandardDeviation-X"                
[31] "TimeDomainBodyAngleAccelerationStandardDeviation-Y"                
[32] "TimeDomainBodyAngleAccelerationStandardDeviation-Z"                
[33] "TimeDomainBodyAccelerationMagnitudeMean"                           
[34] "TimeDomainBodyAccelerationMagnitudeStandardDeviation"              
[35] "TimeDomainGravityAccelerationMagnitudeMean"                        
[36] "TimeDomainGravityAccelerationMagnitudeStandardDeviation"           
[37] "TimeDomainBodyAccelerationJerkMagnitudeMean"                       
[38] "TimeDomainBodyAccelerationJerkMagnitudeStandardDeviation"          
[39] "TimeDomainBodyAngleSpeedMagnitudeMean"                             
[40] "TimeDomainBodyAngleSpeedMagnitudeStandardDeviation"                
[41] "TimeDomainBodyAngleAccelerationMagnitudeMean"                      
[42] "TimeDomainBodyAngleAccelerationMagnitudeStandardDeviation"         
[43] "FrequencyDomainBodyAccelerationMean-X"                             
[44] "FrequencyDomainBodyAccelerationMean-Y"                             
[45] "FrequencyDomainBodyAccelerationMean-Z"                             
[46] "FrequencyDomainBodyAccelerationStandardDeviation-X"                
[47] "FrequencyDomainBodyAccelerationStandardDeviation-Y"                
[48] "FrequencyDomainBodyAccelerationStandardDeviation-Z"                
[49] "FrequencyDomainBodyAccelerationMeanFreq-X"                         
[50] "FrequencyDomainBodyAccelerationMeanFreq-Y"                         
[51] "FrequencyDomainBodyAccelerationMeanFreq-Z"                         
[52] "FrequencyDomainBodyAccelerationJerkMean-X"                         
[53] "FrequencyDomainBodyAccelerationJerkMean-Y"                         
[54] "FrequencyDomainBodyAccelerationJerkMean-Z"                         
[55] "FrequencyDomainBodyAccelerationJerkStandardDeviation-X"            
[56] "FrequencyDomainBodyAccelerationJerkStandardDeviation-Y"            
[57] "FrequencyDomainBodyAccelerationJerkStandardDeviation-Z"            
[58] "FrequencyDomainBodyAccelerationJerkMeanFreq-X"                     
[59] "FrequencyDomainBodyAccelerationJerkMeanFreq-Y"                     
[60] "FrequencyDomainBodyAccelerationJerkMeanFreq-Z"                     
[61] "FrequencyDomainBodyAngleSpeedMean-X"                               
[62] "FrequencyDomainBodyAngleSpeedMean-Y"                               
[63] "FrequencyDomainBodyAngleSpeedMean-Z"                               
[64] "FrequencyDomainBodyAngleSpeedStandardDeviation-X"                  
[65] "FrequencyDomainBodyAngleSpeedStandardDeviation-Y"                  
[66] "FrequencyDomainBodyAngleSpeedStandardDeviation-Z"                  
[67] "FrequencyDomainBodyAngleSpeedMeanFreq-X"                           
[68] "FrequencyDomainBodyAngleSpeedMeanFreq-Y"                           
[69] "FrequencyDomainBodyAngleSpeedMeanFreq-Z"                           
[70] "FrequencyDomainBodyAccelerationMagnitudeMean"                      
[71] "FrequencyDomainBodyAccelerationMagnitudeStandardDeviation"         
[72] "FrequencyDomainBodyAccelerationMagnitudeMeanFreq"                  
[73] "FrequencyDomainBodyBodyAccelerationJerkMagnitudeMean"              
[74] "FrequencyDomainBodyBodyAccelerationJerkMagnitudeStandardDeviation" 
[75] "FrequencyDomainBodyBodyAccelerationJerkMagnitudeMeanFreq"          
[76] "FrequencyDomainBodyBodyAngleSpeedMagnitudeMean"                    
[77] "FrequencyDomainBodyBodyAngleSpeedMagnitudeStandardDeviation"       
[78] "FrequencyDomainBodyBodyAngleSpeedMagnitudeMeanFreq"                
[79] "FrequencyDomainBodyBodyAngleAccelerationMagnitudeMean"             
[80] "FrequencyDomainBodyBodyAngleAccelerationMagnitudeStandardDeviation"
[81] "FrequencyDomainBodyBodyAngleAccelerationMagnitudeMeanFreq"  

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
