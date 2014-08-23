******************************************************************************************************************************************************
### Average of mean and standard deviation measures, perfomed by each subject and activity in the Human Activity Recognition Using Smartphones Dataset
******************************************************************************************************************************************************

Tidy data set:   

> Carlos CHAVARRÍA

> Getting and Cleaning Data Course Project on Coursera

> carlos.chavarria.loor@gmail.com

Original Source: 

> Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

> Smartlab - Non Linear Complex Systems Laboratory

> DITEN - Università degli Studi di Genova.

> Via Opera Pia 11A, I-16145, Genoa, Italy.

> activityrecognition@smartlab.ws

> (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) 

----------------------------------------------
The dataset was built using the 'Human Activity Recognition Using Smartphone Dataset'. Several steps where performed using R in order to get a tidy data set that averages for each subject and activity, the mean and standard deviation measures of each pattern contained in the original database.

The steps perfomed entailed: 
 - Merging files
 - Putting descriptive variable names
 - Labelling activities in the original data set with descriptive names
 - Picking out the mean and standard deviation measures, and 
 - Averaging those measures to write a tidy data set

See 'Codebook.md' for more details on:
 - Original data description (SECTION 1)
 - Work made to clean up the data (SECTION 2)
 - Variables description (SECTION 3)

--------------------------------------------
#### For each record it is provided:
- An average of mean and standard deviation measures from the original data set.
- Its activity label. 
- An identifier of the subject who carried out the experiment.


--------------------------------------------
#### This repo includes the following files:
- 'README.md'

- 'Codebook.md':    Describes the work performed to clean up the data, the tidy data set built,
		    and the variables obtained.
         
- 'run_analysis.R': Contains the script in R for performing the analysis.

- 'mydata.txt':     Contains the data set obtained after performing the analysis described in
                    the Codebook and required for the Course Project. Each column in this data set
                    was separated by using 'commas' as separators.
                    In 'mydata.txt' each row identifies the combination of each subject (from 1 to 30)
                    who performed each activity (Walking, Walking Upstairs, Walking Downstairs, Sitting, 
                    Standing, and Lying). Each column contains the average of the mean and standard 
                    deviation measures of the original database.