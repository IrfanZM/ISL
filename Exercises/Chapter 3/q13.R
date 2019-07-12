set.seed(1)
x <- rnorm(100)
eps <- rnorm(n=100,sd=0.25)

y = -1 + (0.5*x) + eps
# from the above eqn it follows that B_0 = -1 and B_1 = 0.5
# this is confirmed through the plot below
plot(x,y)

# now we create a linear model
lm.fit <- lm(y~x)
summary(lm.fit)
# We note that the calculated coefficients, B_0 = -1.009
# and B_1 = 0.4997 are very close to the coefficient values above
# very low p-values
#
# add in least squares fit and population regression line on plot
abline(lm.fit, col='red')
abline(-1, 0.5, col = 'blue')
legend("topleft", c("Least square", "Regression"), col = c("red", "blue"), lty = c(1, 1))

# try a polynomial regression
lm.fit.poly <- lm(y~poly(x,2))
summary(lm.fit.poly)