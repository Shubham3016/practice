

salary <- read.csv("E:\\ASSignment\\Simple Linear Regression\\Salary Data\\salary_data.csv")

head(salary)
tail(salary)

plot(salary)

summary(salary)

cor(salary)        # gives a correlation matrix

# Lets build a model

model <- lm(salary$Salary~., data = salary)

pred<-predict(model)
pred

summary(model)

# Residual standard error: 5788 and R-squared vlaue is :0.957,

# Lets do Data Tranformation and build Different Models

# Squareroot Transformaton

sqrt.model<-lm(sqrt(Salary)~. , data=salary )
sqrt.model

summary(sqrt.model)

# Residual standard error: 11.32 R-squared value is:0.94,	

sqrt.pred<-predict(sqrt.model)

sqrt.pred

# Log Transformation

log.model<-lm(log(Salary)~.,data=salary)
log.model

summary(log.model)

log.pred<-predict(log.model)
log.pred



# Here we got the R-Square value as 0.932 with Residual Standard Error as 0.09789

# So we Can say that Log transformation model has better R-Square value
# with the lowest Residual Standard Error

#So we Conclude that Log transformation model has better R-Square value with the lowest Residual Standard Error