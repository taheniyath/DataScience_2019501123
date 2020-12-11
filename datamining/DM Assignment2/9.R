setwd("E:\\DataScience_2019501123\\datamining\\DM Assignment2")
oh_data <-read.csv("OH_house_prices.csv")

#a
median(oh_data[,1])
mean(oh_data[,1])

#c
median(oh_data[,1]+10)

#d
median(oh_data[,1]+2)
