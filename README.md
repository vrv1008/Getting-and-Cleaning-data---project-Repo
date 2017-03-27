Getting and Cleaing Data - Course Project
-----------------------------------------

Project description & Goal
--------------------------
--------------------------

Description
-----------
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected.

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Here are the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Goal
----
----
You should create one R script called run_analysis.R that does the following.

    1. Merges the training and the test sets to create one data set.
    2. Extracts only the measurements on the mean and standard deviation for each measurement.
    3. Uses descriptive activity names to name the activities in the data set
    4. Appropriately labels the data set with descriptive variable names.
    5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

How to use run_analysis.R to achieve these project goals :
----------------------------------------------------------
----------------------------------------------------------
This github repository constains the following files :
	README.md				This file expalins the available files, the process and how to use this repository and files
	CodeBook.md 				Information about the raw andd tidy data set
	run_analysis.R				The Source R script to execute to achieve the results outlines in this project
	mean_actvty_subjct_sensor_data.txt 	The final tidy data set

First create a local folder "c:/Coursera/GettingAndCleaningData/data1/CourseProject/UCI HAR Dataset"

Download the data sets mentioned above and from the url's provided into this directory.

source run_analysis.R script in R - source("run_analysis.R")

The file mean_actvty_subjct_sensor_data.txt is the final tiday data, a 180 x 81 data frame. This is the mean of every variable ( meand & std ) observation 
grouped by activity for each subject.


