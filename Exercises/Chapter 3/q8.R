library(ISLR)
library(MASS)

lm.fit1 <- lm(mpg ~ horsepower, data=Auto)
summary(lm.fit)

###########################
# i. Is there a relationship between the predictor and the response?
# Ans. Yes, as given by the p-value for the horespower coefficient
#
# ii. How strong is this relationship?
# Quite strong - 60% of the model variance can be explained by this relationship (R2 = 0.6059)
#
# iii. Is the relationship positive or negative?
# Ans. Negative - as horsepower increases, mpg decreases
#
# iv. What is the predicted mpg associated with a horsepower of 98? What are the associated
# 95% confidence and prediction intervals?
predict(lm.fit1, data.frame(horsepower=c(98)),interval = "confidence")
predict(lm.fit1, data.frame(horsepower=c(98)),interval = "prediction")
# Predicted mpg is 24.47, 95% confidence interval is 23.97-24.96
# 95% prediction interval is 14.81-34.12
# b)
# Sense check values
attach(Auto)
plot(horsepower,mpg)
abline(lm.fit1)
# Looks sensible
# c) Plot diagnostics plot, and comment on any problems you see with the fit
par(mfrow=c(2,2))
plot(lm.fit1)
# Residuals vs fitted curve show a clear relationship, indicating the fit isn't linear.