# 
# Script Name: run_analysis.R
# Miguel Hidalgo
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
print("Read training files...")

trainDfX<-read.table("./data/train/X_train.txt")
trainDfy<-read.table("./data/train/y_train.txt")
subject_train<-read.table("./data/train/subject_train.txt")

#
# Read data file for test data into dataframe
#
print("Read test files...")

testDfX<-read.table("./data/test/X_test.txt")
testDfy<-read.table("./data/test/y_test.txt")
subject_test<-read.table("./data/test/subject_test.txt")

print("Read Activities label file...")

activitiesDT<-read.table("./data/activity_labels.txt")
names(activitiesDT)<-c("Activity_Code", "Activity_Description")
activitiesDT<-mutate(activitiesDT, Activity_Count=0)


# Merge test & training data set

print("Merge test & training data sets...")

CompletedfX<-rbind(testDfX,trainDfX)
Completedfy<-rbind(testDfy,trainDfy)
CompleteSubjectdf<-rbind(subject_test,subject_train)


#
# Name all columns/variable with the vn vector
#
names(CompletedfX)<-vn
names(Completedfy)<-"Activities"
names(CompleteSubjectdf)<-"Subjects_Number"



#
# Convert to data table
#

print("Convert merged data frame to data table...")
CompleteDT<-tbl_df(CompletedfX)
CompleteDTy<-tbl_df(Completedfy)
CompleteDTy$Activities<-factor(CompleteDTy$Activities)
CompleteSubjectDT<-tbl_df(CompleteSubjectdf)
CompleteDT<-cbind(CompleteSubjectDT,CompleteDTy, CompleteDT)

#
# Count activities
#
print ( "Count Activities")

for (j in 1:length(activitiesDT$Activity_Code))
  for (i in 1:length(CompleteDTy$Activities)) {
    
    if (activitiesDT$Activity_Code[j]==CompleteDTy$Activities[i]) {
      activitiesDT$Activity_Count[j]<-activitiesDT$Activity_Count[j]+1
    }
  
  }


#
# Cleanup memory
# Delete testDfx, trainDfx, vn, vnames 
#
rm(CompletedfX)
rm(CompleteSubjectdf)
rm(CompleteDTy)
#rm(CompleteSubjectDT)
rm(testDfX)
rm(trainDfX)
rm(Completedfy)
rm(testDfy)
rm(trainDfy)
rm(vnames)
rm(vn)
rm(i)
rm(j)
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

TimeBodyAccelerationMeansDT<-select(CompleteDT, Subjects_Number, Activities, contains("tBodyAcc-mean()"))
# Name the variables
vn<-c("Subjects_Number", "Activities", "X_AxisTimeBodyAccelerationMean", "Y_AxisTimeBodyAccelerationMean", "Z_AxisTimeBodyAccelerationMean")
names(TimeBodyAccelerationMeansDT)<-vn

# Calculate the Time Body Accelaration Mean Average for each Subject (1 to 30) for each Activity (1 to 6)
# and save it in a table with a description

NoOfSubjects<-30
NoOfActivities<-6
Measurement_Description="Average of Time Body Acceleration Mean"
tidyAverageDataSetDT<-NULL


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeBodyAccelerationMeansDT[TimeBodyAccelerationMeansDT$Subjects_Number==j & +   
                                as.numeric(TimeBodyAccelerationMeansDT$Activities)==i,]
      tmp_X<-mean(tmpDT$X_AxisTimeBodyAccelerationMean)
      tmp_Y<-mean(tmpDT$Y_AxisTimeBodyAccelerationMean)
      tmp_Z<-mean(tmpDT$Z_AxisTimeBodyAccelerationMean)
      
      sn<-j
      Act<-i
      
      tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
      tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }



#
# Get all Time Body Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationStandardDevDT...")

TimeBodyAccelerationStandardDevDT<-select(CompleteDT, Subjects_Number, Activities, contains("tBodyAcc-std()"))
# Name the variables
vn<-c("Subjects_Number", "Activities", "X_AxisTimeBodyAccelerationStandardDev", "Y_AxisTimeBodyAccelerationStandardDev", "Z_AxisTimeBodyAccelerationStandardDev")
names(TimeBodyAccelerationStandardDevDT)<-vn

Measurement_Description="Average of Time Body Acceleration Standard Deviation"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeBodyAccelerationStandardDevDT[TimeBodyAccelerationStandardDevDT$Subjects_Number==j & +   
                                         as.numeric(TimeBodyAccelerationStandardDevDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeBodyAccelerationStandardDev)
    tmp_Y<-mean(tmpDT$Y_AxisTimeBodyAccelerationStandardDev)
    tmp_Z<-mean(tmpDT$Z_AxisTimeBodyAccelerationStandardDev)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }


#
# Get all Time Gravity Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeGravityAccelerationMeansDT...")

TimeGravityAccelerationMeansDT<-select(CompleteDT, Subjects_Number, Activities ,contains("tGravityAcc-mean()"))
# Name the variables
vn<-c("Subjects_Number", "Activities","X_AxisTimeGravityAccelerationMean", "Y_AxisTimeGravityAccelerationMean", "Z_AxisTimeGravityAccelerationMean")
names(TimeGravityAccelerationMeansDT)<-vn


Measurement_Description="Average of Time Gravity Acceleration Mean"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeGravityAccelerationMeansDT[TimeGravityAccelerationMeansDT$Subjects_Number==j & +   
                                               as.numeric(TimeGravityAccelerationMeansDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeGravityAccelerationMean)
    tmp_Y<-mean(tmpDT$Y_AxisTimeGravityAccelerationMean)
    tmp_Z<-mean(tmpDT$Z_AxisTimeGravityAccelerationMean)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }




#
# Get all Time Gravity Acceleration Means (X, Y, Z axis) into one table
#
print("Create TimeGravityAccelerationStandardDeviation...")

TimeGravityAccelerationStandardDevDT<-select(CompleteDT, Subjects_Number, Activities, contains("tGravityAcc-std()"))
# Name the variables
vn<-c("Subjects_Number","Activities","X_AxisTimeGravityAccelerationStandardDev", "Y_AxisTimeGravityAccelerationStandardDev", "Z_AxisTimeGravityAccelerationStandardDev")
names(TimeGravityAccelerationStandardDevDT)<-vn



Measurement_Description="Average of Time Gravity Acceleration Standard Deviation"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeGravityAccelerationStandardDevDT[TimeGravityAccelerationStandardDevDT$Subjects_Number==j & +   
                                            as.numeric(TimeGravityAccelerationStandardDevDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeGravityAccelerationStandardDev)
    tmp_Y<-mean(tmpDT$Y_AxisTimeGravityAccelerationStandardDev)
    tmp_Z<-mean(tmpDT$Z_AxisTimeGravityAccelerationStandardDev)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }




#
# Get all Time Body Acceleration Jerk Means (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationJerkMeansDT...")

TimeBodyAccelerationJerkMeansDT<-select(CompleteDT, Subjects_Number, Activities, contains("tBodyAccJerk-mean()"))
# Name the variables
vn<-c("Subjects_Number", "Activities","X_AxisTimeBodyAccelerationJerkMean", "Y_AxisTimeBodyAccelerationJerkMean", "Z_AxisTimeBodyAccelerationJerkMean")
names(TimeBodyAccelerationJerkMeansDT)<-vn

Measurement_Description="Average of Time Body Acceleration Jerk Mean"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeBodyAccelerationJerkMeansDT[TimeGravityAccelerationStandardDevDT$Subjects_Number==j & +   
                                                  as.numeric(TimeBodyAccelerationJerkMeansDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeBodyAccelerationJerkMean)
    tmp_Y<-mean(tmpDT$Y_AxisTimeBodyAccelerationJerkMean)
    tmp_Z<-mean(tmpDT$Z_AxisTimeBodyAccelerationJerkMean)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }



#
# Get all Time Body Acceleration Jerk Standard Deviation (X, Y, Z axis) into one table
#
print("Create TimeBodyAccelerationJerkStandardDevDT...")

TimeBodyAccelerationJerkStandardDevDT<-select(CompleteDT, Subjects_Number, Activities, contains("tBodyAccJerk-std()"))
# Name the variables
vn<-c("Subjects_Number", "Activities","X_AxisTimeBodyAccelerationJerkStandardDev", "Y_AxisTimeBodyAccelerationJerkStandardDev", "Z_AxisTimeBodyAccelerationJerkStandardDev")
names(TimeBodyAccelerationJerkStandardDevDT)<-vn

Measurement_Description="Average of Time Body Acceleration Jerk Standard Deviation"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeBodyAccelerationJerkStandardDevDT[TimeBodyAccelerationJerkStandardDevDT$Subjects_Number==j & +   
                                             as.numeric(TimeBodyAccelerationJerkStandardDevDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeBodyAccelerationJerkStandardDev)
    tmp_Y<-mean(tmpDT$Y_AxisTimeBodyAccelerationJerkStandardDev)
    tmp_Z<-mean(tmpDT$Z_AxisTimeBodyAccelerationJerkStandardDev)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }



#
# Get all Time Body Gyroscope Means (X, Y, Z axis) into one table
#
print("Create TimeBodyGyroMeansDT...")

TimeBodyGyroMeansDT<-select(CompleteDT, Subjects_Number, Activities, contains("tBodyGyro-mean()"))
# Name the variables
vn<-c("Subjects_number","Activities","X_AxisTimeBodyGyroMean", "Y_AxisTimeBodyGyroMean", "Z_AxisTimeBodyGyroMean")
names(TimeBodyGyroMeansDT)<-vn

Measurement_Description="Average of Time Body Gyro Means"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeBodyGyroMeansDT[TimeBodyGyroMeansDT$Subjects_Number==j & +   
                                                   as.numeric(TimeBodyGyroMeansDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeBodyGyroMean)
    tmp_Y<-mean(tmpDT$Y_AxisTimeBodyGyroMean)
    tmp_Z<-mean(tmpDT$Z_AxisTimeBodyGyroMean)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }


#
# Get all Time Body Gyroscope Means (X, Y, Z axis) into one table
#
print("Create TimeBodyGyroStandardDevDT...")

TimeBodyGyroStandardDevDT<-select(CompleteDT, Subjects_Number, Activities, contains("tBodyGyro-std()"))
# Name the variables
vn<-c("Subjects_Number","Activities","X_AxisTimeBodyGyroStandardDev", "Y_AxisTimeBodyGyroStandardDev", "Z_AxisTimeBodyGyroStandardDev")
names(TimeBodyGyroStandardDevDT)<-vn

Measurement_Description="Average of Time Body Gyro Standard Deviation"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-TimeBodyGyroStandardDevDT[TimeBodyGyroStandardDevDT$Subjects_Number==j & +   
                                 as.numeric(TimeBodyGyroStandardDevDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisTimeBodyGyroStandardDev)
    tmp_Y<-mean(tmpDT$Y_AxisTimeBodyGyroStandardDev)
    tmp_Z<-mean(tmpDT$Z_AxisTimeBodyGyroStandardDev)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }




#
# Get all Frequency Body Acceleration Means (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationMeansDT...")

FrequencyBodyAccelerationMeansDT<-select(CompleteDT, Subjects_Number, Activities, contains("fBodyAcc-mean()"))
# Name the variables
vn<-c("Subjects_Numbers","Activities","X_AxisFrequencyBodyAccelerationMean", "Y_AxisFrequencyBodyAccelerationMean", "Z_AxisFrequencyBodyAccelerationMean")
names(FrequencyBodyAccelerationMeansDT)<-vn

Measurement_Description="Average of Frequency Body Acceleration Means"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-FrequencyBodyAccelerationMeansDT[FrequencyBodyAccelerationMeansDT$Subjects_Number==j & +   
                                       as.numeric(FrequencyBodyAccelerationMeansDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisFrequencyBodyAccelerationMean)
    tmp_Y<-mean(tmpDT$Y_AxisFrequencyBodyAccelerationMean)
    tmp_Z<-mean(tmpDT$Z_AxisFrequencyBodyAccelerationMean)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }


#
# Get all Frequency Body Acceleration Standard Deviation (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationStandardDevDT...")

FrequencyBodyAccelerationStandardDevDT<-select(CompleteDT, Subjects_Number, Activities, contains("fBodyAcc-std()"))
# Name the variables
vn<-c("Subjects_Number","Activities","X_AxisFrequencyBodyAccelerationStandardDev", "Y_AxisFrequencyBodyAccelerationStandardDev", "Z_AxisFrequencyBodyAccelerationStandardDev")
names(FrequencyBodyAccelerationStandardDevDT)<-vn


Measurement_Description="Average of Frequency Body Acceleration Standard Deviation"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-FrequencyBodyAccelerationStandardDevDT[FrequencyBodyAccelerationStandardDevDT$Subjects_Number==j & +   
                                              as.numeric(FrequencyBodyAccelerationStandardDevDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisFrequencyBodyAccelerationStandardDev)
    tmp_Y<-mean(tmpDT$Y_AxisFrequencyBodyAccelerationStandardDev)
    tmp_Z<-mean(tmpDT$Z_AxisFrequencyBodyAccelerationStandardDev)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }


#
# Get all Frequency Body Acceleration Jerk Means (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationJerkMeansDT...")

FrequencyBodyAccelerationJerkMeansDT<-select(CompleteDT, Subjects_Number, Activities, contains("fBodyAccJerk-mean()"))
# Name the variables
vn<-c("Subjects_Number","Activities","X_AxisFrequencyBodyAccelerationJerkMean", "Y_AxisFrequencyBodyAccelerationJerkMean", "Z_AxisFrequencyBodyAccelerationJerkMean")
names(FrequencyBodyAccelerationJerkMeansDT)<-vn

Measurement_Description="Average of Frequency Body Acceleration Jerk Means"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-FrequencyBodyAccelerationJerkMeansDT[FrequencyBodyAccelerationJerkMeansDT$Subjects_Number==j & +   
                                                    as.numeric(FrequencyBodyAccelerationJerkMeansDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisFrequencyBodyAccelerationJerkMean)
    tmp_Y<-mean(tmpDT$Y_AxisFrequencyBodyAccelerationJerkMean)
    tmp_Z<-mean(tmpDT$Z_AxisFrequencyBodyAccelerationJerkMean)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }



#
# Get all Frequency Body Acceleration Jerk Standard Deviation (X, Y, Z axis) into one table
#
print("Create FrequencyBodyAccelerationJerkStandardDevDT...")

FrequencyBodyAccelerationJerkStandardDevDT<-select(CompleteDT, Subjects_Number, Activities, contains("fBodyAccJerk-std()"))
# Name the variables
vn<-c("Subjects_Number","Activities","X_AxisFrequencyBodyAccelerationJerkStandardDev", "Y_AxisFrequencyBodyAccelerationJerkStandardDev", "Z_AxisFrequencyBodyAccelerationJerkStandardDev")
names(FrequencyBodyAccelerationJerkStandardDevDT)<-vn


Measurement_Description="Average of Frequency Body Acceleration Jerk Standard Deviation"


for (j in 1:NoOfSubjects)
  for (i in 1:NoOfActivities) {
    # Filter Subjects_Number and Activities
    tmpDT<-FrequencyBodyAccelerationJerkStandardDevDT[FrequencyBodyAccelerationJerkStandardDevDT$Subjects_Number==j & +   
                                                    as.numeric(FrequencyBodyAccelerationJerkStandardDevDT$Activities)==i,]
    tmp_X<-mean(tmpDT$X_AxisFrequencyBodyAccelerationJerkStandardDev)
    tmp_Y<-mean(tmpDT$Y_AxisFrequencyBodyAccelerationJerkStandardDev)
    tmp_Z<-mean(tmpDT$Z_AxisFrequencyBodyAccelerationJerkStandardDev)
    
    sn<-j
    Act<-i
    
    tmpDf<-data.frame(c(Measurement_Description),c(sn), c(Act), c(tmp_X), c(tmp_Y),c(tmp_Z))
    tidyAverageDataSetDT<-rbind(tidyAverageDataSetDT, tmpDf)
    
  }



vn<-c("Measurement_Description","Subjects_Number", "Activities", "X_Axis", "Y_Axis", "Z_Axis")
names(tidyAverageDataSetDT)<-vn


#
# Create tidy set for Time Body Acceleration Means by Calculating Average of all variables
#
print("SAVING TIDY DATA SET...")

dimension<-dim(tidyAverageDataSetDT)

print(paste("Data Set Observations=", dimension[1], "# of Variables=", dimension[2]))

write.table(tidyAverageDataSetDT,"tidyAverageDataSetDT.txt", row.names = FALSE)

write.table(activitiesDT,"tidyDSActivities.txt", row.names = FALSE)

print("Output File: tidyAverageDataSetDT.txt")

#
# End Time
#
end_time<-as.POSIXct(Sys.time())
elapsed_time <-(beg_time-end_time)

print (paste0("End Time: ", as.character(end_time)))
print(elapsed_time)

print("Clean up all possible memory...")


rm(beg_time)       
rm(elapsed_time)
rm(end_time)
rm(vn)
rm(i)
rm(j)
rm(dimension)
# Creates Objects List
lst<-ls()
# Search it and select objects for deletion
lv<-grepl("Time|Freq|tmp|Complete|subject|Mea|No|sn|Act",lst)
# delete selected objects
rm(list=lst[lv])
rm(lst)
rm(lv)

#
# End of Script
#
