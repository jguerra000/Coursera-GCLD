# Question 2
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Remove the commas from the GDP numbers in millions of dollars and average them. What is the average? 
# 
# Original data sources: http://data.worldbank.org/data-catalog/GDP-ranking-table


download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ", destfile = "./GDP_data.csv")
data <- read.csv("./GDP_data.csv") 
cleanedData <- gsub(",", "", data[5:194, 5])
numData <- as.numeric(cleanedData)
mean(numData)
# 377652.4

#Question 3 
# In the data set from Question 2 what is a regular expression that 
# would allow you to count the number of countries whose name begins with "United"? 
# Assume that the variable with the country names in it is named countryNames. 
# How many countries begin with United?

countryNames <- data[5:194, 4]
grep("^United", countryNames)
# [1]  1  6 32