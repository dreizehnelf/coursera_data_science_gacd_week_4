library(data.table);

BASE_DATASET_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip";
BASE_DATASET_DIR <- "UCI HAR Dataset";

FEATURE_FILE <- sprintf("%s/features.txt", BASE_DATASET_DIR);
FEATURE_SELECT_PATTERN <- "(mean|std)\\(\\)";

ACTIVITY_LABEL_FILE <- sprintf("%s/activity_labels.txt", BASE_DATASET_DIR);

SUBJECT_DATA_FILE_TEMPLATE <- "%s/%s/subject_%s.txt";
MEASUREMENTS_DATA_FILE_TEMPLATE <- "%s/%s/X_%s.txt";
ACTIVITY_DATA_FILE_TEMPLATE <- "%s/%s/y_%s.txt";

CLEANED_DATASET_EXPORT_FILE <- "dist/dataset.txt";

# check, if the data directory exists
is_base_dataset_available <- function() {
  return(file.exists(BASE_DATASET_DIR));
}

# check, if the data directory exists and if not, download the data archive to a temporary file,
# extract it and delete the tempfile again
download_and_extract_file <- function() {
  
  if(is_base_dataset_available()) {
    print(sprintf("Dataset directory '%s' is already there. Skipping download.", BASE_DATASET_DIR));
    return(FALSE);
  }
  
  print(sprintf("Downloading base dataset from '%s'.", BASE_DATASET_URL));
  
  # generate a temp file name for the download
  temp_file_name <- tempfile("dataset_download");
  
  # download the file
  download.file(BASE_DATASET_URL, temp_file_name);
  
  # extract it
  unzip(temp_file_name);
  
  # and remove it again
  unlink(temp_file_name);
  
  return(TRUE);
}

# get the feature names from features.txt
get_features <- function() {
  return(read.table(
    FEATURE_FILE,
    colClasses=c("NULL", "character"),
    col.names=c("feature_index", "feature_name")
  ))
}

# get the logical vector telling us, which features to include based on a regular expression
# on the feature_name
get_feature_extract_logical_vector <- function(features) {
  return(regexpr(FEATURE_INCLUDE_PATTERN, features$feature_name) >= 0);
}

# get the descriptive activity names
get_activity_labels <- function() {
  return(read.table(
    ACTIVITY_LABEL_FILE,
    colClasses=c("integer", "character"),
    col.names=c("activity_id", "activity_label")
  ))
}

# load measurements
get_measurements <- function(mode="train") {
  
  # map the files
  subject_data_file <- sprintf(SUBJECT_DATA_FILE_TEMPLATE, BASE_DATASET_DIR, mode, mode);
  measurements_data_file <- sprintf(MEASUREMENTS_DATA_FILE_TEMPLATE, BASE_DATASET_DIR, mode, mode);
  activity_data_file <- sprintf(ACTIVITY_DATA_FILE_TEMPLATE, BASE_DATASET_DIR, mode, mode);
  
  # load the subject data
  subject_data <- read.table(
    subject_data_file,
    colClasses=c("integer"),
    col.names=c("iSubjectId")
  )
  
  # load the features
  all_features <- get_features();
  
  # extract only the wanted features
  feature_selector <- get_feature_extract_logical_vector(all_features)
  selected_features <- all_features[feature_selector,];
  
  # use the all_features and feature selector to build our colClasses and col.names
  col_classes <- lapply(feature_selector, function(include) {
    if(include) {
      return("numeric");
    } else {
      return("NULL");
    }
  })
  
  # column names should not have the characters "()" in them, since they will be converted
  # to dots - which kinda looks weird, so fix this beforehand
  column_names <- sub("(\\(\\)|,)", "", c(all_features$feature_name));

  # load the measurements - since the colClasses will be "NULL" for all the
  # features that are not selected by the feature selector, those columns will
  # NOT be imported and we'll get a reduced feature set in the final data

  measurements_data <- read.table(
    measurements_data_file,
    colClasses=col_classes,
    col.names=column_names
  )
  
  # load the activity data & labels
  activity_data <- read.table(
    activity_data_file,
    colClasses=c("integer"),
    col.names=c("activity_id")
  )
  
  activity_labels <- get_activity_labels();

  # create a new vector that holds the mapped values
  mapped_labels <- lapply(activity_data$activity_id, function(activity_id) {
    return(activity_labels[activity_labels$activity_id == activity_id,][2]);
  });
  
  # convert from list to data frame with each list element being one row of the data frame
  mapped_labels <- data.frame(cActivity=unlist(mapped_labels))
  
  # add activity labels to measurements
  # add subject data to measurements
  measurements_data <- cbind(subject_data, mapped_labels, measurements_data);
  
  return(measurements_data);
  
}

save_data <- function(data, file) {
  
  # create directories if not present
  target_dir <- dirname(file);
  
  if(!dir.exists(target_dir)) {
    dir.create(target_dir, recursive=TRUE);
  }
  
  write.table(data, file, sep="\t", row.names=FALSE);
}


# download the file if necessary
download_and_extract_file();

# load measurements
measurements <- get_measurements();
save_data(measurements, CLEANED_DATASET_EXPORT_FILE);


