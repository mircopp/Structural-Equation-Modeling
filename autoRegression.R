library(lavaan)
library(semPlot)

set.seed(42)

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

model <- ' 	i =~ 1*yt0 + 1*yt1 + 1*yt2 + 1*yt3 + 1*yt4 + 1*yt5
			s =~ 0*yt0 + 1*yt1 + yt2 + yt3 + yt4 + yt5
			yt0 =~ 1*t0 + yt1
			yt1 =~ 1*t1 + yt2
			yt2 =~ 1*t2 + yt3
			yt3 =~ 1*t3 + yt4
			yt4 =~ 1*t4 + yt5
			yt5 =~ 1*t5
			yt0 ~ 0
			yt1 ~ 0
			yt2 ~ 0
			yt3 ~ 0
			yt4 ~ 0
			yt5 ~ 0
			
			yt0 ~~ 0*yt0
			yt1 ~~ 0*yt1
			yt2 ~~ 0*yt2
			yt3 ~~ 0*yt3
			yt4 ~~ 0*yt4
			yt5 ~~ 0*yt5
		'

fitCurved <- growth(model, sample.cov = covCurve, sample.nobs = 137, sample.mean = meansCurve)
summary(fitCurved,fit.measures = TRUE)
semPaths(fitCurved,what="col",whatLabels="est")