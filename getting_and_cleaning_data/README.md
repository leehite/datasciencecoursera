#Introduction

This repo is a class assignment for the course module [Getting and Cleaning Data](https://www.coursera.org/course/getdata), which is part of the [Data Science](https://www.coursera.org/specialization/jhudatascience/1) specialization at [Coursera](https://www.coursera.org/).

##The Assignment

The task here was to create a tidy data set from a project titled "Human Acitivity Recognition Using Smartphones Data Set" which is described at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

and for which the complete raw data set can be downloaded at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The data set itself consists of two subsets of data -- one for subjects in a "test" group and one for subjects in a "training" group. For each subset the data set consists of observations of a given subject performing one of six different activities, and each observation consists of 561 measurements of a given "feature".  The raw data set for each subset consists of three files:

- X_[subset].txt -- the raw data of 561 measurements for a given subject in a given activity
- y_[subset].txt -- the activity code for the given observation
- subject_[subset}.txt -- the subject ID for the given observation

in addition to those files, there are several files that document these data files:

- activity_labels.txt -- descriptors for the six activities
- features.txt -- descriptors for the 561 measurements
- features_info.txt -- elaborates on what each of the features are
- README.txt -- a summary of the overall experiment

If you want a better understanding of what is actually being measured and how the data were gathered, you are encouraged to look at the last two files above.

##What's Included Here

In addition to this README.md file you will find three other files:

1) run_analysis.R -- this is an R script that will:
   - download the zipped data file and unzip it
   - tidy up the data sets for the two data subsets and combine them in to one master data file
   - run an analysis of the master data by computing means for all the relevant variables by subject by activity
 
   note that the script is heavily commented so that you can easily modify it to do certain tasks in different ways if you choose.  for example, if you want to produce a data set of just the "test" subset, you can accomplish that easy enough by following the instructions in the comments.

2) codebook.txt -- this describes in detail exactly what has been done to tidy up the data.

3) means_by_subject_by_activity.csv -- this is the output from the analysis noted above.

