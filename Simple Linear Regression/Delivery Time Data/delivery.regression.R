delivery<-read.csv("E:\\ASSignment\\Simple Linear Regression\\Delivery Time Data\\delivery_time.csv")

head(delivery)
tail(delivery)

summary(delivery)
str(delivery)

plot(delivery)
cor(delivery)

# Building a model

model<-lm(Delivery.Time~.,data=delivery)

plot(model)

summary(model)

#Here we can see that the R-Squared value is 0.6823 
# P-value is less than 0.05 and Residual Standard Error as 2.935

# we have to increase the R-Square value by data Transformation
# Lets increase the R-Square value by data Transformation

# Squareroot Transformation

sqrt.model<-lm(sqrt(Delivery.Time)~.,data = delivery)
sqrt.model
summary(sqrt.model)

# Residual standard error: 0.3494  Multiple R-squared value: 0.704,

# Log Transformation

log.model<-lm(log(Delivery.Time)~.,data=delivery)
log.model
summary(log.model)

# Here we get R-Squared value as 0.7109 and Residual Standard Error as 0.1755 

# Inorder to find the points that affect the model, use library mvinfluence

#install.packages("mvinfluence")

library(mvinfluence)

influenceIndexPlot(model)

# Using the plots we can see that the points (5,9,21)are causing problems
# Remove these points and build the model

del1 <- delivery[-c(5,9,21),]

model1 <- lm(Delivery.Time~., data = del1)

summary(model1)


# Now we got the R-Squared value as 0.8332 
# means this will give the output 83.32% time correct with Residual Standard Error as 1.839

# The best Model we got is model1 with R-Square value 
# as 0.8332 with Residual Standard Error as 1.839

