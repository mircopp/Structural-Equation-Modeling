library(lavaan)
library(semPlot)


modelName <- "Simple Mean Structure"

x <- c(3, 8, 10, 15, 19)

y <- c(24, 20, 22, 32, 27)

linearReg <- lm(y~x)
summary(linearReg)


set.seed(42)

intercept <- 20
slope <- 0.451
T <- 10000

t0 <- rnorm(T, mean=(0*slope+intercept))
t1 <- rnorm(T, mean=(1*slope+intercept))
t2 <- rnorm(T, mean=(2*slope+intercept))
t3 <- rnorm(T, mean=(3*slope+intercept))
t4 <- rnorm(T, mean=(4*slope+intercept))

datLin <- data.frame(t0,t1,t2,t3,t4)

model <- ' i =~ 1*t0+ 1*t1 + 1*t2 + 1*t3 + 1*t4 
           s =~ 0*t0 + 1*t1 + 2*t2 + 3*t3 + 4*t4
		   '
fitLin <- growth(model, data=datLin)
summary(fitLin)
semPaths(fitLin,what="col",whatLabels="est")


