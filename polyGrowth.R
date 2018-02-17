source("models.R")
modelName <- "Polynominal Growth model - 2 latent slopes"

model <- ' i =~ 1*t0 + 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5
s =~ 0*t0 + 1*t1 + 2*t2 + 3*t3 + 4*t4 + 5*t5
s2 =~ 0*t0 + 1*t1 + 4*t2 + 9*t3 + 16*t4 + 25*t5
           t0 ~~ t1
           t1 ~~ t2
           t2 ~~ t3
           t3 ~~ t4
           t4 ~~ t5'


source("runModels.R")
 
modelName <- "Polynominal Growth model - 1 latent slope"

model <- ' i =~ 1*t0 + 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5
s2 =~ 0*t0 + 1*t1 + 4*t2 + 9*t3 + 16*t4 + 25*t5
t0 ~~ t1
t1 ~~ t2
t2 ~~ t3
t3 ~~ t4
t4 ~~ t5'


source("runModels.R")
