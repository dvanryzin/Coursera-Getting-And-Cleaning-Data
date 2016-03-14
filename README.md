Getting and Cleaning Data
Final Project - 2016

Introduction
This repository contains the following files that are deliverables for the Coursera "Getting and Cleaning Data" course.
* run-analysis.r: The source script containing the R commands that perform the analysis and output the results
* tidyDataSet.txt: The file containing the resulting output
* CodeBook.md: The file containing descriptions of the variables, the data, and data transformations performed to clean up the data
* README.md: This README.md file that contains a description of the contents of the repository
* Source Data: The unzipped project source folders/files

Running the R Script
The run_analysis.r script merges the test and training sets by row and tidy’s up the data. In order to run this script, the source data had to be downloaded and unzipped. I have supplied it the source data in unzipped form in the folder “getdata-projectfiles-UCI HAR Dataset”. If you download the entire repository, to your default R Studio folder, the script will be able to find the source files.

Run_analysis.r Script
The run_analysis.r script, after reading in the training and testing data sets, merges the two together by row. It then adds labels and only those columns that are related to mean and standard deviation are retained.
The script outputs a tidy data set containing the mean of all columns by test subject and by activity. The output is written to a tab-delimited file called tidyDataSet.txt, a copy of which is located in this repository.

The Code Book
The CodeBook.md file contains a description of the transformations performed by the run_analysis.r script, the variables created therein, and the data that is output to the tidyDataSet.txt file.

