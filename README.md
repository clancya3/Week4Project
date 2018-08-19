# Week4Project
Week 4 Assignment Getting and Cleaning Data

This repository contains my files for Coursera's "Getting and Cleaning Data" course's Week 4 assignment. It
contains the following files:

R Script: run_analysis.R

  The prerequisite for this script is that the working directory has already been set.

The R script completes the following actions:

  - Downloads source data files into the working directory
  - Reads in training and test set tables
  - Reads in the activity IDs and subject IDs
  - Merges the training and testing datasets into one
  - Merges the activity ID and subject ID datasets
  
  - Labels the columns of the merged training/test dataset
  - Adds the subject and activity IDs to merged training/test dataset
  - Extracts only the mean and standard deviation values for each measurement
  - Uses descriptive activity names instead of just the numbers
  - Creates a tidy dataset in which that has the means for each activity - subject combination
  
CodeBook.md

  - a code book that describes the variables, data, and transformations executed to create tidy data
  
TidyData
   
  - text file with tidy data
