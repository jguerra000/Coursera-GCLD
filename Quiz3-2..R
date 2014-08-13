#Quiz 3.2 
#Using the jpeg package read in the following picture of your instructor into R 
#Use the parameter native=TRUE. What are the 30th and 80th quantiles of the resulting data? 

download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg ", destfile = "./data/image.jpg")
library(jpeg)
img <- readJPEG("./data/image.jpg", native = TRUE)
quantile (img, probs = c(0.3, 0.8))
#Answer
#30%       80% 
#  -15259150 -10575416 