library(MASS)
library(ISLR)

# First exercise: use Boston dataset to predict medv (median house value) using single lstat predictor

attach(Boston)

# Create plot to get rough idea of relationship
plot(lstat, medv)

# Create linear model
lm.fit <- lm(medv ~ lstat)
names(lm.fit) # see what else is stored under lm.fit
coef(lm.fit) # obtain coefficients
confint(lm.fit) # obtain confidence intervals for model
predict(lm.fit, data.frame(lstat=c(5,10,15)), # obtain confidence intervals for model 
        interval="confidence")                # for lstat = 5,10,15
predict(lm.fit, data.frame(lstat=c(5,10,15)), # obtain confidence intervals for model 
        interval="prediction")                # for lstat = 5,10,15

plot(lstat,medv)
abline(lm.fit, col="red") # plot and add regression line

# Create diagnostic plots
par(mfrow=c(2,2)) # allow 2x2 grid of plots (how to do this in ggplot)
plot(lm.fit)

par(mfrow=c(1,1))

# Or plot residuals manually
plot(predict(lm.fit), residuals(lm.fit))
plot(predict(lm.fit), rstudent(lm.fit))

# Plot leverage statistics
plot(hatvalues(lm.fit))
which.max(hatvalues(lm.fit))

