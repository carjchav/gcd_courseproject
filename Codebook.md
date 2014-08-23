*********************************************************************************************
##  DATA CODEBOOK - Getting and Cleaning Data Course Project
*********************************************************************************************


*********************************************************************************************
### SECTION 1: DATA DESCRIPTION
*********************************************************************************************
The features selected for this database come from the accelerometer and gyroscope 3-axial 
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) 
were captured at a constant rate of 50 Hz.

Then they were filtered using a median filter and a 3rd order low pass Butterworth filter 
with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was 
then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ)
using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to 
obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these 
three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, 
tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,fBodyGyroMag, fBodyGyroJerkMag.
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation
* mad(): Median absolute deviation 
* max(): Largest value in array
* min(): Smallest value in array
* sma(): Signal magnitude area
* energy(): Energy measure. Sum of the squares divided by the number of values. 
* iqr(): Interquartile range 
* entropy(): Signal entropy
* arCoeff(): Autorregresion coefficients with Burg order equal to 4
* correlation(): correlation coefficient between two signals
* maxInds(): index of the frequency component with largest magnitude
* meanFreq(): Weighted average of the frequency components to obtain a mean frequency
* skewness(): skewness of the frequency domain signal 
* kurtosis(): kurtosis of the frequency domain signal 
* bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
* angle(): Angle between to vectors.

(**Source**: _Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz._ 
 _Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly -Support_
 _Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012)._ 
 _Vitoria-Gasteiz, Spain. Dec 2012)_

*********************************************************************************************
### SECTION 2: WORK MADE TO CLEAN UP THE DATA
*********************************************************************************************
Based on the features collected from the accelerometers from the Samsung Galaxy S Smartphone,
as detailed above, the following work was made to the test/training dataset for each subject
and each activity.


#### 2.1 Creating one data set (using X_test/train, subject_test/train, y_test/train, and features)
---------------------------------------------------------------------------------------------------

After setting the working directory, all the txt files were read in R (including the dataset
for both test and training, the labels, the subjects, and the features -variables names-).

Once the files were read in, the data was merged to create one dataset. The dataset created,
at this stage, resulted in 563 variables (columns) and 10299 instances (rows). 

This large data set has the following format:


**Table 1.** Data set created after merging the data files.
features.txt (all 561 variables) | subject (id: 1 to 30) | activity (values: 1 to 6)
-------------------------------- | --------------------- | -------------------------
X_test.txt | subject_test.txt | y_test.txt
X_train.txt | subject_train.txt | y_train.txt



#### 2.2 Labelling the data set with descriptive variable names (using features.txt file)
-----------------------------------------------------------------------------------------

The following points about text in data sets, were considered from first lecture on week 4 
of the Getting & Cleaning Data Course:

Names of variables should be,
 - all lower case when possible
 - Descriptive (Diagnosis vs Dx)
 - Not duplicated
 - Not have underscore or dots or white spaces

Based on this criteria for putting descriptive names to variables, the analysis performed 
for this project consisted in,
 - Detecting and changing capital case letters (e.g. Body to body, Acc to acc, X to x, 
   Jerk to jerk, GyroJerkMag to gyrojerkmarg, etc)
 - Detecting and removing unnecessary characters (e.g. "(", ")", "-")
 - Detecting and changing names that can cause confusion when subsetting only
   the mean and standard deviation measures (e.g. "meanFreq" to "mfreq")



#### 2.3 Putting descriptive activity names to name the activities in the data set (using the activity_labels.txt file)
-----------------------------------------------------------------------------------------------------------------------

The following labels were used for naming the activities in the data set:
  - 'Walking' to label activities with the value of 1
  - 'Walking Upstairs' to label activities with the value of 2
  - 'Walking Downstairs' to label activities with the value of 3
  - 'Sitting' to label activities with the value of 4
  - 'Standing' to label activities with the value of 5
  - 'Laying' to label activities with the value of 6



#### 2.4 Picking out the mean and standard deviation variables estimated from the signals 
-----------------------------------------------------------------------------------------

The merged data set obtained in step 1 contains, for each pattern described in SECION 1, 
measures such as mean, standard deviation, max, min, skewness, kurtosis, and others.

In the data set obtained in this step, only the mean and standard deviation measures were
picked out for each pattern. The data set obtained, resulted in a total of 68 variables 
(columns) and still 10299 instances (rows).

This data set has the following format:


**Table 2.** Data set created after picking out the mean and 
             standard deviation variables
features.txt (only 66 variables) | subject (id: 1 to 30) | activity (labels)
-------------------------------- | --------------------- | -----------------
X_test.txt | subject_test.txt | y_test.txt
X_train.txt | subject_train.txt | y_train.txt



#### 2.5 Creating a data set with the average of each variable for each subject, activity
-----------------------------------------------------------------------------------------

At this step, considering the data set illustrated in Table 2, an average measure was
obtained for the 'mean' and 'standard deviation' variables, by every subject-activity
combination. 

The resulted tidy data set has 68 variables (columns), 180 instances (rows), and has
the following format:

**Table 3.** Tidy data set containing the average for the mean and
	     standard deviation measures of each subject/activity
subject (id: 1 to 30) | activity (lables) | average measures (of 66 mean/std variables)
--------------------- | ----------------- | -------------------------------------------
1 | Walking | 
2 | Walking |
3 | Walking | (a 180 x 60 numeric matrix)
. |   ...   |
. |   ...   |
. |   ...   |


*********************************************************************************************
### SECTION 3: VARIABLES DESCRIPTION
*********************************************************************************************
In this section, a description of the tidy data set as well as for the variables contained 
in, follows:


**Table 4.** Database built from the average of mean and standard deviation measures,
             by each subject and each activity.
Data Set Characteristics: | Multivariate | No. instances: | 180
Attribute Characteristics: | See below | No. Attributes: | 68
Associated Tasks: | Merging, Cleaning up, Averagin (as described in SECTION 2) | Missing Values: | N/A


The variables contained in the tidy data set are the following:

Variable Names | Description 
-------------- | ----------- 
subject | Identification of each subject performing the activity. 
 | int: 1, 2, 3, 4, ..., 30
activity | Activity of daily living performed by the subject
 | factor (w/6 levels):
 |   1. Walking
 |   2. Walking Upstairs
 |   3. Walking Downstaris
 |   4. Sitting
 |   5. Standing
 |   6. Laying
For all these 66 variables: | num: min/max values specified below.
1. tbodyaccmeanx |                   min = 0.221             max = 0.301
2. tbodyaccmeany |                   min = -0.04             max = -0.00
3. tbodyaccmeanz |                   min = -0.15             max = -0.07
4. tgravityaccmeanx |                min = -0.68             max = 0.974
5. tgravityaccmeany |                min = -0.47             max = 0.956
6. tgravityaccmeanz |                min = -0.49             max = 0.957
7. tbodyaccjerkmeanx |               min = 0.042             max = 0.130
8. tbodyaccjerkmeany |               min = -0.03             max = 0.056
9. tbodyaccjerkmeanz |               min = -0.06             max = 0.038
10.tbodygyromeanx |                  min = -0.20             max = 0.192
11.tbodygyromeany |                  min = -0.20             max = 0.027
12.tbodygyromeanz |                  min = -0.07             max = 0.179
13.tbodygyrojerkmeanx |              min = -0.15             max = -0.02
14.tbodygyrojerkmeany |              min = -0.07             max = -0.01
15.tbodygyrojerkmeanz |              min = -0.09             max = -0.00
16.tbodyaccmagmean |                 min = -0.98             max = 0.644
17.tgravityaccmagmean |              min = -0.98             max = 0.644
18.tbodyaccjerkmagmean |             min = -0.99             max = 0.434
19.tbodygyromagmean |                min = -0.98             max = 0.418
20.tbodygyrojerkmagmean |            min = -0.99             max = 0.087
21.fbodyaccmeanx |                   min = -0.99             max = 0.537
22.fbodyaccmeany |                   min = -0.98             max = 0.524
23.fbodyaccmeanz |                   min = -0.98             max = 0.280
24.fbodyaccjerkmeanx |               min = -0.99             max = 0.474
25.fbodyaccjerkmeany |               min = -0.98             max = 0.276
26.fbodyaccjerkmeanz |               min = -0.99             max = 0.157
27.fbodygyromeanx |                  min = -0.99             max = 0.474
28.fbodygyromeany |                  min = -0.99             max = 0.328
29.fbodygyromeanz |                  min = -0.98             max = 0.492
30.fbodyaccmagmean |                 min = -0.98             max = 0.586
31.fbodybodyaccjerkmagmean |         min = -0.99             max = 0.538
32.fbodybodygyromagmean |            min = -0.98             max = 0.203
33.fbodybodygyrojerkmagmean |        min = -0.99             max = 0.146
34.tbodyaccstdx |                    min = -0.99             max = 0.626
35.tbodyaccstdy |                    min = -0.99             max = 0.616
36.tbodyaccstdz |                    min = -0.98             max = 0.609
37.tgravityaccstdx |                 min = -0.99             max = -0.82
38.tgravityaccstdy |                 min = -0.99             max = -0.64
39.tgravityaccstdz |                 min = -0.99             max = -0.61
40.tbodyaccjerkstdx |                min = -0.99             max = 0.544
41.tbodyaccjerkstdy |                min = -0.98             max = 0.355
42.tbodyaccjerkstdz |                min = -0.99             max = 0.031
43.tbodygyrostdx |                   min = -0.99             max = 0.267
44.tbodygyrostdy |                   min = -0.99             max = 0.476
45.tbodygyrostdz |                   min = -0.98             max = 0.564
46.tbodygyrojerkstdx |               min = -0.99             max = 0.179
47.tbodygyrojerkstdy |               min = -0.99             max = 0.295
48.tbodygyrojerkstdz |               min = -0.99             max = 0.193
49.tbodyaccmagstd |                  min = -0.98             max = 0.428
50.tgravityaccmagstd |               min = -0.98             max = 0.428
51.tbodyaccjerkmagstd |              min = -0.99             max = 0.450
52.tbodygyromagstd |                 min = -0.98             max = 0.299
53.tbodygyrojerkmagstd |             min = -0.99             max = 0.250
54.fbodyaccstdx |                    min = -0.99             max = 0.658
55.fbodyaccstdy |                    min = -0.99             max = 0.560
56.fbodyaccstdz |                    min = -0.98             max = 0.687
57.fbodyaccjerkstdx |                min = -0.99             max = 0.476
58.fbodyaccjerkstdy |                min = -0.99             max = 0.349
59.fbodyaccjerkstdz |                min = -0.99             max = -0.00
60.fbodygyrostdx |                   min = -0.99             max = 0.196
61.fbodygyrostdy |                   min = -0.99             max = 0.646
62.fbodygyrostdz |                   min = -0.98             max = 0.522
63.fbodyaccmagstd |                  min = -0.98             max = 0.178
64.fbodybodyaccjerkmagstd |          min = -0.99             max = 0.316
65.fbodybodygyromagstd |             min = -0.98             max = 0.236
66.fbodybodygyrojerkmagstd |         min = -0.99             max = 0.287