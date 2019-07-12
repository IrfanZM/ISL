library(ISLR)

# a) Fit multiple regression model to predict Sales, using Price, Urban and US

attach(Carseats)
lm.fit <- lm(Sales~Price+Urban+US, data=Carseats)
summary(lm.fit)
# b)
# Urban and US are qualitative variables and have been recoded.
# Car seats are not correlated with Urban
# They are correlated with whether store is in US or not.
# If in US, increase in Sales
# Negative relationship between price and sales

# c) Writing out the model in equation form as follows
# Price = 13.04 - 0.054(Price) - 0.0219(Urban) + 1.2(US)

# d)
# I can reject the null hypothesis of Beta_j = 0 for Sales and US variables
# However when performing regression with full set of vars
# US is a proxy for other vars, and is actually not significant
# e)
lm.fit2 <- lm(Sales~CompPrice + Income + Advertising + Price + ShelveLoc + Age,
              data = Carseats)
summary(lm.fit2)
# f) This model fits the data far better than a)
# g) Obtin 95% confidence intervals

summary(lm.fit2)$coefficients
confint(lm.fit2, level = 0.95)
plot(lm.fit2)