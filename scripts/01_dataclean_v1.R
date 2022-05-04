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

#Change Data Time Formats

# Daily Activity Data Frame
daily_activity$ActivityDate <- as.Date(daily_activity$ActivityDate, format = "%m/%d/%Y")
daily_activity$date1 <- format(daily_activity$ActivityDate, format = "%m/%d/%Y")

# Hourly Intensities Data Frame
# Change time 24 hrs format

hourlyIntensities_merged$ActivityHour <- as.POSIXct(hourlyIntensities_merged$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz="UTC")
hourlyIntensities_merged$time1 <- format(hourlyIntensities_merged$ActivityHour, format = "%H:%M:%S") 
hourlyIntensities_merged$date1 <- format(hourlyIntensities_merged$ActivityHour, format = "%m/%d/%Y")

# Hourly Calories Data Frame
# Change time 24 hrs
hourlyCalories_merged$ActivityHour <- as.POSIXct(hourlyCalories_merged$ActivityHour, format="%m/%d/%Y %I:%M:%S %p", tz="UTC")
hourlyCalories_merged$time1 <- format(hourlyCalories_merged$ActivityHour, format = "%H:%M:%S")
hourlyCalories_merged$date1 <- format(hourlyCalories_merged$ActivityHour, format = "%m/%d/%Y")

# Heart Rate Seconds Data Set
heartrate_seconds_merged$Time <- as.POSIXct(heartrate_seconds_merged$Time, format = "%m/%d/%Y %I:%M:%S %p", tz = Sys.timezone())
heartrate_seconds_merged$time1 <- format(heartrate_seconds_merged$Time, format = "%I:%M:%S")
heartrate_seconds_merged$date1 <- format(heartrate_seconds_merged$Time, format = "%m/%d/%Y")

# WeightLogInfo Data Set
weightLogInfo_merged$Date <- as.POSIXct(weightLogInfo_merged$Date, format = "%m/%d/%Y %I:%M:%S %p", tz = Sys.timezone())
weightLogInfo_merged$time1 <- format(weightLogInfo_merged$Date, format = "%I:%M:%S")
weightLogInfo_merged$date1 <- format(weightLogInfo_merged$Date, format = "%m/%d/%Y")

# Sleep Day Data Set
sleepDay_merged$SleepDay <- as.POSIXct(sleepDay_merged$SleepDay, format = "%m/%d/%Y %I:%M:%S %p", tz = Sys.timezone())
sleepDay_merged$sleep_time <- format(sleepDay_merged$SleepDay, format = "%I:%M:%S")
sleepDay_merged$date1 <- format(sleepDay_merged$SleepDay, format = "%m/%d/%Y")

