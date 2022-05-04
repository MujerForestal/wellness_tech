---
  # 5. Data Visualizations
---

#Number of Users tracking their Statistics
#Identify the number of users per each important variable.
#Use tibble to keep important features of the original data frame and remove outdated features
  
stats_user <- tibble(
    var_stat = factor(c("Activity", "Sleep", "Heartrate", "Weight/BMI")),
    user_count = c(n_distinct(daily_activity$Id),
                   n_distinct(sleepDay_merged$Id),
                   n_distinct(heartrate_seconds_merged$Id),
                   n_distinct(weightLogInfo_merged$Id))
)

#Graph Number of User Tracking their Statistics
ggplot(stats_user, aes(var_stat, user_count)) +
    geom_col(aes(fill = var_stat)) +
    geom_text(aes(label = user_count), fontface = "bold",
              nudge_y = 1.25, size = 4) +
    theme_light() +
    theme(legend.position = "none",
          plot.title.position = "plot", plot.title = element_text(size = 12, face = "bold"), 
          axis.text = element_text(size = 12), axis.title = element_text(size = 12)) +
    ggtitle("Number of Users tracking their Statistics") +
    xlab(NULL)

ggsave("stats_user.png")

#Intensities over time per hour.
#Group hourly_intensities by time
intensities <- hourlyIntensities_merged %>%
  group_by(time1) %>% 
  drop_na() %>%
  summarise(mean_total_int = mean(TotalIntensity))

#Graph Average Total Intensity vs. Time
ggplot(intensities, aes(x = time1, y = mean_total_int)) + 
  geom_histogram(stat = "identity", fill = 'cyan3') +
  theme(axis.text.x = element_text(angle = 90),
        axis.text = element_text(size = 12), axis.title = element_text(size = 12), 
        plot.title = element_text(size = 12, face = "bold")) + 
  labs(title = "Average Total Intensity vs. Time")

ggsave("intensity_vrs_time.png")

#Average calories over time per hour
#Group hourly calories by time
AverageCaloriesHour <- hourlyCalories_merged %>%
  group_by(time1) %>% 
  drop_na() %>%
  summarise(calories_per_hour = mean(Calories))

#Graph Calories vs. Time
ggplot(AverageCaloriesHour, aes(x = time1, y = calories_per_hour)) + 
  geom_histogram(stat = "identity", fill = 'cyan3') +
  theme(axis.text.x = element_text(angle = 90),
        axis.text = element_text(size = 12), axis.title = element_text(size = 12), 
        plot.title = element_text(size = 12, face = "bold")) + 
  labs(title = "Average Total Calories vs. Time")

ggsave("calories_vs_time.png")

#Check Day of Week versus average total steps
#Create a column per day of week and rename date1 as date.

daily_activity_prep <- daily_activity %>%
  mutate(ActivityDate = ymd(ActivityDate), day_of_week = weekdays(ActivityDate)) %>% 
  clean_names() %>% 
  rename(date = date1)

#Average steps per day of week
#Group average steps by day of week
steps_day <- daily_activity_prep %>% 
  group_by(day_of_week) %>% 
  summarize(mean_day_week_step = mean(total_steps))
steps_day <- steps_day[c(2,6,7,5,1,3,4),]
steps_day$day_of_week  <- factor(steps_day$day_of_week, levels = steps_day$day_of_week)

#Graph Day of the Week vs. Average Number of Steps
ggplot(data = steps_day) +
      geom_col(mapping = aes(x = day_of_week,y = mean_day_week_step, fill = day_of_week)) + 
      labs(title="Day of the Week vs. Average Number of Steps", x = "Day of the Week", y = "Mean Steps") + 
      theme_light() +
      theme(legend.position = "none",
      plot.title.position = "plot", plot.title = element_text(size = 12, face = "bold"),
      axis.text = element_text(size = 10), axis.title = element_text(size = 12))

ggsave("average_stepsperday.png")

save.image (file = "bellabeat.RData")
