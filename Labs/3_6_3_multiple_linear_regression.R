library(MASS)
library(ISLR)

# Exercise to predict medv (median house value) in Boston dataset using multiple linear regression

# Create linear model, using 2 predictos (lstat and age)
attach(Boston)
lm.fit <- lm(medv~lstat+age)
summary(lm.fit)

# Create lm using all predictors
lm.fit <- lm(medv~., data=Boston) # why doesn't attach work this time?
summary(lm.fit) # Summary of the linear model
summary.lm(lm.fit)$coefficients
summary.lm(lm.fit)$r.squared # Gives R2
summary.lm(lm.fit)$sigma # Gives RSE

library(car)
vif(lm.fit) # Compute VIF (variance inflation factors, a measure of collinearity)

# Recreate linear model without age (as it had a low p-value)
lm.fit1 <- lm(medv~.-age, data=Boston)
summary(lm.fit1)