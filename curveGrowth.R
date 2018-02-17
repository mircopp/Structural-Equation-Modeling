lower <- '
1
.77 1 
.59 .81 1
.50 .72 .89 1
.48 .69 .84 .91 1
.46 .68 .80 .88 .93 1
'
means <- c(11.77, 21.39, 27.50, 31.02, 32.58, 34.20)

sigma <- getCov(lower,names=c("t1","t2","t3","t4","t5","t6"))

model <- ' i =~ 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5 + 1*t6
           s =~ 0*t1 + 1*t2 + t3 + t4 + t5 + t6'
fit <- growth(model, sample.cov = sigma, sample.nobs = 250, sample.mean = means)
summary(fit)
semPaths(fit,what="col",whatLabels="est")