##Code Book - Course Project - Getting and Cleaning Data
##Author: Juan Carlos Carmona Calvo
##------------------------------------------------------

#Raw Data:
Human Activity  Recognition Using Smartphones Dataset
Version 1.0
Folder: UCI-HAR-Dataset

#Tidy Data:
We have joined all the data in a single DataSet, called DF_result.txt, and we have left it in the folder UCI-HAR-DataSet-Tidy. We have also created another Dataset with the averages of each variable, activity and individual.

#Variables transformed
- Activity: It has been recoded, replacing the code with the value alphabetical:
		WALKING				1
		WALKING_UPSTAIRS	2
		WALKING_DOWNSTAIRS	3
		SITTING				4
		STANDING			5
		LAYING				6
- Typeobservation: The observations can be of two types:
		test
		training
- Subject: Number from 1 to 30 that distinguishes the different individuals who have lent themselves to these measurements.

#Variables inherited
Of the more than 500 Variables of Raw Data We have selected only those that are type 'mean' and 'std', which are 79 and we have made the following transformations:
-Removed all the symbols and characters not alfabetics of all the names of Variables.
-replace 't' prefix with 'Time'
-replace prefix 'f' with 'Frequency'