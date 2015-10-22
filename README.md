### GettingAndCleaningData Course Project
===========================================
#####The Getting And Cleaning Data Course Project requires you to download a set of Data from the following study:
==================================================================
### Human Activity Recognition Using Smartphones Dataset
##### Version 1.0
==================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
##### www.smartlab.ws
==================================================================
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

####For each record it is provided:
==============================
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

####The following operations were executed by the R script called run_analysis.R:

* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
  * Creates individual 12 data sets, one for each measurement of the mean (6) and one for each measurement of the StdDev (6). 
  * Uses descriptive activity names to name the activities in the data set and the variables are labeled accordingly.
  * From the data sets created previously, creates a second, single independent tidy data set with the average of each variable
for each activity and each subject.

All data must be located in the "data" directory inside the project home directory ("./data" in the original order that the 
data decompresses after download, files for the test set under "./data/test" and files for the train set under "./data/train"

For a Description of the tidyDataSet, read the tidyDataSetCodeBook.md

Tidy Data Sample Set Below:

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=windows-1252">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 15">
<link rel=File-List href="tidyAverageDataSetDT_files/filelist.xml">
<style id="tidyAverageDataSetDT_686_Styles">
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
.xl15686
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl63686
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border:.5pt solid windowtext;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:nowrap;}
.xl64686
	{padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:black;
	font-size:11.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Calibri, sans-serif;
	mso-font-charset:0;
	mso-number-format:General;
	text-align:center;
	vertical-align:bottom;
	border:.5pt solid windowtext;
	background:#C6E0B4;
	mso-pattern:black none;
	white-space:nowrap;}
-->
</style>
</head>

<body>
<!--[if !excel]>&nbsp;&nbsp;<![endif]-->
<!--The following information was generated by Microsoft Excel's Publish as Web
Page wizard.-->
<!--If the same item is republished from Excel, all information between the DIV
tags will be replaced.-->
<!----------------------------->
<!--START OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD -->
<!----------------------------->

<div id="tidyAverageDataSetDT_686" align=center x:publishsource="Excel">

<table border=0 cellpadding=0 cellspacing=0 width=863 style='border-collapse:
 collapse;table-layout:fixed;width:649pt'>
 <col width=418 style='mso-width-source:userset;mso-width-alt:15286;width:314pt'>
 <col width=118 style='mso-width-source:userset;mso-width-alt:4315;width:89pt'>
 <col width=65 style='mso-width-source:userset;mso-width-alt:2377;width:49pt'>
 <col width=84 style='mso-width-source:userset;mso-width-alt:3072;width:63pt'>
 <col width=89 span=2 style='mso-width-source:userset;mso-width-alt:3254;
 width:67pt'>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl64686 width=418 style='height:15.0pt;width:314pt'>Measurement_Description</td>
  <td class=xl64686 width=118 style='border-left:none;width:89pt'>Subjects_Number</td>
  <td class=xl64686 width=65 style='border-left:none;width:49pt'>Activities</td>
  <td class=xl64686 width=84 style='border-left:none;width:63pt'>X_Axis</td>
  <td class=xl64686 width=89 style='border-left:none;width:67pt'>Y_Axis</td>
  <td class=xl64686 width=89 style='border-left:none;width:67pt'>Z_Axis</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.277330759</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.017383819</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.111148104</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.25546169</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.023953149</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.097302002</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>3</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.28918832</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.009918505</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.107566191</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>4</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.261237565</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.001308288</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.104544182</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>5</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.278917629</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.01613759</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.110601818</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>6</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.221598244</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.040513953</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.113203554</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.276426586</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.01859492</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.105500358</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.24716479</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.021412113</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.1525139</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>3</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.277615348</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.022661416</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.116812942</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>4</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.277087352</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.015687994</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.109218272</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>5</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.277911472</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.018420827</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.105908536</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Mean</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>6</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.281373404</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.01815874</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.10724561</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>10</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.17870973</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.022743165</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.395645072</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>10</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.16159192</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.005552877</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.073874493</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>10</td>
  <td class=xl63686 style='border-top:none;border-left:none'>3</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.295733548</td>
  <td class=xl63686 style='border-top:none;border-left:none'>0.004079154</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.183557562</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>10</td>
  <td class=xl63686 style='border-top:none;border-left:none'>4</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.98290183</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.91797953</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.967826982</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>10</td>
  <td class=xl63686 style='border-top:none;border-left:none'>5</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.97840348</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.919561843</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.94127144</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Time Body Acceleration Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>10</td>
  <td class=xl63686 style='border-top:none;border-left:none'>6</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.96828369</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.946454302</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.959471486</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>29</td>
  <td class=xl63686 style='border-top:none;border-left:none'>3</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.09863792</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.120381521</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.547320887</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>29</td>
  <td class=xl63686 style='border-top:none;border-left:none'>4</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.99422018</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.985493319</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.990445862</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>29</td>
  <td class=xl63686 style='border-top:none;border-left:none'>5</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.99412342</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.984782782</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.991316375</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>29</td>
  <td class=xl63686 style='border-top:none;border-left:none'>6</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.99254348</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.990468083</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.99310776</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>30</td>
  <td class=xl63686 style='border-top:none;border-left:none'>1</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.4151354</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.289466095</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.575410267</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>30</td>
  <td class=xl63686 style='border-top:none;border-left:none'>2</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.56156521</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.610826602</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.78475388</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>30</td>
  <td class=xl63686 style='border-top:none;border-left:none'>3</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.28980273</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.217432019</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.535515048</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>30</td>
  <td class=xl63686 style='border-top:none;border-left:none'>4</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.99001756</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.981902116</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.988971212</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 class=xl63686 style='height:15.0pt;border-top:none'>Average of
  Frequency Body Acceleration Jerk Standard Deviation</td>
  <td class=xl63686 style='border-top:none;border-left:none'>30</td>
  <td class=xl63686 style='border-top:none;border-left:none'>5</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.97221673</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.960442361</td>
  <td class=xl63686 style='border-top:none;border-left:none'>-0.973954338</td>
 </tr>
 <![if supportMisalignedColumns]>
 <tr height=0 style='display:none'>
  <td width=418 style='width:314pt'></td>
  <td width=118 style='width:89pt'></td>
  <td width=65 style='width:49pt'></td>
  <td width=84 style='width:63pt'></td>
  <td width=89 style='width:67pt'></td>
  <td width=89 style='width:67pt'></td>
 </tr>
 <![endif]>
</table>

</div>


<!----------------------------->
<!--END OF OUTPUT FROM EXCEL PUBLISH AS WEB PAGE WIZARD-->
<!----------------------------->
</body>

</html>




####The original data is provided by:
####License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
