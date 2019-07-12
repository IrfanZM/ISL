set.seed(1)
x=rnorm(100)
y=2*x + rnorm(100)

par(mfrow=c(1,1))
plot(x,y)

# a) perform regression of y onto x without intercept

lm.fit <- lm(y~x+0)
summary(lm.fit)
# vs
summary(lm(x~y+0))

# b) and c) note that the coefficients obtained are the same
# as you would expect