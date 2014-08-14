# Question 2
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
# 
# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table


download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ", destfile = "./GDP_data.csv")
GDP_data <- read.table( "./GDP_data.csv",    skip=5, , sep = "", 
                            quote = "", na.strings="NA", fill=TRUE, nrows=231, colClasses = "character")


