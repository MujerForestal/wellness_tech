######### Bellabet Case Study using R ##########

# Final project: Google Data Analysis Certificate
# Case Study 2: How Can a Wellness Technology Company Play It Smart?
# Abril, 2022

# 3. Cleaning and Manipulation of Data
# 3.1 Environment Setup
# Installing the required packages
library(tidyverse)
library(lubridate)
library(dplyr)
library(ggplot2)
library(tidyr)

#Importing Data
dailyActivity_merged <- read_csv("data/raw/dailyActivity_merged.csv")
dailyCalories_merged <- read_csv("data/raw/dailyCalories_merged.csv")
dailyIntensities_merged <- read_csv("data/raw/dailyIntensities_merged.csv")
dailySteps_merged <- read_csv("data/raw/dailySteps_merged.csv")
heartrate_seconds_merged <- read_csv("data/raw/heartrate_seconds_merged.csv")
hourlyCalories_merged <- read_csv("data/raw/hourlyCalories_merged.csv")
hourlyIntensities_merged <- read_csv("data/raw/hourlyIntensities_merged.csv")
hourlySteps_merged <- read_csv("data/raw/hourlySteps_merged.csv")
minuteCaloriesWide_merged <- read_csv("data/raw/minuteCaloriesWide_merged.csv")
minuteCaloriesNarrow_merged <- read_csv("data/raw/minuteCaloriesNarrow_merged.csv")
minuteIntensitiesNarrow_merged <- read_csv("data/raw/minuteIntensitiesNarrow_merged.csv")
minuteIntensitiesWide_merged <- read_csv("data/raw/minuteIntensitiesWide_merged.csv")
minuteMETsNarrow_merged <- read_csv("data/raw/minuteMETsNarrow_merged.csv")
minuteSleep_merged <- read_csv("data/raw/minuteSleep_merged.csv")
minuteStepsNarrow_merged <- read_csv("data/raw/minuteStepsNarrow_merged.csv")
minuteStepsWide_merged <- read_csv("data/raw/minuteStepsWide_merged.csv")
sleepDay_merged <- read_csv("data/raw/sleepDay_merged.csv")
weightLogInfo_merged <- read_csv("data/raw/weightLogInfo_merged.csv")