library(MASS)
library(ISLR)

# a) produce scatterplot of all variables in dataset
pairs(Auto)

# b) compute matrix of correlations, excluding name, which is a qualitative variable
cor(Auto[,names(Auto)!="name"])

# c) Use the lm() function to perform mutliple linear regression with mpg as the response
# and all othr variables except name as the predictors.
lm.fit.mpg <- lm(mpg~. -name, data=Auto)
summary(lm.fit.mpg)
# There are relationships between the predictors and the reponses
# although not all the predictor reponses are statisticaly significant
# The newer the year, the better the mpg.
# f statistic 252.4, R2 = 0.8215
# Lets' try another linear model with fewer variables

lm.fit.mpg2 <-lm(mpg~.-name -cylinders -horsepower -acceleration, data=Auto)
summary(lm.fit.mpg2)

# d) Perform diagnostic plots on linear regression fit
par(mfrow=c(2,2))
plot(lm.fit.mpg2)
# fitted vs residuals indicate that there's a better fit than linear
# V high leverage point, 14th datapoint

# e) plot again but investigate interaction effects
# try 
lm.fit.mpg3 <- lm(mpg~. +I(horsepower^2) +I(weight^2) +year:origin -name, data=Auto)
summary(lm.fit.mpg3)
par(mfrow=c(2,2))
plot(lm.fit.mpg3)