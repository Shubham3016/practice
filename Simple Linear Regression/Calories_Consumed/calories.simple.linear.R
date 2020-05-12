#Calories Consumed

df <- read.csv("E:\\ASSignment\\Simple Linear Regression\\Calories_Consumed\\calories_consumed.csv")

colnames(df)<-c('weight','calories') 
df

head(df)
tail(df)

summary(df) 

cor.data<-cor(df) # correlation of two variables

plot(df)

model <- lm(weight~calories, data = df) # build a model 

summary(model)

#The R-Sqaured value for the above model is 0.8968 
# p-value is less than 0.05 
# means this model will predict the output 89.68% time correct. with Residual Standard Error as 111.6

pred<-predict(model)
pred


#Lets do some Data Trnsformation and build the model to get better R-Square Value

# Square root model

sqrt_model<-lm(sqrt(weight)~. ,data = df)

summary(sqrt_model)

# Here the R-Square value is 0.9139  Residual standard Error as 2.496

sqrt.pred<-predict(sqrt_model)
sqrt.pred

# Log Transformation

log_model<-lm(log(weight)~. ,data=df)
summary(log_model)

# Here the R-square value obtained is 0.8776 and the p-value is less than 0.05 
# Residual Standard Error as 0.3314

log.pred<-predict(log_model)
log.pred

#So Comapring all these models, we Conclude that the 
# log Transformation model has the  R-square value as 0.8776 
# and lowest Residual Standard error as 0.3314
# in square root transformation R squared value is 0.91 but the standard error is 2.496
# if we compare log and square root transformation log model has less standard error.
# So we Conclude that Log transformation model has better R-Square value with the lowest Residual Standard Error