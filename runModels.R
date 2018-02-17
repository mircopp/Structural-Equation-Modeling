#Fit to linear
message("Testing Model(",modelName,") with linear growth data:")
fitLin <- growth(model, data=datLin)
summary(fitLin,fit.measures = TRUE)
semPaths(fitLin,what="col",whatLabels="est")

#Fit to Poly
message("Testing Model(",modelName,") with polynominal growth data:")
fitPoly <- growth(model, data=datPoly)
summary(fitPoly,fit.measures = TRUE)
semPaths(fitPoly,what="col",whatLabels="est")

#Fit to Curved
message("Testing Model(",modelName,") with curved growth data:")
fitCurved <- growth(model, sample.cov = covCurve, sample.nobs = 137, sample.mean = meansCurve)
summary(fitCurved,fit.measures = TRUE)
semPaths(fitCurved,what="col",whatLabels="est")