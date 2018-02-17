library(lavaan)
set.seed(42)

slope <- 4
intercept <- 10
T <- 10000
t0 <- rnorm(T, mean=(0*slope+intercept))
t1 <- rnorm(T, mean=(1*slope+intercept))
t2 <- rnorm(T, mean=(2*slope+intercept))
t3 <- rnorm(T, mean=(3*slope+intercept))
t4 <- rnorm(T, mean=(4*slope+intercept))
t5 <- rnorm(T, mean=(5*slope+intercept))

dat <- data.frame(t0,t1,t2,t3,t4,t5)

model <- ' i =~ 1*t0 + 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5
           s =~ 0*t0 + 1*t1 + t2 + t3 + t4 + t5 '
fit <- growth(model, data=dat)
summary(fit)
semPaths(fit,what="col",whatLabels="est")
