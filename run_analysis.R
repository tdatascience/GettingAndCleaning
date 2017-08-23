library(dplyr)

#

original_data_url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
original_data_filename = "dataset.zip"

if (!file.exists(original_data_filename))
  download.file(original_data_url,destfile = original_data_filename)

if(!dir.exists("UCI HAR Dataset")) {
  unzip(original_data_filename)
}

#
data_dir = file.path("UCI HAR Dataset")
training_data_dir = file.path(data_dir, "train")
test_data_dir = file.path(data_dir, "test")

x_training_data_path = file.path(training_data_dir, "X_train.txt")
y_training_data_path = file.path(training_data_dir, "y_train.txt")
x_test_data_path = file.path(test_data_dir, "X_test.txt")
y_test_data_path = file.path(test_data_dir, "y_test.txt")
subject_training_data_path = file.path(training_data_dir, "subject_train.txt")
subject_test_data_path = file.path(test_data_dir, "subject_test.txt")
features_data_path = file.path(data_dir, "features.txt")
activity_labels_data_path = file.path(data_dir, "activity_labels.txt")

feature_names_table <- read.csv(file=features_data_path,sep=" ", header = FALSE, col.names = c("id", "feature_name"))
feature_names_table$feature_name <- tolower(gsub("[\\(\\),-]", "", feature_names_table$feature_name))
feature_names <- feature_names_table$feature_name

training_data <-read.table(x_training_data_path, col.names=feature_names)
training_data_limited <- select(training_data, matches("mean|std"))
test_data     <-read.table(x_test_data_path, col.names=feature_names)
test_data_limited <- select(test_data, matches("mean|std"))

training_data_activities <- read.table(y_training_data_path,col.names = c("activity_id"))
test_data_activities     <- read.table(y_test_data_path,col.names = c("activity_id"))

training_data_subjects <- read.csv(file=subject_training_data_path, sep=" ", header=FALSE, col.names=c("subject_id"))
test_data_subjects     <- read.csv(file=subject_test_data_path, sep=" ", header=FALSE, col.names=c("subject_id"))

activity_labels <- read.csv(file=activity_labels_data_path,sep=" ", header=FALSE, col.names = c("id", "activity_label"))

training_data_full <- cbind(training_data_limited, training_data_activities, training_data_subjects)
training_data_final <- left_join(training_data_full, activity_labels, by=c("activity_id" = "id"))

test_data_full <- cbind(test_data_limited, test_data_activities, test_data_subjects)
test_data_final <- left_join(test_data_full, activity_labels, by=c("activity_id" = "id"))


data <- rbind(training_data_final, test_data_final)
data <- select(data, -activity_id)

tidy2 <- data %>% group_by(subject_id, activity_label) %>% summarise_all(mean)

write.csv(data, file="tidy.csv", row.names=FALSE)
write.table(data, file="tidy.txt", row.name=FALSE)
write.csv(tidy2, file="tidy2.csv", row.names=FALSE)
write.table(tidy2, file="tidy2.txt", row.name=FALSE)
