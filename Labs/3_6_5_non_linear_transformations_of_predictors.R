library(MASS)
library(ISLR)

# Incorporate non linear transformation
lm.fit2 <- lm(medv~lstat+I(lstat^2), data=Boston) # note that I wrapper function is necessary to make ^2 work
summary(lm.fit2)
# Note that vastly improved p-values for all predictors

# use anova function to compare against original lm
lm.fit <- lm(medv~lstat, data=Boston)
anova(lm.fit,lm.fit2)

# The anova function compares a hypothesis test comparing the two models
# H0 that the two models fit data equally well
# Ha that the second model is superior
###############################
#Analysis of Variance Table
#
#Model 1: medv ~ lstat
#Model 2: medv ~ lstat + I(lstat^2)
#Res.Df   RSS Df Sum of Sq     F    Pr(>F)    
#1    504 19472                                 
#2    503 15347  1    4125.1 135.2 < 2.2e-16 ***
#  ---
#  Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
###############################
# Note that the F-statistic is 135 and p-value is near-zero, strong evidence
# that second model is superior

# Confirm this by looking at diagnostic plots of lm.fit2
# Residuals have no discernible pattern
par(mfrow=c(2,2))
plot(lm.fit2)

# Introduce the poly() function, which created orthogonal polynomials (need to read up)
# which can be incorporated into the model

lm.fit5 <- lm(medv~poly(lstat,5), data=Boston)
summary(lm.fit5)

# Suggests that including additional polynomial terms up to the 5th order improves model fit
# But bear in mind this is training data, and this may result in overfitting on test data

# Here we try a log transformation
lm.fit.log <- lm(medv~log(rm), data=Boston)
summary(lm.fit.log)

par(mfrow=c(1,1))
attach(Boston)
plot(medv,log(rm))





