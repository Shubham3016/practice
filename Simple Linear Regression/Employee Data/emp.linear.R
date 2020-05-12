
# import data
emp<-read.csv("E:\\ASSignment\\Simple Linear Regression\\Employee Data\\emp_data.csv")

head(emp)
tail(emp)

plot(emp)

summary(emp) # summary of data 

cor(emp) # corelation between two variables

# Lets build a model

model<-lm(Churn_out_rate~., data = emp) # build a model 
model

summary(model)

#Here the P-value is less than 0.05 and the R-Squared value is 0.8312 with Residual Standard Error as 4.469

pred<-predict(model)
pred

# Data Transformation and build models

# Squareroot Transformation

sqrt.model<-lm(sqrt(Churn_out_rate)~. ,data = emp)
sqrt.model

summary(sqrt.model)

sqrt.pred<-predict(sqrt.model)
sqrt.pred

# Here the R-Square value is 0.853 with Residual Standard Error as 0.2411


# Log Transformation

log.model<-lm(log(emp$Churn_out_rate)~. ,data=emp)
log.model

summary(log.model)

log.pred<-predict(log.model)
log.pred

#Here we get R-Square value as 0.8735 and Residual Standard Error as 0.0519

# we Conclude that Log model is the best model with 
# Highest R-Square value and lowest Residual Standard Error


