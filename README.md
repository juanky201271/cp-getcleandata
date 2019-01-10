## Script - Course Project - Getting and Cleaning Data
## Author: Juan Carlos Carmona Calvo
## ------------------------------------------------------

To convert Raw data to Tidy data you must run the Run run_analysis() function stored in the Run_analysis.R file.
The function generates an explanatory log of the different phases of the process.

# Fases Conversion:
- Sets the Active Directory to: UCI-HAR-Dataset containing all Raw files unzipped.
- Create the Output directory: UCI-HAR-Dataset-Tidy.
- We load in memory the libraries: Plyr and Dplyr. (Informational messages may appear in red, can be ignored if the process continues)
- We read the files: 'test\y-test.txt' and 'train\y-train.txt' that contain the observed activities. We set the column name to 'Activity'. We create a new column in each Dataset with the type of observation: 'test' or 'training'.
- We read the files: 'test\subject_test.txt' and 'train\subject_train.txt' containing the observed individuals. We set the column name to 'Subject'.
- We read the files: 'test\X_test.txt' and 'train\X_train.txt' that contain the more than 500 variables observed and calculated.
- We read the files: 'features.txt' and 'activity_labels.txt' that contain the names of the variables and the names of the activities.
- Of the more than 500 variables we only select the ones whose name contains 'mean' or 'std', we normalize the names of the chosen ones. We remove punctuation characters, for example: '-' or '(' or ')'. The prefixes 't' and 'f' give their meaning: 'Time' and 'Frequency'. The rest of the names are left to you.
- Change in the 2 datasets in memory, test and train the activity code by its denomination.
- We unify in a single dataset the columns of the 3 'test' datasets.
- We unify in a single dataset the columns of the 3 'train' datasets.
- Unified the rows of the 2 unified dataset, 'test' and 'train', in a single dataset with all the data.
- From the single and unified Dataset, we create a new one that contains the means of all its variables, grouped by activity and individual.
- Sets the Active Directory to: UCI-HAR-Dataset-Tidy and writes the 2 datasets result of the transformation.
