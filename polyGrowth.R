library(lavaan)
set.seed(42)

slope <- 4
intercept <- 10
slope2 <- 18

T <- 10000
t0 <- rnorm(T, mean=(0*slope+0*slope2+intercept))
t1 <- rnorm(T, mean=(1*slope+1*slope2+intercept))
t2 <- rnorm(T, mean=(2*slope+4*slope2+intercept))
t3 <- rnorm(T, mean=(3*slope+9*slope2+intercept))
t4 <- rnorm(T, mean=(4*slope+16*slope2+intercept))
t5 <- rnorm(T, mean=(5*slope+25*slope2+intercept))

dat <- data.frame(t0,t1,t2,t3,t4,t5)

model <- ' i =~ 1*t0 + 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5
s =~ 0*t0 + 1*t1 + 2*t2 + 3*t3 + 4*t4 + 5*t5
s2 =~ 0*t0 + 1*t1 + 4*t2 + t3 + t4 + t5'
fit <- growth(model, data=dat)
summary(fit)
semPaths(fit,what="col",whatLabels="est")
