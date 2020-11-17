# Loading Library
library(knitr)
library(dplyr)
library(ggplot2)
library(Hmisc) #Used to impute


##1) Loading and preprocessing of the dataset

#Loading the Data

Data <- read.csv("activity.csv")


##What is mean total number of steps taken per day?

#1) Calculate the total number of steps taken per day

  
Total_Steps <- aggregate(steps ~date, Data, sum)
sum(Total_Steps$steps)


#2) Make a histogram of the total number of steps taken each day 

hist(Total_Steps$steps, 
    main =  "Total number of steps taken per day",
    col = "Blue",
    xlab = "number of steps",
    ylab = "Frequency")

#3) Calculate and report the mean and median of the total number of steps taken per day

Steps_mean <- mean(Total_Steps$steps, na.rm = T)
Steps_mean

Steps_median <- median(Total_Steps$steps, na.rm = T)
Steps_median

## What is the average daily activity pattern?
  
# Make a time series plot of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all days (y-axis)

FiveMin_int <-  aggregate(steps~interval, Data, mean, na.rm = T)

plot(FiveMin_int$interval,
     FiveMin_int$steps,
     type = "l",
     xlab = "5 min Time interval",
     ylab = "Average steps taken",
     main = "Time series plot of Average steps taken in every 5 min Interval ")


# Which 5-minute interval, on average across all the days in the dataset, contains the maximum number of steps?

Max_Step <- FiveMin_int$interval[which.max(FiveMin_int$steps)]
Max_Step

## Imputing missing values

#1) Calculate and report the total number of missing values in the dataset (i.e. the total number of rows NAs)

Num_Missing_Values <- length(which(is.na(Data$steps)))
Num_Missing_Values

#2) Devise a strategy for filling in all of the missing values in the dataset. The strategy does not need to be sophisticated. For example, you could use the mean/median for that day, or the mean for that 5-minute interval, etc
#3) Create a new dataset that is equal to the original dataset but with the missing data filled in.

DataImputed <- Data
DataImputed$steps <- impute(Data$steps, mean) 
DataImputed

#4) Make a histogram of the total number of steps taken each day and Calculate and report the mean and median total number of steps taken per day. Do these values differ from the estimates from the first part of the assignment? What is the impact of imputing missing data on the estimates of the total daily number of steps?

Total_Steps_2 <- aggregate(steps~date, DataImputed, sum)

hist(Total_Steps_2$steps,
     xlab = "Total Number of Steps",
     main = "Frequency distribution of total number of steps (Imputed)",
     col = "red")

# Mean of the Imputed Data

Mean_DataImputed <-  mean(Total_Steps_2$steps)
Mean_DataImputed

Median_DataIputed <- median(Total_Steps_2$steps)
Median_DataIputed

## Are there differences in activity patterns between weekdays and weekends?

#1) Create a new factor variable in the dataset with two levels - "weekday" and "weekend" indicating whether a given date is a weekday or weekend day.

DataImputed$date <-  as.Date(DataImputed$date)
DataImputed$Days <-  weekdays(DataImputed$date)

DataImputed$Week_Type <- ifelse(DataImputed$Days == "Saturday" | DataImputed$Days == "Sunday", "Weekend", "Weekday")

Total_Steps_3 <- aggregate(steps~interval+Week_Type, DataImputed, mean)

#2) Make a panel plot containing a time series plot of the 5-minute interval (x-axis) and the average number of steps taken, averaged across all weekday days or weekend days (y-axis). See the README file in the GitHub repository to see an example of what this plot should look like using simulated data.

ggplot(Total_Steps_3, aes(x = interval, y = steps))+
      geom_line()+
      facet_grid(Week_Type~.)+
      xlab(" Five Min Interval")+
      ylab("Average Number of Steps")+
      ggtitle("Graphical Comparsion of Average Number of Steps per time interval ")
      

