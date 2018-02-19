modelName <- "Non-Linear Growth Model"

model <- ' i =~ 1*t0+ 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5 
           s =~ 0*t0 + 1*t1 + t2 + t3 + t4 + t5
           
           li =~ 1*i
           ls =~ 1*s
           ls ~~ li
          
          i~~ 0*i
          s~~0*s
            li~0
           ls~0
          
           endoAbility =~ 1*ability + NA*i + NA*s
           endoAbility ~~ 0*endoAbility

           li ~~ 0*endoAbility
           ls ~~ 0*endoAbility

           t0 ~~ t1
           t1 ~~ t2
           t2 ~~ t3
           t3 ~~ t4
           t4 ~~ t5
'

lower <- '
1
.77 1 
.59 .81 1
.50 .72 .89 1
.48 .69 .84 .91 1
.46 .68 .80 .88 .93 1
.5 .46 .36 .26 .28 .28 1
'
meansCurve <- c(11.77, 21.39, 27.50, 31.02, 32.58, 34.20, .7)

covCurve <- getCov(lower,names=c("t0","t1","t2","t3","t4","t5", "ability"))


#Fit to Curved
message("Testing Model(",modelName,") with curved growth data:")
fitCurved <- growth(model, sample.cov = covCurve, sample.nobs = 137, sample.mean = meansCurve)
summary(fitCurved,fit.measures = TRUE,  standardized=TRUE)
semPaths(fitCurved,what="col",whatLabels="est")