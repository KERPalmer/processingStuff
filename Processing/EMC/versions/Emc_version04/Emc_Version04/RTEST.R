setwd("/Users/kenanpalmer/Documents/Processing/EMC/versions/Emc_version04/Emc_Version04")
my_data <- scan("data/Results.txt",what="", sep="\n")
# Separate elements by one or more whitepace
y <- strsplit(my_data, "[[:space:]]+")
blue=list()
red=list()
bias=list()
for (i in y){
  blue=append(blue,i[1])
  red=append(red,i[2])
  bias=append(bias,i[3])
}
DF = data.frame(blueAlive = c(blue), redAlive = c(red),redBais = c(bias))
View(DF)
