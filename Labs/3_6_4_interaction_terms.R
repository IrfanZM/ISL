# Exercise to incorporate interaction terms into linear models

library(MASS)
library(ISLR)

lm.fit <- lm(medv~lstat*age, data = Boston)
# note that lstat*age = lstat + age + lstat:age, where lstat:age is the interaction effect
summary(lm.fit)