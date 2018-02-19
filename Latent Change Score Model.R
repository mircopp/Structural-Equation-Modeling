model <- '
Slope =~ 1*Diff4+ 1*Diff3 + 1*Diff2

Diff2=~ 1*Val2
Diff3=~ 1*Val3
Diff4=~ 1*Val4

Intercept =~ 1*Val1

Val1 =~ 1*t0 + 1*Val2 + a*Diff2
Val2 =~ 1*t1 + 1*Val3 + a*Diff3
Val3 =~ 1*t2 + 1*Val4 + a*Diff4
Val4 =~ 1*t3

Val1 ~ 0
Val2 ~ 0
Val3 ~ 0
Val4 ~ 0

Val1 ~~ 0*Val1
Val2 ~~ 0*Val2
Val3 ~~ 0*Val3
Val4 ~~ 0*Val4

Diff2~0
Diff3~0
Diff4~0

Diff2 ~~ 0*Diff2
Diff3 ~~ 0*Diff3
Diff4 ~~ 0*Diff4

t3~~NA*t3
'
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

fitLin <- growth(model, data=datLin)
summary(fitLin)
semPaths(fitLin,what="col",whatLabels="est", layout="tree2")