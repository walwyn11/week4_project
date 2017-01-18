# week4_project
This is my attempt at the Coursera Getting and Cleaning Data Project for Week 4
The purpose of this project is to tidy up a data package.

The package consists of data gathered from 30 individuals using the accelerometers in their Samsung phones.

The data includes XYZ locations received at a frequency of 50 Hz for 6 activities
1. Walking
2. Walking Upstairs
3. Walking Downstairs
4. Sitting
5. Standing
6. Laying

The lines develop as follows.
First is an attempt to download and unzip the files
Second is an attempt to read and combine the necessary files

X_test is combined to X_train to form x_total
Y_test to Y_train to form y_total
Subj_test to Subj_train to form subj_total

The x_total consists of all of the collected data, 561 variables, over 10299 measurements
The y_total consists of the specific activity the user was performing during that measurement, 1 column of 10299 measurements
the subj_total consists of the subject ID number, 1-30 for each of the 10299 measurements

These totals are combined to create one large table consisting of understandable column names and a more readable layout.

Finally, this data is summarized by finding the mean of each variable per activity per individual and saved to a file named Complete_mean.txt
