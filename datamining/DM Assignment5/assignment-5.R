setwd("E:\\DataScience_2019501123\\datamining\\DM Assignment5")
data<-read.csv("sonar_test.csv", header=FALSE)
#2
x<-data[,1:2]
plot(x,pch=19,xlab=expression(x[1]), ylab=expression(x[2]))
fit<-kmeans(x, 2)
points(fit$centers,pch=19,col="blue",cex=2)
library(class)
knnfit<-knn(fit$centers,x,as.factor(c(-1,1)))
points(x,col=1+1*as.numeric(knnfit),pch=19)

#3
plot(x, pch = 19, xlab = expression(x[1]), ylab = expression(x[2]), col = "blue")
y <- data[,61]
points(x, col = 2+2*y, pch = 19)
errorrate <- 1 - sum(knnfit == y) / length(y)
errorrate

#4
x <- data[, 1:60]
fit <- kmeans(x,2)
library(class)
knnfit <- knn(fit$centers, x, as.factor(c(-1,1)))
1-sum(knnfit == y) / length(y)

#5
x <- c(1,2,2.5,3,3.5,4,4.5,5,7,8,8.5,9,9.5,10)
center1 <- 1
center2 <- 2
for (k in 2:10){
  cluster1 <- x[abs(x - center1[k-1]) <= abs(x - center2[k-1])]
  cluster2 <- x[abs(x - center1[k-1]) >  abs(x - center2[k-1])]
  center1[k] <- mean(cluster1)
  center2[k] <- mean(cluster2)
}
print(cluster1)
print(cluster2)

#7
km <- kmeans(x,2)
print(km)

#8(b)
x1 <- c(1,2)
x2 <- c(5,10)
res = ((x1[1] - x2[1]) ^ 2 +  ) ^ 0.5
print(res)

#9(b)
x1 <-c(1,2,3,6)
x2 <-c(5,10,4,12)
dist = ((x1[1] - x2[1]) ^ 2 + (x1[2] - x2[2]) ^ 2 + (x1[3] - x2[3]) ^ 2 + (x1[4] - x2[4]) ^ 2)^0.5
print(dist)

#11
exams <- read.csv("spring2008exams.csv")
str(exams)
mean1 <- mean(exams$Midterm.1, na.rm = TRUE)
sd1 <- sd(exams$Midterm.1,na.rm = TRUE)
z_score <- (exams$Midterm.1 - mean1) / sd1

sort(z_score)

#12
exams <- read.csv("spring2008exams.csv")
str(exams)
mean2 <- mean(exams$Midterm.2, na.rm = TRUE)
sd2 <- sd(exams$Midterm.2,na.rm = TRUE)
z_score2 <- (exams$Midterm.2 - mean2) / sd2

sort(z_score2)

#14
exams <- read.csv("spring2008exams.csv")
str(exams)
q1 <- quantile(exams$Midterm.2, .25, na.rm = TRUE)
q3 <- quantile(exams$Midterm.2, .75,na.rm = TRUE)
iqr <- q3 -q1
print(iqr)
exams[(exams$Midterm.2 > q3 + 1.5 * iqr), 3]
exams[(exams$Midterm.2 > q1 - 1.5 * iqr), 3]
boxplot(exams$Midterm.1,exams$Midterm.2, col = "lightblue", main = "Exam Scores", names = c("Exam1", "Exam2"),ylab = "Exam Score")

#15
exams <- read.csv("spring2008exams.csv")
model <- lm(exams$Midterm.2 ~ exams$Midterm.1)
plot(exams$Midterm.1, exams$Midterm.2, pch = 19, xlab = "Exam 1", ylab = "Exam2", xlim = c(10, 100), ylim = c(10,100),col = "green")
abline(model)
sort(model$residuals)
