# Getting and Cleaning Data: Course Project

## Introduction

This repository contains the project course work for Coursera's Getting and
Cleaning Data course which is a part of Data Science specialisation.

## Scope/Problem Defintion

Given a dataset of human activity as recognised by a Smartphone, we need to
process the data to do the following:

1. Merge different raw files to form a single data file.
2. Make the data file more descriptive with better data labels and
   representation.
3. Create a summary tidy set that summarises all the information on a per
   subject and activity basis.

## Data Source

The data used for the project has been collected from the accelerometers from
the Samsung Galaxy S smartphone. A full description of the raw data is at:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The raw data used for the project can be found at: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip]( https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)


## Setting Up

1. Clone the repository to your R working directory.
2. Download the zip file linked above and extract it inside the directory of
   this repository. The code assumes that this directory will be called `UCI HAR Dataset`.
3. Execute `run_analysis.R`.

You can change the `localPath` variable at the top of the file to match your
data folder's name. `localPath` can be set to `./` if the data is in the same
directory as `run_analysis.R`.

## Repository Structure

The repository contains the following files:

| File Name | Description |
| --------- | ----------- |
| `README.md` | Describes the overall problem and solution structure |
| `run_analysis.R` | Script that performs analysis and creates the output files. |
| `CodeBook.md` | Describes the analysis and the variables used to cleanup data.  |
| `tidy.txt` | The final output file after cleaning. |
| `processedData.txt` | The intermediatary file before summarising data. |
| `.gitignore` | Standard git file to ignore files not needed |

