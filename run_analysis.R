# 
# Script Name: run_analysis.R
#

#
# Clean space/memory
#

print("Clear all variables...")
rm(list=ls())


#
# Start Time
#
beg_time<-as.POSIXct(Sys.time())

print (paste0("Start Time: ", as.character(beg_time)))
# Load Lubridate
library(lubridate)
#
# load dplR
#

library(dplyr)

# 
# Read features file
#
print("Read Features file...")

vnames<-read.table("./data/features.txt", header = FALSE)
# Name Variables in Dataframe
names(vnames)<-c("ID", "VariableNames")
# Create vector from VariableNames
vn<-as.vector(paste0(vnames$ID, "_", vnames$VariableNames))
#
# Read data file for train data into dataframe
#
print("Read training file...")

trainDfX<-read.table("./data/train/X_train.txt")
#
# Read data file for test data into dataframe
#
print("Read test files...")

testDfX<-read.table("./data/test/X_test.txt")


# Merge test & training data set

print("Merge test & training data sets...")

CompletedfX<-rbind(testDfX,trainDfX)

#
# Name all columns/variable with the vn vector
#
names(CompletedfX)<-vn


#
# Convert to data table
#

print("Convert merged data frame to data table...")
CompleteDT<-tbl_df(CompletedfX)

#
# Cleanup memory
# Delete testDfx, trainDfx, vn, vnames 
#
rm(CompletedfX)
rm(testDfX)
rm(trainDfX)
rm(vnames)
rm(vn)

#
# Select all means and standard deviations from data set into a new dataframe
#
print("Create new data sets by selecting all means and standard deviations...")

#
# Create datasets of the mean and standard deviation of the 3 components (X, Y, Z), for the Time Body
# Acceleration, Time Gravity Acceleration, Time Body Acceleration Jerk and Time Body Gyro. 
#
#


#
# Get all Time Body Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationMeansDT...")

TimeBodyAccelerationMeansDT<-select(CompleteDT, contains("tBodyAcc-mean()"))
# Name the variables
vn<-c("X_AxisTimeBodyAccelerationMean", "Y_AxisTimeBodyAccelerationMean", "Z_AxisTimeBodyAccelerationMean")
names(TimeBodyAccelerationMeansDT)<-vn

#
# Get all Time Body Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationStandardDevDT...")

TimeBodyAccelerationStandardDevDT<-select(CompleteDT, contains("tBodyAcc-std()"))
# Name the variables
vn<-c("X_AxisTimeBodyAccelerationStandardDev", "Y_AxisTimeBodyAccelerationStandardDev", "Z_AxisTimeBodyAccelerationStandardDev")
names(TimeBodyAccelerationStandardDevDT)<-vn

#
# Get all Time Gravity Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeGravityAccelerationMeansDT...")

TimeGravityAccelerationMeansDT<-select(CompleteDT, contains("tGravityAcc-mean()"))
# Name the variables
vn<-c("X_AxisTimeGravityAccelerationMean", "Y_AxisTimeGravityAccelerationMean", "Z_AxisTimeGravityAccelerationMean")
names(TimeGravityAccelerationMeansDT)<-vn

#
# Get all Time Gravity Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeGravityAccelerationStandardDeviation...")

TimeGravityAccelerationStandardDevDT<-select(CompleteDT, contains("tGravityAcc-std()"))
# Name the variables
vn<-c("X_AxisTimeGravityAccelerationStandardDev", "Y_AxisTimeGravityAccelerationStandardDev", "Z_AxisTimeGravityAccelerationStandardDev")
names(TimeGravityAccelerationStandardDevDT)<-vn

#
# Get all Time Body Acceleration Jerk Means (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationJerkMeansDT...")

TimeBodyAccelerationJerkMeansDT<-select(CompleteDT, contains("tBodyAccJerk-mean()"))
# Name the variables
vn<-c("X_AxisTimeBodyAccelerationJerkMean", "Y_AxisTimeBodyAccelerationJerkMean", "Z_AxisTimeBodyAccelerationJerkMean")
names(TimeBodyAccelerationJerkMeansDT)<-vn

#
# Get all Time Body Acceleration Jerk Standard Deviation (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationJerkStandardDevDT...")

TimeBodyAccelerationJerkStandardDevDT<-select(CompleteDT, contains("tBodyAccJerk-std()"))
# Name the variables
vn<-c("X_AxisTimeBodyAccelerationJerkStandardDev", "Y_AxisTimeBodyAccelerationJerkStandardDev", "Z_AxisTimeBodyAccelerationJerkStandardDev")
names(TimeBodyAccelerationJerkStandardDevDT)<-vn

#
# Get all Time Body Gyroscope Means (X, Y, Z axis) into one table
#
print("Create TimeBodyGyroMeansDT...")

TimeBodyGyroMeansDT<-select(CompleteDT, contains("tBodyGyro-mean()"))
# Name the variables
vn<-c("X_AxisTimeBodyGyroMean", "Y_AxisTimeBodyGyroMean", "Z_AxisTimeBodyGyroMean")
names(TimeBodyGyroMeansDT)<-vn

#
# Get all Time Body Gyroscope Means (X, Y, Z axis) into one table
#
print("Create TimeBodyGyroStandardDevDT...")

TimeBodyGyroStandardDevDT<-select(CompleteDT, contains("tBodyGyro-std()"))
# Name the variables
vn<-c("X_AxisTimeBodyGyroStandardDev", "Y_AxisTimeBodyGyroStandardDev", "Z_AxisTimeBodyGyroStandardDev")
names(TimeBodyGyroStandardDevDT)<-vn

#
# Get all Frequency Body Acceleration Means (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationMeansDT...")

FrequencyBodyAccelerationMeansDT<-select(CompleteDT, contains("fBodyAcc-mean()"))
# Name the variables
vn<-c("X_AxisFrequencyBodyAccelerationMean", "Y_AxisFrequencyBodyAccelerationMean", "Z_AxisFrequencyBodyAccelerationMean")
names(FrequencyBodyAccelerationMeansDT)<-vn

#
# Get all Frequency Body Acceleration Standard Deviation (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationStandardDevDT...")

FrequencyBodyAccelerationStandardDevDT<-select(CompleteDT, contains("fBodyAcc-std()"))
# Name the variables
vn<-c("X_AxisFrequencyBodyAccelerationStandardDev", "Y_AxisFrequencyBodyAccelerationStandardDev", "Z_AxisFrequencyBodyAccelerationStandardDev")
names(FrequencyBodyAccelerationStandardDevDT)<-vn

#
# Get all Frequency Body Acceleration Jerk Means (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationJerkMeansDT...")

FrequencyBodyAccelerationJerkMeansDT<-select(CompleteDT, contains("fBodyAccJerk-mean()"))
# Name the variables
vn<-c("X_AxisFrequencyBodyAccelerationJerkMean", "Y_AxisFrequencyBodyAccelerationJerkMean", "Z_AxisFrequencyBodyAccelerationJerkMean")
names(FrequencyBodyAccelerationJerkMeansDT)<-vn

#
# Get all Frequency Body Acceleration Jerk Standard Deviation (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationJerkStandardDevDT...")

FrequencyBodyAccelerationJerkStandardDevDT<-select(CompleteDT, contains("fBodyAccJerk-std()"))
# Name the variables
vn<-c("X_AxisFrequencyBodyAccelerationJerkStandardDev", "Y_AxisFrequencyBodyAccelerationJerkStandardDev", "Z_AxisFrequencyBodyAccelerationJerkStandardDev")
names(FrequencyBodyAccelerationJerkStandardDevDT)<-vn

#
#
# Create Tidy Data Set of Averages of all variables
#
#


#
# Create tidy set for Time Body Acceleration Means by Calculating Average of all variables
#
print("Creating TIDY DATA SET...")

#
# Means Data Sets
#


print("Calculating Averages for tidyAverageOfTimeBodyAccelerationMeans DATA SET...")

# Compute average of dataset all variables
tidyAverageOfMeansDT<-sapply(TimeBodyAccelerationMeansDT,mean)

# Transpose Result
tidyAverageOfMeansDT<-t(tidyAverageOfMeansDT)
#Convert to Data Frame
tidyAverageOfMeansDT<-data.frame(tidyAverageOfMeansDT)
#Convert to Data Table
tidyAverageOfMeansDT<-tbl_df(tidyAverageOfMeansDT)
# Add Measurement Description Column
tidyAverageOfMeansDT<-mutate(tidyAverageOfMeansDT, Measurement_Description="Average of Time Body Acceleration Means")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tidyAverageOfMeansDT)<-vn
# order columns starting with Measurement description
tidyAverageOfMeansDT<-select(tidyAverageOfMeansDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

print("Calculating Averages for tidyAverageOfTimeBodyGravityAccelerationMeans DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(TimeGravityAccelerationMeansDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Time Body Gravity Acceleration Means")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfMeansDT<-bind_rows(tidyAverageOfMeansDT, tmpDT)


print("Calculating Averages for TimeBodyAccelerationJerkMeansDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(TimeBodyAccelerationJerkMeansDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Time Body Acceleration Jerk Means")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfMeansDT<-bind_rows(tidyAverageOfMeansDT, tmpDT)



print("Calculating Averages for TimeBodyGyroMeansDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(TimeBodyGyroMeansDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Time Body Gyro Means")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfMeansDT<-bind_rows(tidyAverageOfMeansDT, tmpDT)

print("Calculating Averages for FrequencyBodyAccelerationMeansDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(FrequencyBodyAccelerationMeansDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Frequency Body Acceleration Means")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfMeansDT<-bind_rows(tidyAverageOfMeansDT, tmpDT)


print("Calculating Averages for FrequencyBodyAccelerationJerkMeansDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(FrequencyBodyAccelerationJerkMeansDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Frequency Body Acceleration Jerk Means")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfMeansDT<-bind_rows(tidyAverageOfMeansDT, tmpDT)

#
#  Standard Deviation Measurements Data Sets
#

print("Creating tidyAverageOfTimeBodyAccelerationStandardDeviation DATA SET...")

# Compute average of dataset all variables
tidyAverageOfStdDevDT<-sapply(TimeGravityAccelerationStandardDevDT,mean)

# Transpose Result
tidyAverageOfStdDevDT<-t(tidyAverageOfStdDevDT)
#Convert to Data Frame
tidyAverageOfStdDevDT<-data.frame(tidyAverageOfStdDevDT)
#Convert to Data Table
tidyAverageOfStdDevDT<-tbl_df(tidyAverageOfStdDevDT)
# Add Measurement Description Column
tidyAverageOfStdDevDT<-mutate(tidyAverageOfStdDevDT, Measurement_Description="Average of Time Body Acceleration Standard Deviation")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tidyAverageOfStdDevDT)<-vn
# order columns starting with Measurement description
tidyAverageOfStdDevDT<-select(tidyAverageOfStdDevDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

print("Calculating Averages for TimeGravityAccelerationStandardDevDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(TimeGravityAccelerationStandardDevDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Time Gravity Acceleration Standard Deviation")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfStdDevDT<-bind_rows(tidyAverageOfStdDevDT, tmpDT)


print("Calculating Averages for TimeBodyAccelerationJerkStandardDevDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(TimeBodyAccelerationJerkStandardDevDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Time Body Acceleration Jerk Standard Deviation")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfStdDevDT<-bind_rows(tidyAverageOfStdDevDT, tmpDT)

print("Calculating Averages for TimeBodyGyroStandardDevDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(TimeBodyGyroStandardDevDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Time Body Gyro Standard Deviation")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfStdDevDT<-bind_rows(tidyAverageOfStdDevDT, tmpDT)

print("Calculating Averages for FrequencyBodyAccelerationStandardDevDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(FrequencyBodyAccelerationStandardDevDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Frequency Body Acceleration Standard Deviation")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfStdDevDT<-bind_rows(tidyAverageOfStdDevDT, tmpDT)

print("Calculating Averages for FrequencyBodyAccelerationJerkStandardDevDT DATA SET...")

# Compute average of dataset all variables
tmpDT<-sapply(FrequencyBodyAccelerationJerkStandardDevDT,mean)

# Transpose Result
tmpDT<-t(tmpDT)
#Convert to Data Frame
tmpDT<-data.frame(tmpDT)
#Convert to Data Table
tmpDT<-tbl_df(tmpDT)
# Add Measurement Description Column
tmpDT<-mutate(tmpDT, Measurement_Description="Average of Frequency Body Acceleration Jerk Standard Deviation")
# Name variables
vn<-c( "X_Axis", "Y_Axis", "Z_Axis", "Measurement_Description")
names(tmpDT)<-vn
# order columns starting with Measurement description
tmpDT<-select(tmpDT, Measurement_Description, X_Axis, Y_Axis, Z_Axis )

tidyAverageOfStdDevDT<-bind_rows(tidyAverageOfStdDevDT, tmpDT)

#
#
# Save  Tidy Data Sets
#
print("Saving Tidy Data Sets")

tidyDataSet<-bind_rows(tidyAverageOfMeansDT,tidyAverageOfStdDevDT)

write.table(tidyDataSet,"tidyDataSet.txt", row.names = FALSE)

print("Output File: tidyDataSet")

print("Clean up all possible memory...")
# Creates Objects List
lst<-ls()
# Search it and select objects for deletion
lv<-grepl("Time|Freq|tmp|Complete|Average",lst)
# delete selected objects
rm(list=lst[lv])
rm(lst)

#
# End Time
#
end_time<-as.POSIXct(Sys.time())
elapsed_time <-(beg_time-end_time)

print (paste0("End Time: ", as.character(end_time)))
print(elapsed_time)
rm(beg_time)       
rm(elapsed_time)
rm(lv)
rm(end_time)
rm(vn)
