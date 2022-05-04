---
# 4. Analysis of the data
---
  
## Create Dataframes
  
# Create a dataframe named 'daily_activity'.
daily_activity <- read.csv("dailyActivity_merged.csv")
  
# Create a dataframe for sleep data
sleep_day <- read.csv("sleepDay_merged.csv")
  
  
## Exploring a few key tables
  
# Take a look at the daily_activity data.
head(daily_activity)
  
# Identify all the columsn in the daily_activity data
colnames(daily_activity)
  
# Take a look at the sleep_day data.
head(sleep_day)
  
# Identify all the columsn in the daily_activity data.
colnames(sleep_day)
  
# Looks like both data sets has the same 'Id' field - Merge
  
## Verify hypothesis
# How many unique participants are there in each dataframe?
  
n_distinct(daily_activity$Id)
n_distinct(sleep_day$Id)

#daily_activity: 33
#sleep_day: 24
  
# How many observations are there in each data frame?
  
nrow(daily_activity)
nrow(sleep_day)

#daily_activity: 33
#sleep_day: 24
  
## Summary statistics
  
# For the daily activity dataframe:
  
daily_activity %>%  
    select(TotalSteps,
           TotalDistance,
           SedentaryMinutes) %>%
summary()
# For the sleep dataframe:
  
sleep_day %>%  
    select(TotalSleepRecords,
           TotalMinutesAsleep,
           TotalTimeInBed) %>%
summary()
  
## Plotting a few explorations
  
# What's the relationship between steps taken in a day and sedentary minutes? 
  
ggplot(data=daily_activity, aes(x=TotalSteps, y=SedentaryMinutes)) + 
    geom_point() + labs(title = "Sedentarie Minutes vs Total Steps")
  
  
# What's the relationship between minutes asleep and time in bed? 
# You might expect it to be almost completely linear - are there any unexpected trends?
  
ggplot(data=sleep_day, aes(x = TotalMinutesAsleep, y = TotalTimeInBed)) + 
      geom_point() + geom_smooth(method = 'loess', formula = 'y ~ x') + 
      labs(title="Minutes Asleep vs Minutes in Bed", x = "Minutes Asleep", y = "Minutes in Bed")

## Merging these two datasets together
  
combined_data <- merge(sleep_day, daily_activity, by="Id")

# Take a look at how many participants are in this data set.
  
n_distinct(combined_data$Id)

#24
  
#What’s the relationship between calories and total steps?

ggplot(data=combined_data, aes(x = Calories, y = TotalSteps)) + 
  geom_point() + geom_smooth(method = 'loess', formula = 'y ~ x') + 
  labs(title="Calories vs Total Steps", x = "Calories", y = "Steps per day")

#Number of user per each Data Set
n_distinct(daily_activity$Id)
n_distinct(dailyCalories_merged$Id)
n_distinct(dailyIntensities_merged$Id)
n_distinct(dailySteps_merged$Id)
n_distinct(hourlyCalories_merged$Id)
n_distinct(hourlyIntensities_merged$Id)
n_distinct(hourlySteps_merged$Id)
n_distinct(hourlySteps_merged$Id)
n_distinct(sleep_day$Id)
n_distinct(weightLogInfo_merged$Id)

# dailyActivity: 33
# dailyCalories_merged: 33
# dailyIntensities_merged: 33
# dailySteps_merged: 33
# hourlyCalories_merged: 33
# hourlyIntensities_merged: 33
# hourlySteps_merged: 33
# hourlySteps_merged: 33
# sleep_day: 24
# weightLogInfo_merged: 8

## To consolidate the data, merge dailyActivity dataset and sleepDay together by Id and Date

full_data <- merge(daily_activity, sleepDay_merged, by.x = "Id", by.y = "date1", all = TRUE)
head(full_data)
glimpse(full_data)

# Take a look at how many participants are in this data set.

n_distinct(full_data$Id)

#64