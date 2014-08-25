# Question 4
# Load the Gross Domestic Product data for the 190 ranked countries in this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv 
# 
# Load the educational data from this data set: 
#   
#   https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv 
# 
# Match the data based on the country shortcode. Of the countries for which the end of the fiscal year is available, how many end in June? 
# 
# Original data sources: 
#   http://data.worldbank.org/data-catalog/GDP-ranking-table 
# http://data.worldbank.org/data-catalog/ed-stats

# 
# download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv ", 
#               destfile = "./data/grossDomesticProductData.csv")
# download.file("http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv  ", 
#               destfile = "./data/educacionalData.csv")


gpd_data <- read.table( "./data/grossDomesticProductData.csv",    skip=5, , sep = ",", 
                            quote = "", na.strings="NA", fill=TRUE, nrows=231)

edu_data <- read.csv("./data/educacionalData.csv")

merged_data <- merge ( edu_data, gpd_data, by.x = "CountryCode", by.y = "V1", all=FALSE)
length(grep("^Fiscal year end: June", merged_data$Special.Notes))
#13
# [1]  11  18  31  58  74 102 109 157 164 179 189 206 224
