# CodeBook

## Data

Data for this project comes from the [Human Activity Recognition Using Smartphones Data Set ](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). Short description of the project:

_Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors._

The dataset was split into training and test data. The split was about 70/30. There were 30 subjects in the trails. Six activity types were measured.

* Walking
* Walking upstairs
* Walking downstairs
* Sitting
* Standing
* Laying

The orginal dataset contained 561 features.

## Purpose of run_analysis.R

The script in the repository aims to combine and clean the above data set. First, the training and test datasets are combined. Next the seperate data file containing the ID number of the activity is combined. Next the subjects ID numbers are added as a new column. Then the IDs are replaced with their textual labels to be more user friendly. Finally the feature names are cleaned of stray punctuation characters (paraens, dashes) and forced to lowercase and the dataset is limited to features related to means and standard deviations of the original raw data. These transformations are applied and written out to a file.

Next the transformed data from above is further summarized to show averages of the features grouped by the subjects ID number and the activity. This summary is then written out to a file.
