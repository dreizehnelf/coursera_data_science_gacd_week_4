# coursera_data_science_gacd_week_4
Peer-graded Assignment: Getting and Cleaning Data Course Project

## Outline
This repository contains the necessary scripts and information to create multiple tidy datasets based on data provided by research at [http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones] and following cleaning instructions/requirements specified in the Peer-Reviewed Assignment of Week 4 of the _"Getting and Cleaning Data"_ course on Coursera.

## Steps taken to clean up the original data
_(done automatically by executing the `run_analysis.R` script)_

1. Download and extract the data from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip] into the root of the repository directory (will create a `UCI HAR Dataset` directory). This step will be skipped by the script if the directory already exists.

2. Apply a couple of denormalisations and inlines as well as some filtering to make the original data more accessible (see `CodeBook.md` or even `run_analysis.R` for more details on the operations performed.)

3. Save the new dataset to `dist/dataset.txt` (see `CodeBook.md` for description of the file format and on how to load the data again.)

4. Create a new dataset averaging the different features by test subject and activity (by applying the R's `mean` function, see `run_analysis.R` for the exact R code.)

5. Save the new dataset to `dist/averages.txt` (using the same file format)

## Caveats

`run_analysis.R` will try to conserve bandwidth / processing time, so it will:

* NOT download the base dataset, if the `UCI HAR Dataset` directory already exists.
* NOT recompute the tidy dataset (before computing the averages dataset), if `dist/dataset.txt` already exists

So delete the appropriate files/folders if you need them re-downloaded/re-computed.


