set.seed(1)
x1 = runif(100)
x2 = 0.5*x1 + rnorm(100)/10
y = 2 + 2*x1 + 0.3*x2 + rnorm(100)

# find regression coefficients
lm.fit <- lm(y~x1+x2)
summary(lm.fit)
# note they're very different to the coefficients above!

cor(x1,x2)
plot(x1,x2)
# quite correlated, correlation coefficient of 0.835
# plot confirms this correlation

# We can reject the null hypothesis for both B0 and B1 != 0
# But only at 95% confidence (p value = 0.0487 < 0.05, but just)
# We cannot reject null hypothesis for B2 = 0

# Now fit on only x1
lm.fit2 <- lm(y~x1)
summary(lm.fit2)

# This linear model suggests a much better fit between x1 and y
# However we know that this is inacurate because x1 and x2 are correlated