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

datLin <- data.frame(t0,t1,t2,t3,t4,t5)

set.seed(42)

slope <- 0
intercept <- 10
slope2 <- 5

T <- 10000
t0 <- rnorm(T, mean=(0*slope+0*slope2+intercept))
t1 <- rnorm(T, mean=(1*slope+1*slope2+intercept))
t2 <- rnorm(T, mean=(2*slope+4*slope2+intercept))
t3 <- rnorm(T, mean=(3*slope+9*slope2+intercept))
t4 <- rnorm(T, mean=(4*slope+16*slope2+intercept))
t5 <- rnorm(T, mean=(5*slope+25*slope2+intercept))

datPoly <- data.frame(t0,t1,t2,t3,t4,t5)

lower <- '
1
.77 1 
.59 .81 1
.50 .72 .89 1
.48 .69 .84 .91 1
.46 .68 .80 .88 .93 1
'
meansCurve <- c(11.77, 21.39, 27.50, 31.02, 32.58, 34.20)

covCurve <- getCov(lower,names=c("t0","t1","t2","t3","t4","t5"))
