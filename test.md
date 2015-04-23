---
title: "Codebook"
author: "Ashish Dalal"
date: "Monday, September 15, 2014"
output: html_document
---

#Introduction

One of the most exciting areas in all of data science right now is wearable computing - see for example [this article](http://www.insideactivitytracking.com/data-science-activity-tracking-and-the-battle-for-the-worlds-top-sports-brand/) . Companies like [Fitbit](http://www.fitbit.com/), [Nike](http://www.nike.com/), and [Jawbone Up](https://jawbone.com/) are racing to develop the most advanced algorithms to attract new users. 

#Synopsis

This report deals with collection,working with and cleaning a data set.The goal is to prepare tidy data that can be used for later analysis.The dataset used represents the data collected from the accelerometers from the Samsung Galaxy S smartphone and the full blown dataset and data descritpion can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Getting and Cleaning the Data

The data is first downloaded from UCI repository and put into the **data** directory.

The first step of the preprocessing is to merge the training and test sets. Two sets combined, there are 10,299 instances where each instance contains 561 features (560 measurements and subject identifier). After the merge operation the resulting data, the table contains 562 columns (560 measurements, subject identifier and activity label).

After the merge operation, mean and standard deviation features are extracted for further processing. Out of 560 measurement features, 33 mean and 33 standard deviations features are extracted, yielding a data frame with 68 features (additional two features are subject identifier and activity label).

Next, the activity labels are replaced with descriptive activity names, defined in **activity_labels.txt** in the original data folder.

The final step creates a tidy data set with the average of each variable for each activity and each subject. 10299 instances are split into 180 groups (30 subjects and 6 activities) and 66 mean and standard deviation features are averaged for each group. The resulting data table has 180 rows and 66 columns. The tidy data set is exported to **activitydata.csv** where the first row is the header containing the names for each column.

## Dataset Partioning

The original data set is split into training and test sets (70% and 30%, respectively) where each partition is also split into three files that contain

+measurements from the accelerometer and gyroscope
+activity label
+identifier of the subject

## run_analysis.R

The script run_analysis.R

+ downloads the data from [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/index.html)
+ merges the training and test sets to create one data set.
+ replaces **activity** values in the dataset with descriptive activity names.
+ extracts only the measurements (features) on the mean and standard deviation for each measurement.
+ appropriately labels the columns with descriptive names.
+ creates a second, independent tidy dataset with an average of each variable for each each activity and each subject. In other words, same type of measurements for a particular subject and activity are averaged into one value and the tidy data set contains these mean values only. The processed tidy data set is also exported as csv file.

The script is parititioned into functions such that each function performs one of the steps described above. To run whole cleaning procedure, call **clean.data** function. The script also assumes that **plyr** library is already installed.

## Project Repository

The full project repository can be found [here](https://github.com/danglinglearner13081992/Getting-Cleaning-Data).