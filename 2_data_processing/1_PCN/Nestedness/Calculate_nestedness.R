# https://www.rdocumentation.org/packages/RInSp/versions/1.2.4/topics/NODF
# https://rdrr.io/cran/RInSp/man/NODF.html

# install.packages("RInSp")

library(RInSp)
library(plyr)
library(readr)

##########

setwd("~/2_data_processing/1_PCN/PCN_tables_0_1")

# Calculate nestedness for all samples
mydir = "."
myfiles = list.files(path=mydir, pattern="*.csv", full.names=TRUE)

Nesting <- data.frame()

for (i in 1:length(myfiles)) {
  data <- t(read.csv(myfiles[i], header = T, row.names = 1))
  Nest.data <- import.RInSp(data)
  Nesting[i,1] <- myfiles[i]
  print(paste0(myfiles[i], " NODF value calculating..."))
  Nesting[i,2] <- NODF(Nest.data)$NODF/100
}

# Nestedness numbers
write.table(Nesting, "Nestedness_PCN.txt", sep='\t')

