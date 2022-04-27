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
  
# How many observations are there in each dataframe?
  
nrow(daily_activity)
nrow(sleep_day)
  
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
    geom_point()
  
  
# What's the relationship between minutes asleep and time in bed? 
# You might expect it to be almost completely linear - are there any unexpected trends?
  
ggplot(data=sleep_day, aes(x=TotalMinutesAsleep, y=TotalTimeInBed)) + 
    geom_point()
  
  
# What could these trends tell you about how to help market this product? 
# Or areas where you might want to explore further?
  
## Merging these two datasets together
  
combined_data <- merge(sleep_day, daily_activity, by="Id")
  
# Take a look at how many participants are in this data set.
  
n_distinct(combined_data$Id)

#Explore the relation between steps per day and burning calories

#Explore the relation between steps per day and sleep 
