url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for" 
data <- read.fwf("./data//getdata-wksst8110.for", widths = c(10, -5, 4, -1, 3, -5, 4, -1, 3, 5),  skip = 4)
head(data)
sum(data[,4])
##Answer: 32426.7