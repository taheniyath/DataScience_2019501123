getwd()
setwd("E:/DataScience_2019501123/Intro to ML/Data Mining/Final exam/Exam/2")

ar = read.csv("data_apriori.csv", header = TRUE);
ar$TID <- NULL
library(arules)
transactions = read.transactions("Items.csv", sep=',', rm.duplicates = TRUE)
rules <- apriori(transactions, parameter = list(sup = 0.03, conf = 0.5,target="rules"))

inspect(sort(rules, by = 'lift')[1:15])

itemFrequencyPlot(transactions, topN = 5)
