# 3.2 Cleaning up and preparing the data for analysis
#Installing packages for cleaning data

install.packages("here")
install.packages("skimr")
install.packages("janitor")
library("here")
library("skimr")
library("janitor")

#Check Data
glimpse(dailyActivity_merged)
glimpse(dailyCalories_merged)
glimpse(dailyIntensities_merged)
glimpse(dailySteps_merged)
glimpse(heartrate_seconds_merged)
glimpse(hourlyCalories_merged)
glimpse(hourlyIntensities_merged)
glimpse(hourlySteps_merged)
glimpse(minuteCaloriesNarrow_merged)
glimpse(minuteCaloriesWide_merged)
glimpse(minuteIntensitiesNarrow_merged)
glimpse(minuteIntensitiesWide_merged)
glimpse(minuteMETsNarrow_merged)
glimpse(minuteSleep_merged)
glimpse(minuteStepsNarrow_merged)
glimpse(minuteStepsWide_merged)
glimpse(sleepDay_merged)
glimpse(weightLogInfo_merged)

#Clean Data
#Remove repeat columns
select(dailyActivity_merged, -TrackerDistance)
dailyActivity_merged$TrackerDistance <- NULL

#Remove columns without data

weight <- select(weight, - Fat)
select(weightLogInfo_merged, -Fat)
weightLogInfo_merged$Fat <- NULL










