#8.	Consider the dataset BSE_Sensex_Index.csv. Create an extra column of successive growth rate for column close where the successive growth rate is defined as (value of day x- value of day x-1)/value of day x-1. Use a z score cut off of 3 to identify any outliers.  List the respective dates from the csv file on which day these outliers fall.	(10M)


setwd("E:/DataScience_2019501123/datamining/Data Mining-Exam/Final exam/Exam/8")
data<-read.csv("BSE_Sensex_Index.csv", header = TRUE)


#create successive growth rate column
library(dplyr)
new_data = mutate(data, succ_grate = lead((lag(Close) - Close) / Close))
#((Close - lag(Close))/lag(Close))


#last row in successive growth rate column
lastcol = nrow(new_data)
a = new_data$succ_grate[lastcol-1]
b = new_data$succ_grate[lastcol-2]
c = new_data$succ_grate[lastcol-3]
new_data$succ_grate[lastcol] = mean(a,b,c)


#calculating z-scores
succ_grate_mean <- mean(new_data$succ_grate, na.rm=TRUE)
ssucc_grate_std <- sd(new_data$succ_grate,na.rm=TRUE)
z<-(new_data[,8] - succ_grate_mean) / ssucc_grate_std
sort(z)
new_data$zscores <- z

#Dates of the outliers 
dates<-subset(new_data[,1],  new_data[,"zscores"] >= 3.0 | new_data[,"zscores"] <= -3.0)

dates

View(dates)


