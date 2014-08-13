# Quiz 3.3

# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Load the educational data from this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
# 
# Match the data based on the country shortcode. How many of the IDs match? Sort the data frame in descending order by GDP rank (so United States is last). What is the 13th country in the resulting data frame? 
# 
# Original data sources: 
#   http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats

download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ", 
              destfile = "./data/grossDomesticProductData.csv")
download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv  ", 
              destfile = "./data/educacionalData.csv")

# "product_data <- read.table( "./data/grossDomesticProductData.csv", header=TRUE, skip=5)

product_data <- read.table( "./data/grossDomesticProductData.csv",    skip=5, , sep = ",", 
                            quote = "", na.strings="NA", fill=TRUE, nrows=231)

edu_data <- read.csv("./data/educacionalData.csv")

merged_data <- merge ( edu_data, product_data, by.x = "CountryCode", by.y = "V1", all=FALSE)

# merged_ordered_data <- merged_data[order(merged_data$Gross.domestic.product.2012), na.last = NA, decreasing=TRUE),]
merged_ordered_data <- merged_data[order(merged_data$V2, na.last = NA, decreasing=TRUE),]
merged_ordered_data[13,]

#Answer:
# 189, KNA

# 3.4
# What is the average GDP ranking for the "High income: OECD" and "High income: nonOECD" group?
split_data <- split(merged_ordered_data, merged_ordered_data$Income.Group)
mean(split_data$"High income: OECD"$V2)
mean(split_data$"High income: nonOECD"$V2)
# Answer
# 32.96667
# 91.91304


#3.5
# Cut the GDP ranking into 5 separate quantile groups. 
# Make a table versus Income.Group. 
# How many countries are Lower middle income but among the 38 nations with highest GDP?

table(cut(merged_ordered_data$V2, breaks = quantile(merged_ordered_data$V2, probs = c(0,0.2, 0.4, 0.6, 0.8, 1))), merged_ordered_data$Income.Group)

# Answer = 5
