url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for" 
data <- read.fwf("./data//getdata-wksst8110.for", widths = c(33, 3, 80), sep = "\n")
d <- data[[1]]