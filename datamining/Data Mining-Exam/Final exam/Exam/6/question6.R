#6.	Create k-means clusters for k=4 for the Liver Disorders Data Set at http://archive.ics.uci.edu/ml/datasets/Liver+Disorders . Explain the input parameters you provided for the clustering algorithm. Plot the fitted cluster centers using a different color.  Finally assign the cluster membership for the points to the nearest cluster center.  Color the points according to their cluster membership.	(10+10=20M)


setwd("E:/DataScience_2019501123/datamining/Data Mining-Exam/Final exam/Exam/6")
liver_data<-read.csv("Liver_data.csv", header = FALSE, col.names = c("mcv", "alkphos", "sgpt", "sgot", "gammagt", "drinks","selector"))

library(corrplot)
result = cor(liver_data)
corrplot(result)

#From the correlation plot it is clear that MCV and gammagt are more dependent on the y variable drinks
#So, for K means these are used as input parameters.

x = liver_data[, c("mcv", "gammagt")]
y = liver_data[, "drinks"]


plot(x,pch = 19,xlab = expression(x[1]),ylab = expression(x[2]), xlim=c(80,100), ylim=c(0,200))

plot(x$mcv,y,xlim=c(60,100),ylim=c(0,20),pch=18,col="blue",xlab="mcv",ylab="drinks",main="dependency of mcv on drinks")

plot(x$gammagt,y,xlim=c(0,100),ylim=c(0,20),pch=19,col="blue",xlab="mcv",ylab="drinks",main="dependency of gammagt on drinks")


fit = kmeans(x, 4)
plot(x, col=fit$cluster, xlim=c(80,100), ylim=c(0,200))
points(fit$center, col='red', pch=19, cex=2)


