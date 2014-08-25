# Question 5
# You can use the quantmod (http://www.quantmod.com/) package to get historical stock prices for publicly 
# traded companies on the NASDAQ and NYSE. U
# se the following code to download data on Amazon's stock price and get the times the data was sampled.
# library(quantmod)
# amzn = getSymbols("AMZN",auto.assign=FALSE)
# sampleTimes = index(amzn) 
# How many values were collected in 2012? How many values were collected on Mondays in 2012?



library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn) 

values_2012 <- sampleTimes[grep("^2012", sampleTimes)]
length(values_2012)
# [1] 250

format_times <- format(values_2012, "%a %b %d %Y")
length(grep("^lun", format_times))
#47
#Notice: lun instead of mon