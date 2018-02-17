modelName <- "Non-Linear Growth Model"

model <- ' i =~ 1*t0+ 1*t1 + 1*t2 + 1*t3 + 1*t4 + 1*t5 
           s =~ 0*t0 + 1*t1 + t2 + t3 + t4 + t5
           t0 ~~ t1
           t1 ~~ t2
           t2 ~~ t3
           t3 ~~ t4
           t4 ~~ t5
'

source("models.R")
source("runModels.R")